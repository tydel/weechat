/*
 * Copyright (c) 2003-2007 by FlashCode <flashcode@flashtux.org>
 * See README for License detail, AUTHORS for developers list.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

/* irc-nick.c: manages nick list for channels */


#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <stdlib.h>
#include <string.h>
#include <limits.h>

#include "../common/weechat.h"
#include "irc.h"
#include "../common/log.h"
#include "../common/utf8.h"
#include "../common/util.h"
#include "../common/weeconfig.h"


/*
 * nick_find_color: find a color for a nick (according to nick letters)
 */

int
nick_find_color (t_irc_nick *nick)
{
    int i, color;
    
    color = 0;
    for (i = strlen (nick->nick) - 1; i >= 0; i--)
    {
        color += (int)(nick->nick[i]);
    }
    color = (color % cfg_look_color_nicks_number);
    
    return COLOR_WIN_NICK_1 + color;
}

/*
 * nick_score_for_sort: return score for sorting nick, according to privileges
 */

int
nick_score_for_sort (t_irc_nick *nick)
{
    if (nick->flags & NICK_CHANOWNER)
        return -64;
    if (nick->flags & NICK_CHANADMIN)
        return -32;
    if (nick->flags & NICK_CHANADMIN2)
        return -16;
    if (nick->flags & NICK_OP)
        return -8;
    if (nick->flags & NICK_HALFOP)
        return -4;
    if (nick->flags & NICK_VOICE)
        return -2;
    return 0;
}

/*
 * nick_compare: compare two nicks
 *               return: -1 is nick1 < nick2
 *                        0 if nick1 = nick2
 *                       +1 if nick1 > nick2
 *               status sort: operator > voice > normal nick
 */

int
nick_compare (t_irc_nick *nick1, t_irc_nick *nick2)
{
    int score1, score2, comp;
    
    score1 = nick_score_for_sort (nick1);
    score2 = nick_score_for_sort (nick2);
    
    comp = ascii_strcasecmp (nick1->nick, nick2->nick);
    if (comp > 0)
        score1++;
    if (comp < 0)
        score2++;
    
    /* nick1 > nick2 */
    if (score1 > score2)
        return 1;
    /* nick1 < nick2 */
    if (score1 < score2)
        return -1;
    /* nick1 == nick2 */
    return 0;
}

/*
 * nick_find_pos: find position for a nick (for sorting nick list)
 */

t_irc_nick *
nick_find_pos (t_irc_channel *channel, t_irc_nick *nick)
{
    t_irc_nick *ptr_nick;
    
    for (ptr_nick = channel->nicks; ptr_nick; ptr_nick = ptr_nick->next_nick)
    {
        if (nick_compare (nick, ptr_nick) < 0)
            return ptr_nick;
    }
    return NULL;
}

/*
 * nick_insert_sorted: insert nick into sorted list
 */

void
nick_insert_sorted (t_irc_channel *channel, t_irc_nick *nick)
{
    t_irc_nick *pos_nick;
    
    if (channel->nicks)
    {
        pos_nick = nick_find_pos (channel, nick);
        
        if (pos_nick)
        {
            /* insert nick into the list (before nick found) */
            nick->prev_nick = pos_nick->prev_nick;
            nick->next_nick = pos_nick;
            if (pos_nick->prev_nick)
                pos_nick->prev_nick->next_nick = nick;
            else
                channel->nicks = nick;
            pos_nick->prev_nick = nick;
        }
        else
        {
            /* add nick to the end */
            nick->prev_nick = channel->last_nick;
            nick->next_nick = NULL;
            channel->last_nick->next_nick = nick;
            channel->last_nick = nick;
        }
    }
    else
    {
        nick->prev_nick = NULL;
        nick->next_nick = NULL;
        channel->nicks = nick;
        channel->last_nick = nick;
    }
}

/*
 * nick_resort: resort nick in the list
 */

