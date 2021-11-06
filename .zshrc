zstyle :compinstall filename '/home/fangz/.zshrc'
autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

unsetopt beep # stop making noise please

export EDITOR=nvim

PS1="%F{blue}%2~%f%# "

alias ls="/usr/bin/exa -al"
alias df="/usr/bin/df -h"
