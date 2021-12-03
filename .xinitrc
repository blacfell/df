#!/bin/bash
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

setxkbmap -layout us -variant dvorak

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xcape &
dunst &
mpd-notification &
picom &
feh --bg-scale --randomize $HOME/wall/* &

session=${1:-bspwm}

case $session in
    bspwm) exec i3;;
    emacs|exwm) exec emacs;;
    *) exec $1;;
esac