void
nick_resort (t_irc_channel *channel, t_irc_nick *nick)
{
    /* temporarly remove nick from list */
    if (nick == channel->nicks)
        channel->nicks = nick->next_nick;
    else
        nick->prev_nick->next_nick = nick->next_nick;
    if (nick->next_nick)
        nick->next_nick->prev_nick = nick->prev_nick;
    if (nick == channel->last_nick)
        channel->last_nick = nick->prev_nick;
    
    /* insert again nick into sorted list */
    nick_insert_sorted (channel, nick);
}

/*
 * nick_new: allocate a new nick for a channel and add it to the nick list
 */

t_irc_nick *
nick_new (t_irc_server *server, t_irc_channel *channel, char *nick_name,
          int is_chanowner, int is_chanadmin, int is_chanadmin2, int is_op,
          int is_halfop, int has_voice)
{
    t_irc_nick *new_nick;
    
    /* nick already exists on this channel? */
    if ((new_nick = nick_search (channel, nick_name)))
    {
        /* update nick */
        NICK_SET_FLAG(new_nick, is_chanowner, NICK_CHANOWNER);
        NICK_SET_FLAG(new_nick, is_chanadmin, NICK_CHANADMIN);
        NICK_SET_FLAG(new_nick, is_chanadmin2, NICK_CHANADMIN2);
        NICK_SET_FLAG(new_nick, is_op, NICK_OP);
        NICK_SET_FLAG(new_nick, is_halfop, NICK_HALFOP);
        NICK_SET_FLAG(new_nick, has_voice, NICK_VOICE);
        nick_resort (channel, new_nick);
        return new_nick;
    }
    
    /* alloc memory for new nick */
    if ((new_nick = (t_irc_nick *) malloc (sizeof (t_irc_nick))) == NULL)
        return NULL;
    
    /* initialize new nick */
    new_nick->nick = strdup (nick_name);
    new_nick->host = NULL;
    new_nick->flags = 0;
    NICK_SET_FLAG(new_nick, is_chanowner, NICK_CHANOWNER);
    NICK_SET_FLAG(new_nick, is_chanadmin, NICK_CHANADMIN);
    NICK_SET_FLAG(new_nick, is_chanadmin2, NICK_CHANADMIN2);
    NICK_SET_FLAG(new_nick, is_op, NICK_OP);
    NICK_SET_FLAG(new_nick, is_halfop, NICK_HALFOP);
    NICK_SET_FLAG(new_nick, has_voice, NICK_VOICE);
    if (ascii_strcasecmp (new_nick->nick, server->nick) == 0)
        new_nick->color = COLOR_WIN_NICK_SELF;
    else
        new_nick->color = nick_find_color (new_nick);
    
    nick_insert_sorted (channel, new_nick);
    
    channel->nicks_count++;

    channel->nick_completion_reset = 1;
    
    /* all is ok, return address of new nick */
    return new_nick;
}

/*
 * nick_change: change nickname and move it if necessary (list is sorted)
 */

void
nick_change (t_irc_channel *channel, t_irc_nick *nick, char *new_nick)
{
    int nick_is_me;
    
    nick_is_me = (strcmp (nick->nick, SERVER(channel->buffer)->nick) == 0) ? 1 : 0;
    
    /* change nickname */
    if (nick->nick)
        free (nick->nick);
    nick->nick = strdup (new_nick);
    if (nick_is_me)
        nick->color = COLOR_WIN_NICK_SELF;
    else
        nick->color = nick_find_color (nick);
    
    /* insert again nick into sorted list */
    nick_resort (channel, nick);
}

/*
 * nick_free: free a nick and remove it from nicks queue
 */

void
nick_free (t_irc_channel *channel, t_irc_nick *nick)
{
    t_irc_nick *new_nicks;
    
    if (!channel || !nick)
        return;
    
    /* remove nick from queue */
    if (channel->last_nick == nick)
        channel->last_nick = nick->prev_nick;
    if (nick->prev_nick)
    {
        (nick->prev_nick)->next_nick = nick->next_nick;
        new_nicks = channel->nicks;
    }
    else
        new_nicks = nick->next_nick;
    
    if (nick->next_nick)
        (nick->next_nick)->prev_nick = nick->prev_nick;
    
    channel->nicks_count--;
    
    /* free data */
    if (nick->nick)
        free (nick->nick);
    if (nick->host)
        free (nick->host);
    free (nick);
    channel->nicks = new_nicks;

    channel->nick_completion_reset = 1;
}

