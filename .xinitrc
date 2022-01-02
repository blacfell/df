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

#this helps with minecraft apparently
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

xcape & #pressing CTRL alone = ESC
dunst & #notification daemon
mpd-notification & #mpd notifs
picom & #compositor
feh --bg-scale --randomize $HOME/wall/* & #wallpaper
clipmenud & #clipboard manager
fcitx5 & #japanese input

session=${1:-bspwm}

case $session in
    bspwm) exec bspwm;;
    emacs|exwm) exec emacs;;
    *) exec $1;;
esac
