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

xcape & #pressing CTRL alone = ESC
dunst & #notification daemon
pgrep -x mpd-notification > /dev/null || mpd-notification &
picom & #compositor
feh --bg-scale --randomize $HOME/wall/* & #wallpaper
clipmenud & #clipboard manager
fcitx5 & #japanese input
pgrep x udiskie > /dev/null || udiskie & #automounter
/usr/lib/xfce-polkit/xfce-polkit &

session=${1:-bspwm}

case $session in
    bspwm) exec bspwm;;
    cwm) exec cwm;;
    emacs|exwm) exec emacs;;
    *) exec $1;;
esac
