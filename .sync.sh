#!/bin/bash

awk 'NR>=1 && NR<=17' ~/.config/colours/colours.conf > .config/hypr/colours.conf
awk 'NR>=21 && NR<=35' ~/.config/colours/colours.conf > .config/waybar/colours.css
awk 'NR>=38 && NR<=54' ~/.config/colours/colours.conf > .config/rofi/colours.rasi
awk 'NR>=21 && NR<=35' ~/.config/colours/colours.conf > .config/BetterDiscord/themes/colours.css
echo "Colours synced"

killall waybar
waybar &
systemctl --user stop mako && mako -c ~/.config/mako/config &

echo "Software reloaded"
