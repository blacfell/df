zstyle :compinstall filename '/home/fangz/.zshrc'
zstyle ":completion:*:commands" rehash 1
autoload -Uz compinit
compinit

# enable vi mode, as long as the shell is not inside emacs.
# this is because having both zsh vi mode and evil is redundant
if [[ ! -v INSIDE_EMACS ]]; then
    bindkey -v
else
    bindkey -e
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

PS1="%0(?.%K{green}%F{black}.%K{red}%F{white})%n@%m%f%k%# "
RPS1="%B%2~%b %D{%Y-%m-%d %H:%M:%S}"

#no nut november config
export NNN_OPENER="nuke"
export CM_LAUNCHER="rofi"

alias ls="/usr/bin/exa --long --grid --time-style=long-iso"
alias df="btrfs filesystem df /" # df reports free space in btrfs inaccurately
alias em="/usr/bin/emacsclient -t"
alias dem="SUDO_EDITOR=\"emacsclient -t -a nvim\" sudoedit"

alias d="/usr/bin/devour"

alias fucking="/usr/bin/doas"
alias please="/usr/bin/doas !!"

#autostart mpd
[ ! -s ~/.config/mpd/pid ] && mpd

#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# see setkey -v/e above
if [[ ! -v INSIDE_EMACS ]]; then
    source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
    zvm_after_init_commands+=('source /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/completion.zsh')
else
    source /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/completion.zsh
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# there are approximately zero circumstances in which I want this folder to exist.
# this won't delete it if there's something it there; i'll handle that manually
[ -d $HOME/Downloads ] && rmdir Downloads

shuf -n 1 $HOME/.quotes | ponysay
