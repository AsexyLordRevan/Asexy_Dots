#!/bin/bash

cp -f .config/colours/colours.conf .config/hypr/colours.conf
cp -f .config/colours/colours.conf .confing/waybar/colours.css
cp -f .config/colours/colours.conf .config/rofi/colours.rosi
cp -f .config/colours/colours.conf .config/betterdiscord
cd ~/.mozilla/firefox
if [[ $(grep '\[Profile[^0]\]' profiles.ini) ]]
then PROFPATH=$(grep -E '^\[Profile|^Path|^Default' profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
else PROFPATH=$(grep 'Path=' profiles.ini | sed 's/^Path=//')
fi
cp -f ~/.config/colours/colours.css .mozilla/firefox/$PROFPATH/chrome/colours.css
echo "Colours synced"

killall waybar &
waybar &
hyprctl reload &

echo "Software reloaded"
