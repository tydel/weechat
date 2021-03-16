SET(WEECHAT_SOURCES
./doc/docgen.py
./src/core/hook/wee-hook-command-run.c
./src/core/hook/wee-hook-command-run.h
./src/core/hook/wee-hook-command.c
./src/core/hook/wee-hook-command.h
./src/core/hook/wee-hook-completion.c
./src/core/hook/wee-hook-completion.h
./src/core/hook/wee-hook-config.c
./src/core/hook/wee-hook-config.h
./src/core/hook/wee-hook-connect.c
./src/core/hook/wee-hook-connect.h
./src/core/hook/wee-hook-fd.c
./src/core/hook/wee-hook-fd.h
./src/core/hook/wee-hook-focus.c
./src/core/hook/wee-hook-focus.h
./src/core/hook/wee-hook-hdata.c
./src/core/hook/wee-hook-hdata.h
./src/core/hook/wee-hook-hsignal.c
./src/core/hook/wee-hook-hsignal.h
./src/core/hook/wee-hook-info-hashtable.c
./src/core/hook/wee-hook-info-hashtable.h
./src/core/hook/wee-hook-info.c
./src/core/hook/wee-hook-info.h
./src/core/hook/wee-hook-infolist.c
./src/core/hook/wee-hook-infolist.h
./src/core/hook/wee-hook-line.c
./src/core/hook/wee-hook-line.h
./src/core/hook/wee-hook-modifier.c
./src/core/hook/wee-hook-modifier.h
./src/core/hook/wee-hook-print.c
./src/core/hook/wee-hook-print.h
./src/core/hook/wee-hook-process.c
./src/core/hook/wee-hook-process.h
./src/core/hook/wee-hook-signal.c
./src/core/hook/wee-hook-signal.h
./src/core/hook/wee-hook-timer.c
./src/core/hook/wee-hook-timer.h
./src/core/wee-arraylist.c
./src/core/wee-arraylist.h
./src/core/wee-backtrace.c
./src/core/wee-backtrace.h
./src/core/weechat.c
./src/core/weechat.h
./src/core/wee-calc.c
./src/core/wee-calc.h
./src/core/wee-command.c
./src/core/wee-command.h
./src/core/wee-completion.c
./src/core/wee-completion.h
./src/core/wee-config.c
./src/core/wee-config-file.c
./src/core/wee-config-file.h
./src/core/wee-config.h
./src/core/wee-crypto.c
./src/core/wee-crypto.h
./src/core/wee-debug.c
./src/core/wee-debug.h
./src/core/wee-eval.c
./src/core/wee-eval.h
./src/core/wee-hook.c
./src/core/wee-hook.h
./src/core/wee-infolist.c
./src/core/wee-infolist.h
./src/core/wee-input.c
./src/core/wee-input.h
./src/core/wee-list.c
./src/core/wee-list.h
./src/core/wee-log.c
./src/core/wee-log.h
./src/core/wee-network.c
./src/core/wee-network.h
./src/core/wee-proxy.c
./src/core/wee-proxy.h
./src/core/wee-secure.c
./src/core/wee-secure.h
./src/core/wee-secure-buffer.c
./src/core/wee-secure-buffer.h
./src/core/wee-secure-config.c
./src/core/wee-secure-config.h
./src/core/wee-signal.c
./src/core/wee-signal.h
./src/core/wee-string.c
./src/core/wee-string.h
./src/core/wee-upgrade.c
./src/core/wee-upgrade-file.c
./src/core/wee-upgrade-file.h
./src/core/wee-upgrade.h
./src/core/wee-url.c
./src/core/wee-url.h
./src/core/wee-utf8.c
./src/core/wee-utf8.h
./src/core/wee-util.c
./src/core/wee-util.h
./src/core/wee-version.c
./src/core/wee-version.h
./src/gui/curses/gui-curses-bar-window.c
./src/gui/curses/gui-curses-chat.c
./src/gui/curses/gui-curses-color.c
./src/gui/curses/gui-curses.h
./src/gui/curses/gui-curses-key.c
./src/gui/curses/gui-curses-main.c
./src/gui/curses/gui-curses-mouse.c
./src/gui/curses/gui-curses-window.c
./src/gui/curses/normal/main.c
./src/gui/curses/headless/main.c
./src/gui/gui-bar.c
./src/gui/gui-bar.h
./src/gui/gui-bar-item.c
./src/gui/gui-bar-item.h
./src/gui/gui-bar-window.c
./src/gui/gui-bar-window.h
./src/gui/gui-buffer.c
./src/gui/gui-buffer.h
./src/gui/gui-chat.c
./src/gui/gui-chat.h
./src/gui/gui-color.c
./src/gui/gui-color.h
./src/gui/gui-completion.c
./src/gui/gui-completion.h
./src/gui/gui-cursor.c
./src/gui/gui-cursor.h
./src/gui/gui-filter.c
./src/gui/gui-filter.h
./src/gui/gui-focus.c
./src/gui/gui-focus.h
./src/gui/gui-history.c
./src/gui/gui-history.h
./src/gui/gui-hotlist.c
./src/gui/gui-hotlist.h
./src/gui/gui-input.c
./src/gui/gui-input.h
./src/gui/gui-key.c
./src/gui/gui-key.h
./src/gui/gui-layout.c
./src/gui/gui-layout.h
./src/gui/gui-line.c
./src/gui/gui-line.h
./src/gui/gui-main.h
./src/gui/gui-mouse.c
./src/gui/gui-mouse.h
./src/gui/gui-nick.c
./src/gui/gui-nick.h
./src/gui/gui-nicklist.c
./src/gui/gui-nicklist.h
./src/gui/gui-window.c
./src/gui/gui-window.h
./src/plugins/alias/alias.c
./src/plugins/alias/alias-command.c
./src/plugins/alias/alias-command.h
./src/plugins/alias/alias-completion.c
./src/plugins/alias/alias-completion.h
./src/plugins/alias/alias-config.c
./src/plugins/alias/alias-config.h
./src/plugins/alias/alias.h
./src/plugins/alias/alias-info.c
./src/plugins/alias/alias-info.h
./src/plugins/buflist/buflist-bar-item.c
./src/plugins/buflist/buflist-bar-item.h
./src/plugins/buflist/buflist.c
./src/plugins/buflist/buflist-command.c
./src/plugins/buflist/buflist-command.h
./src/plugins/buflist/buflist-config.c
./src/plugins/buflist/buflist-config.h
./src/plugins/buflist/buflist-info.c
./src/plugins/buflist/buflist-info.h
./src/plugins/buflist/buflist-mouse.c
./src/plugins/buflist/buflist-mouse.h
./src/plugins/buflist/buflist.h
./src/plugins/charset/charset.c
./src/plugins/exec/exec.c
./src/plugins/exec/exec-buffer.c
./src/plugins/exec/exec-buffer.h
./src/plugins/exec/exec-command.c
./src/plugins/exec/exec-command.h
./src/plugins/exec/exec-completion.c
./src/plugins/exec/exec-completion.h
./src/plugins/exec/exec-config.c
./src/plugins/exec/exec-config.h
./src/plugins/exec/exec.h
./src/plugins/fifo/fifo.c
./src/plugins/fifo/fifo.h
./src/plugins/fifo/fifo-command.c
./src/plugins/fifo/fifo-command.h
./src/plugins/fifo/fifo-config.c
./src/plugins/fifo/fifo-config.h
./src/plugins/fifo/fifo-info.c
./src/plugins/fifo/fifo-info.h
./src/plugins/fset/fset-bar-item.c
./src/plugins/fset/fset-bar-item.h
./src/plugins/fset/fset-buffer.c
./src/plugins/fset/fset-buffer.h
./src/plugins/fset/fset-command.c
./src/plugins/fset/fset-command.h
./src/plugins/fset/fset-completion.c
./src/plugins/fset/fset-completion.h
./src/plugins/fset/fset-config.c
./src/plugins/fset/fset-config.h
./src/plugins/fset/fset-info.c
./src/plugins/fset/fset-info.h
./src/plugins/fset/fset-mouse.c
./src/plugins/fset/fset-mouse.h
./src/plugins/fset/fset-option.c
./src/plugins/fset/fset-option.h
./src/plugins/fset/fset.c
./src/plugins/fset/fset.h
./src/plugins/guile/weechat-guile-api.c
./src/plugins/guile/weechat-guile-api.h
./src/plugins/guile/weechat-guile.c
./src/plugins/guile/weechat-guile.h
./src/plugins/irc/irc-bar-item.c
./src/plugins/irc/irc-bar-item.h
./src/plugins/irc/irc-buffer.c
./src/plugins/irc/irc-buffer.h
./src/plugins/irc/irc.c
./src/plugins/irc/irc-channel.c
./src/plugins/irc/irc-channel.h
./src/plugins/irc/irc-color.c
./src/plugins/irc/irc-color.h
./src/plugins/irc/irc-command.c
./src/plugins/irc/irc-command.h
./src/plugins/irc/irc-completion.c
./src/plugins/irc/irc-completion.h
./src/plugins/irc/irc-config.c
./src/plugins/irc/irc-config.h
./src/plugins/irc/irc-ctcp.c
./src/plugins/irc/irc-ctcp.h
./src/plugins/irc/irc-debug.c
./src/plugins/irc/irc-debug.h
./src/plugins/irc/irc.h
./src/plugins/irc/irc-ignore.c
./src/plugins/irc/irc-ignore.h
./src/plugins/irc/irc-info.c
./src/plugins/irc/irc-info.h
./src/plugins/irc/irc-input.c
./src/plugins/irc/irc-input.h
./src/plugins/irc/irc-message.c
./src/plugins/irc/irc-message.h
./src/plugins/irc/irc-mode.c
./src/plugins/irc/irc-mode.h
./src/plugins/irc/irc-modelist.c
./src/plugins/irc/irc-modelist.h
./src/plugins/irc/irc-msgbuffer.c
./src/plugins/irc/irc-msgbuffer.h
./src/plugins/irc/irc-nick.c
./src/plugins/irc/irc-nick.h
./src/plugins/irc/irc-notify.c
./src/plugins/irc/irc-notify.h
./src/plugins/irc/irc-protocol.c
./src/plugins/irc/irc-protocol.h
./src/plugins/irc/irc-raw.c
./src/plugins/irc/irc-raw.h
./src/plugins/irc/irc-redirect.c
./src/plugins/irc/irc-redirect.h
./src/plugins/irc/irc-sasl.c
./src/plugins/irc/irc-sasl.h
./src/plugins/irc/irc-server.c
./src/plugins/irc/irc-server.h
./src/plugins/javascript/weechat-js-api.cpp
./src/plugins/javascript/weechat-js-api.h
./src/plugins/javascript/weechat-js-v8.cpp
./src/plugins/javascript/weechat-js-v8.h
./src/plugins/javascript/weechat-js.cpp
./src/plugins/javascript/weechat-js.h
./src/plugins/logger/logger-backlog.c
./src/plugins/logger/logger-backlog.h
./src/plugins/logger/logger-buffer.c
./src/plugins/logger/logger-buffer.h
./src/plugins/logger/logger.c
./src/plugins/logger/logger-command.c
./src/plugins/logger/logger-command.h
./src/plugins/logger/logger-config.c
./src/plugins/logger/logger-config.h
./src/plugins/logger/logger.h
./src/plugins/logger/logger-info.c
./src/plugins/logger/logger-info.h
./src/plugins/logger/logger-tail.c
./src/plugins/logger/logger-tail.h
./src/plugins/lua/weechat-lua-api.c
./src/plugins/lua/weechat-lua-api.h
./src/plugins/lua/weechat-lua.c
./src/plugins/lua/weechat-lua.h
./src/plugins/perl/weechat-perl-api.c
./src/plugins/perl/weechat-perl-api.h
./src/plugins/perl/weechat-perl.c
./src/plugins/perl/weechat-perl.h
./src/plugins/php/weechat-php-api.c
./src/plugins/php/weechat-php-api.h
./src/plugins/php/weechat-php.c
./src/plugins/php/weechat-php.h
./src/plugins/plugin-api.c
./src/plugins/plugin-api.h
./src/plugins/plugin-api-info.c
./src/plugins/plugin-api-info.h
./src/plugins/plugin.c
./src/plugins/plugin-config.c
./src/plugins/plugin-config.h
./src/plugins/plugin.h
./src/plugins/plugin-script-api.c
./src/plugins/plugin-script-api.h
./src/plugins/plugin-script-config.c
./src/plugins/plugin-script-config.h
./src/plugins/plugin-script.c
./src/plugins/plugin-script.h
./src/plugins/python/weechat-python-api.c
./src/plugins/python/weechat-python-api.h
./src/plugins/python/weechat-python.c
./src/plugins/python/weechat-python.h
./src/plugins/relay/irc/relay-irc.c
./src/plugins/relay/irc/relay-irc.h
./src/plugins/relay/relay-auth.c
./src/plugins/relay/relay-auth.h
./src/plugins/relay/relay-buffer.c
./src/plugins/relay/relay-buffer.h
./src/plugins/relay/relay.c
./src/plugins/relay/relay-client.c
./src/plugins/relay/relay-client.h
./src/plugins/relay/relay-command.c
./src/plugins/relay/relay-command.h
./src/plugins/relay/relay-completion.c
./src/plugins/relay/relay-completion.h
./src/plugins/relay/relay-config.c
./src/plugins/relay/relay-config.h
./src/plugins/relay/relay.h
./src/plugins/relay/relay-info.c
./src/plugins/relay/relay-info.h
./src/plugins/relay/relay-network.c
./src/plugins/relay/relay-network.h
./src/plugins/relay/relay-raw.c
./src/plugins/relay/relay-raw.h
./src/plugins/relay/relay-server.c
./src/plugins/relay/relay-server.h
./src/plugins/relay/relay-upgrade.c
./src/plugins/relay/relay-upgrade.h
./src/plugins/relay/relay-websocket.c
./src/plugins/relay/relay-websocket.h
./src/plugins/relay/weechat/relay-weechat.c
./src/plugins/relay/weechat/relay-weechat.h
./src/plugins/relay/weechat/relay-weechat-msg.c
./src/plugins/relay/weechat/relay-weechat-msg.h
./src/plugins/relay/weechat/relay-weechat-nicklist.c
./src/plugins/relay/weechat/relay-weechat-nicklist.h
./src/plugins/relay/weechat/relay-weechat-protocol.c
./src/plugins/relay/weechat/relay-weechat-protocol.h
./src/plugins/ruby/weechat-ruby-api.c
./src/plugins/ruby/weechat-ruby-api.h
./src/plugins/ruby/weechat-ruby.c
./src/plugins/ruby/weechat-ruby.h
./src/plugins/script/script-action.c
./src/plugins/script/script-action.h
./src/plugins/script/script-buffer.c
./src/plugins/script/script-buffer.h
./src/plugins/script/script.c
./src/plugins/script/script-command.c
./src/plugins/script/script-command.h
./src/plugins/script/script-completion.c
./src/plugins/script/script-completion.h
./src/plugins/script/script-config.c
./src/plugins/script/script-config.h
./src/plugins/script/script.h
./src/plugins/script/script-info.c
./src/plugins/script/script-info.h
./src/plugins/script/script-mouse.c
./src/plugins/script/script-mouse.h
./src/plugins/script/script-repo.c
./src/plugins/script/script-repo.h
./src/plugins/spell/spell-bar-item.c
./src/plugins/spell/spell-bar-item.h
./src/plugins/spell/spell.c
./src/plugins/spell/spell-command.c
./src/plugins/spell/spell-command.h
./src/plugins/spell/spell-completion.c
./src/plugins/spell/spell-completion.h
./src/plugins/spell/spell-config.c
./src/plugins/spell/spell-config.h
./src/plugins/spell/spell.h
./src/plugins/spell/spell-info.c
./src/plugins/spell/spell-info.h
./src/plugins/spell/spell-speller.c
./src/plugins/spell/spell-speller.h
./src/plugins/tcl/weechat-tcl-api.c
./src/plugins/tcl/weechat-tcl-api.h
./src/plugins/tcl/weechat-tcl.c
./src/plugins/tcl/weechat-tcl.h
./src/plugins/trigger/trigger.c
./src/plugins/trigger/trigger-buffer.c
./src/plugins/trigger/trigger-buffer.h
./src/plugins/trigger/trigger-callback.c
./src/plugins/trigger/trigger-callback.h
./src/plugins/trigger/trigger-command.c
./src/plugins/trigger/trigger-command.h
./src/plugins/trigger/trigger-completion.c
./src/plugins/trigger/trigger-completion.h
./src/plugins/trigger/trigger-config.c
./src/plugins/trigger/trigger-config.h
./src/plugins/trigger/trigger.h
./src/plugins/weechat-plugin.h
./src/plugins/xfer/xfer-buffer.c
./src/plugins/xfer/xfer-buffer.h
./src/plugins/xfer/xfer.c
./src/plugins/xfer/xfer-chat.c
./src/plugins/xfer/xfer-chat.h
./src/plugins/xfer/xfer-command.c
./src/plugins/xfer/xfer-command.h
./src/plugins/xfer/xfer-completion.c
./src/plugins/xfer/xfer-completion.h
./src/plugins/xfer/xfer-config.c
./src/plugins/xfer/xfer-config.h
./src/plugins/xfer/xfer-dcc.c
./src/plugins/xfer/xfer-dcc.h
./src/plugins/xfer/xfer-file.c
./src/plugins/xfer/xfer-file.h
./src/plugins/xfer/xfer.h
./src/plugins/xfer/xfer-info.c
./src/plugins/xfer/xfer-info.h
./src/plugins/xfer/xfer-network.c
./src/plugins/xfer/xfer-network.h
./src/plugins/xfer/xfer-upgrade.c
./src/plugins/xfer/xfer-upgrade.h
)
