export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

export NNN_FCOLORS='030304020006060801050501'
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export SYSTEMD_EDITOR="/bin/nvim"
#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi

#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi
# If running from tty1 start sway
#if [ "$(tty)" = "/dev/tty1" ]; then
#	exec sway
#fi

#if [ "$(tty)" = "/dev/tty2" ]; then 
#        exec dbus-run-session startplasma-wayland
#fi

#if [ "$(tty)" = "/dev/tty3" ]; then 
#        exec dbus-run-session gnome-session
#fi


SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

MOZ_ENABLE_WAYLAND=1
