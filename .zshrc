# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/bin/.LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors

#export TERM=st-256color
#export TERM=alacritty
export TERM=xterm-256color
#export TERM=tmux-256color
EDITOR=/bin/nvim
#vim
set -o vi
bindkey -v
bindkey -e
bindkey \^u backward-kill-line

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/default

# Path to your oh-my-zsh installation.
export ZSH="/home/m/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#export#
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

#nnn#
export NNN_FALLBACK_OPENER=xdg-open
export NNN_FCOLORS="$BLK$CHR$DIR$EXEC$FILE$MULTIHARDLINK$LINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_FCOLORS='030304020006060801050501'
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
NNN_PLUG_PERSONAL='g:personal/convert2zoom;p:personal/echo'
NNN_PLUG_INLINE='e:!go run $nnn*'
NNN_PLUG_DEFAULT='1:ipinfo;p:preview-tui;o:fzz;b:nbak'
export XDG_SESSION_TYPE=wayland

#pip
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#Aliases#
alias img2="img2sixel"
alias str=" VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json steam"
alias nb="newsboat"
alias vimpath="nvim +PluginInstall +qall"
alias cal="calcurse"
alias ra="ranger"
alias ncm="ncmpcpp"
alias untar="tar -zxvf "
alias wget="wget -c "
alias vim="nvim"
alias n="nnn"
alias dmen="dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15""
alias nf="neofetch"
alias usdo="sudo"
alias pm="pulsemixer"
alias lzd="lazydocker"
alias gt="gotop"
alias msri="makepkg -sri"
alias ls="ls --color=auto"
alias srm="sudo rm"
alias srf="sudo rm -rf"
alias watch-mem="watch -n 5 free -m"
alias deemix="deemix -b flac"
alias class="swaymsg -t get_tree"
alias app_id="swaymsg -t get_tree | grep "app_id""
alias x11="env GDK_BACKEND=x11"
alias ytdl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --netrc "
alias gadl="gallery-dl --download-archive downloaded.txt"
alias yt="yt-dlp --config-location ~/.config/yt-dlp/config"
alias udevreload="sudo udevadm control --reload-rules"
alias removelockeddatabase="sudo rm /var/lib/pacman/db.lck"
alias joinaudiom4a="for f in *.m4a ; do echo file \'$f\' >> list.txt; done && ffmpeg -f concat -safe 0 -i list.txt -c copy stitched-video.m4a && rm list.txt"
alias anki="QT_QPA_PLATFORM=wayland ANKI_WAYLAND=1 anki"
alias ssha='eval $(ssh-agent) && ssh-add'


#cd#
alias W="cd ~/Work"
alias g="cd ~/Work/git"
alias sc="cd ~/screenshots"
alias wp="cd ~/Wallpapers/1440p-wallpaper-dump/"

#mpd#
alias mn="mpc next"
alias mp="mpc prev"
alias mpp="mpc pause"
alias mpl="mpc play"
alias mps="mpc stop"

#Tmux#
alias tmx="tmux -2" #tmux 256 colors
#alias tmux="TERM=screen-256color-bce tmux"
#alias tmx="tmux"
alias tmlw="tmux list-windows"
alias tmkst="tmux kill-session -t"
alias tmls="tmux ls"
alias tmxsource="tmux source-file ~/.tmux.conf"

#Python#
alias pilu="pip3 freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs -n1 pip install --user -U"
alias update-pip="python -m pip install --upgrade pip --pre"
alias update-setuptoolspy="python3 -m pip install --upgrade pip setuptools wheel"

