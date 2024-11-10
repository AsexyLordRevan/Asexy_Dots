#!/bin/bash
awk 'NR>=1 && NR<=79' ~/.config/colours/colours.conf > .config/hypr/colours.conf
awk 'NR>=80 && NR<=107' ~/.config/colours/colours.conf > .config/waybar/colours.css
awk 'NR>=109 && NR<=140' ~/.config/colours/colours.conf > .config/rofi/colours.rasi
awk 'NR>=80 && NR<=107' ~/.config/colours/colours.conf > .config/betterdiscord/themes/colours.css
echo "Colours synced"
killall waybar
waybar &
hyprctl reload &

echo "Software reloaded"





