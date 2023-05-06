#!/bin/sh
# Profile file. Runs on login.

# Japanese input
#QT_IM_MODULE=fcitx
#XMODIFIERS=@im=fcitx
#GTK_IM_MODULE=fcitx

dbus-update-activation-environment --systemd --all
#GDK_BACKEND=x11
#export SDL_VIDEODRIVER=wayland
#export $DISPLAY 

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
	 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH=$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')


export CALIBRE_USE_SYSTEM_THEME=1
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}

#[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] 

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export EDITOR="nvim"
#export EDITOR="vim"
export BROWSER="firefox"
export READER="zathura"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/m/.scripts/i3cmds:/home/m/.scripts/tools:/home/m/.scripts/statusbar:/home/m/.scripts/cron:/home/m/.scripts/:/home/m/.local/bin/:/home/m/.cabal/bin:/home/m/.fzf/bin:~/.cabal/bin

PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