#Pacman/aur#
alias pacup="sudo pacman -Syy && sudo pacman -Syu"
alias pacsy="sudo pacman -Sy"
alias pacsi="sudo pacman -S"
alias pacrc="sudo pacman -Rcns"
alias pacqi="sudo pacman -Qi"
alias auyrc="yay -Rcns --aur"
alias auy="yay -Syy --aur && yay -Syu --aur"
alias ausy="yay -Sy --aur"
alias sp="sudo pacman"
alias rmdb="sudo rm /var/lib/pacman/db.lck"
alias paci='sudo pacman -S'               # install
alias pachi='sudo pacman -Ql'             # Pacman Has Installed - what files where installed in a package
alias pacs='sudo pacman -Ss'              # search
alias pacu='sudo pacman -Syu'             # update
alias pacr='sudo pacman -R'               # remove package but not dependencies
alias pacrr='sudo pacman -Rs'             # remove package with unused dependencies by other softwares
alias pacrc='sudo pacman -Sc'             # remove pacman's cache
alias pacro='pacman -Rns $(pacman -Qtdq)'
alias pacrl='rm /var/lib/pacman/db.lck'   # pacman remove locks
alias pacls="sudo pacman -Qe"
alias pacc='sudo pacman -Sc'
alias paccc='sudo pacman -Scc'            # empty the whole cache
alias pcache="sudo  paccache -r"
alias drivers="sudo pacman -Sy lib32-vulkan-mesa-layers  mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon amdvlk lib32-amdvlk libva-mesa-driver mesa-vdpau lib32-mesa-vdpau vulkan-icd-loader lib32-vulkan-icd-loader vulkan-swrast vulkan-headers vulkan-validation-layers vulkan-tools"
alias rdrivers="sudo pacman -Rdd mesa lib32-vulkan-mesa-layers lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon amdvlk lib32-amdvlk libva-mesa-driver mesa-vdpau lib32-mesa-vdpau vulkan-icd-loader lib32-vulkan-icd-loader vulkan-swrast vulkan-headers vulkan-validation-layers vulkan-tools"
#yay#
alias yayi='yay -S'     # install
alias yayhi='yay -Ql'   # Yay Has Installed - what files where installed in a package
alias yays='yay -Ss'    # search
alias yayu='yay -Syu'   # update
alias yayr='yay -R'     # remove package but not dependencies
alias yayrr="yay -Rs"   # remove package with unused dependencies by other softwares
alias yayrc="yay -Sc"   # remove yay's cache
alias yayls="yay -Qe"

#Emulators#
alias dolphinx="QT_QPA_PLATFORM=xcb dolphin-emu"

#Grub/mkinitcpio#
alias grub="sudo -E nvim /etc/default/grub"
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mklinux="sudo mkinitcpio -p linux"
alias mklinux-lts="sudo mkinitcpio -p linux-lts"

#systemd#
alias SSE="sudo systemctl enable"
alias SS="sudo systemctl"
alias SSS="sudo systemctl status"
alias SSR="sudo systemctl restart"
alias SSST="sudo systemctl start"
alias SSSTO="sudo systemctl stop"
alias SSD="sudo systemctl disable"
alias SD="sudo systemctl daemon-reload"
alias sur="systemctl --user restart"
alias sus="systemctl --user status"
alias su="systemctl --user"
alias sue="systemctl --user enable"
alias sust="systemctl --user start"
alias suss="systemctl --user status"
alias sust="systemctl --user stop"
alias sd="systemctl --user restart dunst"
alias sud="systemctl --user disable"

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
alias chx="chmod +x"

#sudo Commands#
alias sduo="sudo"
alias reboot="sudo reboot"
alias suspend="sudo systemctl suspend"
alias smkd="sudo mkdir"
alias pkex="pkexec chown root:root /etc/sudoers /etc/sudoers.d -R"

#Internet#
alias getpass="openssl rand -base64 20"
alias sha="shasum -a 256 "
alias ping="ping -c 5"
alias speed="speedtest-cli"
alias twitch="streamlink -p mpv"

#nvim#
alias visc="nvim ~/.config/sway/config"
alias sev="sudo -E nvim"
alias cre="crontab -e"
alias vi3="nvim ~/.config/i3/config"
alias vp="nvim ~/.config/polybar/config"
alias fstab="sudo -E nvim /etc/fstab"
alias bashrc="nvim  ~/.bashrc && source ~/.bashrc" 
alias zshrc="nvim  ~/.zshrc && source ~/.zshrc" 
alias xmhs="nvim ~/.xmonad/xmonad.hs"
alias xmb="nvim ~/.xmobarrc"
alias vimrc="nvim ~/.vimrc"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim  ~/.oh-my-zsh"
alias initvim="nvim ~/.config/nvim/init.vim"

#wireguard#
alias swgqu="sudo wg-quick up"
alias swgqd="sudo wg-quick down"
alias vpnup="sudo wg-quick up ~/Downloads/mullvad/mullvad-ca10.conf"
alias vpndown="sudo wg-quick down ~/Downloads/mullvad/mullvad-ca10.conf"
alias pkt="sudo pkill transmission-daemon && pkill sudo pkill transmission"

#git#
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

#source ~/.shortcuts
PATH=$PATH:~/.cabal/bin
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1
autoload -Uz compinit; compinit edit-command-line
compinit
export KEYTIMEOUT=1
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
source /usr/share/nvm/init-nvm.sh
unsetopt nomatch
source ~/powerlevel10k/powerlevel10k.zsh-theme

if type clipcat-menu >/dev/null 2>&1; then
    alias clipedit=' clipcat-menu --finder=builtin edit'
    alias clipdel=' clipcat-menu --finder=builtin remove'

    bindkey -s '^\' "^Q clipcat-menu --finder=builtin insert ^J"
    bindkey -s '^]' "^Q clipcat-menu --finder=builtin remove ^J"
fi


if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi


