##################
#			     #
#			     #
#	My BASHRC	 #
# 			     #
##################

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
PS1="\e[1;33m[\u@\h\e[1;32m][\w]\e[1;33m\$\e[0m ";
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
#[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
#PS1='[\u@\h \W]\$ '

#Powerline#
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
#. /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
####################################################

#export#
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"


#nnn#
PAGER=more
export NNN_FALLBACK_OPENER=xdg-open
export TERM="tmux-256color"

#GTK
export GDK_BACKEND=wayland
#export CLUTTER_BACKEND=wayland
#Qt (should use wayland by default)
#export QT_QPA_PLATFORM=xcb
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#SDL
#export SDL_VIDEODRIVER=wayland
#Java
export _JAVA_AWT_WM_NONREPARENTING=1
### Theming
#
export QT_QPA_PLATFORMTHEME="qt5ct"
gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors
gsettings set org.gnome.desktop.interface icon-theme papirus-dark
gsettings set org.gnome.desktop.interface gtk-theme arc-dark





#Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)
#
#Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

#To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

#Add local 'pip' to PATH:
# (In your .bashrc, .zshrc etc)
export PATH="${PATH}:${HOME}/.local/bin/"

#Aliases#
alias cal=calcurse
alias ra=ranger
alias ncm=ncmpcpp
alias untar="tar -zxvf "
alias vim="nvim"
alias n="nnn"
alias dmen="dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15""
alias nf="neofetch"
alias usdo="sudo"
alias pm="pulsemixer"
alias lzd="lazydocker"
alias gt="gotop"
alias gc="git clone"
alias msri="makepkg -sri"
alias ls='ls --color=auto'
alias bluray="mpv bd:// --bluray-device="
alias trancli="transmission-remote-cli"
alias transd="transmission-daemon"
alias deemixf=" deemix -b flac"
alias nb="newsboat"
alias sourcetmux="tmux source-file ~/.tmux.conf"

#mpd#
alias mn="mpc next"
alias mp="mpc prev"
alias mpp="mpc pause"
alias mpl="mpc play"
alias mps="mpc stop"

#Xmonad#
alias xreco="xmonad --recompile"
alias xrest="xmonad --restart"
alias ghcixm="ghci ~/.xmonad/xmonad.hs"


#Tmux#
alias tmx="tmux -2"
alias tmlw="tmux list-windows"
alias tmkst="tmux kill-session -t"
alias tmls="tmux ls"



#Python#
alias pilu="pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs -n1 pip install --user -U"


#Pacman/aur#
alias pacup="sudo pacman -Syy && sudo pacman -Syu"
alias pacsy="sudo pacman -Sy"
alias pacrc="sudo pacman -Rcns"
alias auyrc="yay -Rcns --aur"
alias auy="yay -Syy --aur && yay -Syu --aur"
alias ausy="yay -Sy --aur"
alias sp="sudo pacman"

#Grub/mkinitcpio#
alias grub="sudo -E nvim /etc/default/grub"
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mklinux="sudo mkinitcpio -p linux"
alias mklinux-lts="sudo mkinitcpio -p linux-lts"

#Systmectl#
alias SSE="sudo systemctl enable"
alias SS="sudo systemctl"
alias SSS="sudo systemctl status"
alias SSR="sudo systemctl restart"
alias SST="sudo systemctl start"
alias SSD="sudo systemctl disable"
alias sur="systemctl --user restart"
alias sus="systemctl --user status"
alias su="systemctl --user"
alias sue="systemctl --user enable"
alias sust="systemctl --user start"
alias suss="systemctl --user status"
alias sust="systemctl --user stop"
alias sd="systemctl --user restart dunst"
alias sud="systemctl --user disable"

#Phone#
alias sff="sudo fastboot flash"
alias sfr="sudo fastboot reboot"
alias smd="simple-mtpfs --device 1 ~/.phone"

#Commands#
alias lsa="ls -a"
alias c=clear
alias mkd="mkdir"
alias xxr="xrdb ~/.Xresources"
alias xxd="xrdb ~/.Xdefaults"
alias ka="killall"
alias pkt="pkill -f tmux"
alias code='GDK_BACKEND=x11 /usr/bin/code 2>/dev/null'
alias rmrf="rm -rf"
alias basc="chmod +x"

#sudo Commands#
alias sduo="sudo"
alias reboot="sudo reboot"
alias suspend="sudo pm-suspend"
alias smkd="sudo mkdir"
alias pkex="pkexec chown root:root /etc/sudoers /etc/sudoers.d -R"

#Internet#
alias getpass="openssl rand -base64 20"
alias sha="shasum -a 256 "
alias ping="ping -c 5"
alias speed="speedtest-cli --server 2406 --simple"
alias twitch="streamlink -p mpv"

#nvim#
alias visc="nvim ~/.config/sway/config"
alias sev="sudo -E nvim"
alias cre="crontab -e"
alias vi3="nvim /home/m/.config/i3/config"
alias vp="nvim /home/m/.config/polybar/config"
alias fstab="sudo -E nvim /etc/fstab"
alias bashrc="nvim  ~/.bashrc && source ~/.bashrc" 
alias xmhs="nvim ~/.xmonad/xmonad.hs"
alias xmb="nvim ~/.xmobarrc"
alias vimrc="nvim ~/.vimrc"

#wireguard#
alias vpn="cd ~/Downloads/mullvad/mullvad_wireguard_linux_ca_all && sudo wg-quick up mullvad-ca2.conf && cd"

#wifi#
alias wifi="sudo netctl start wlp3s0Shimachat2"
alias wifistatus="sudo netctl status wlp3s0Shimachat2"
alias wifistop="sudo netctl stop wlp3s0Shimachat2"

#source ~/.shortcuts
PATH=$PATH:~/.cabal/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#ACO system-wide
export RADV_PERFTEST=aco

MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1



. "$HOME/.cargo/env"
