zstyle :compinstall filename '/home/fangz/.zshrc'
autoload -Uz compinit
compinit

bindkey -e

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

unsetopt beep # stop making noise please

export EDITOR=nvim

PS1="%2~%f%# "

path+=('/home/fangz/bin')
export PATH

#no nut november config
export NNN_OPENER="nuke"

alias ls="/usr/bin/exa -l"
alias df="/usr/bin/df -h"

#autostart mpd
[ ! -s ~/.config/mpd/pid ] && mpd

#autostart x
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx ~/.xinitrc emacs
fi
