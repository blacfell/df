#!/bin/bash
killall -q polybar

echo "---" | tee -a /tmp/polybar.log
polybar mirri 2>&1 | tee -a /tmp/polybar.log & disown
