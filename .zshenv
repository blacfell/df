export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a nvim"

### $PATH ###
path+=("$HOME/bin")
path+=("$HOME/.lemonbar")
export PATH

### lemonbar ###
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=24
export PANEL_FONT="Terminus"
export PANEL_WM_NAME=bspwm_panel