/*
 * nick_free_all: free all allocated nicks for a channel
 */

void
nick_free_all (t_irc_channel *channel)
{
    if (!channel)
        return;
    
    /* remove all nicks for the channel */
    while (channel->nicks)
        nick_free (channel, channel->nicks);
    
    /* sould be zero, but prevent any bug :D */
    channel->nicks_count = 0;
}

/*
 * nick_search: returns pointer on a nick
 */

t_irc_nick *
nick_search (t_irc_channel *channel, char *nickname)
{
    t_irc_nick *ptr_nick;
    
    if (!nickname)
        return NULL;
    
    for (ptr_nick = channel->nicks; ptr_nick;
         ptr_nick = ptr_nick->next_nick)
    {
        if (ascii_strcasecmp (ptr_nick->nick, nickname) == 0)
            return ptr_nick;
    }
    return NULL;
}

/*
 * nick_count: returns number of nicks (total, op, halfop, voice) on a channel
 */

void
nick_count (t_irc_channel *channel, int *total, int *count_op,
            int *count_halfop, int *count_voice, int *count_normal)
{
    t_irc_nick *ptr_nick;
    
    (*total) = 0;
    (*count_op) = 0;
    (*count_halfop) = 0;
    (*count_voice) = 0;
    (*count_normal) = 0;
    for (ptr_nick = channel->nicks; ptr_nick;
         ptr_nick = ptr_nick->next_nick)
    {
        (*total)++;
        if ((ptr_nick->flags & NICK_CHANOWNER) ||
            (ptr_nick->flags & NICK_CHANADMIN) ||
            (ptr_nick->flags & NICK_CHANADMIN2) ||
            (ptr_nick->flags & NICK_OP))
            (*count_op)++;
        else
        {
            if (ptr_nick->flags & NICK_HALFOP)
                (*count_halfop)++;
            else
            {
                if (ptr_nick->flags & NICK_VOICE)
                    (*count_voice)++;
                else
                    (*count_normal)++;
            }
        }
    }
}

/*
 * nick_get_max_length: returns longer nickname on a channel
 */

int
nick_get_max_length (t_irc_channel *channel)
{
    int length, max_length;
    t_irc_nick *ptr_nick;
    
    max_length = 0;
    for (ptr_nick = channel->nicks; ptr_nick; ptr_nick = ptr_nick->next_nick)
    {
        length = utf8_width_screen (ptr_nick->nick);
        if (length > max_length)
            max_length = length;
    }
    return max_length;
}

/*
 * nick_set_away: set/unset away status for a channel
 */

void
nick_set_away (t_irc_channel *channel, t_irc_nick *nick, int is_away)
{
    if ((cfg_irc_away_check > 0)
        && ((cfg_irc_away_check_max_nicks == 0) ||
            (channel->nicks_count <= cfg_irc_away_check_max_nicks)))
    {
        if (((is_away) && (!(nick->flags & NICK_AWAY))) ||
            ((!is_away) && (nick->flags & NICK_AWAY)))
        {
            NICK_SET_FLAG(nick, is_away, NICK_AWAY);
            gui_nicklist_draw (channel->buffer, 0, 0);
        }
    }
}

/*
 * nick_print_log: print nick infos in log (usually for crash dump)
 */

void
nick_print_log (t_irc_nick *nick)
{
    weechat_log_printf ("=> nick %s (addr:0x%X)]\n",    nick->nick, nick);
    weechat_log_printf ("     host . . . . . : %s\n",   nick->host);
    weechat_log_printf ("     flags. . . . . : %d\n",   nick->flags);
    weechat_log_printf ("     color. . . . . : %d\n",   nick->color);
    weechat_log_printf ("     prev_nick. . . : 0x%X\n", nick->prev_nick);
    weechat_log_printf ("     next_nick. . . : 0x%X\n", nick->next_nick);
}
