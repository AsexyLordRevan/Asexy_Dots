#!/usr/bin/env bash
#
# A rofi powered menu to execute power related action.
# Uses: amixer mpc poweroff reboot rofi rofi-prompt
source=~/.zshrc
power_off=''
reboot=''
lock=''
sleep='鈴'
log_out=''

chosen=$(printf '%s;%s;%s;%s;%s\n' "$power_off  Power Off" "$reboot  Reboot" "$lock  Lock Screen" "$sleep  Sleep" \
                                   "$log_out  Log Out" \
    | rofi -theme-str '@import "config.rasi"' \
           -dmenu \
           -sep ';' \
           -selected-row 2)

case "$chosen" in
    "$power_off  Power Off")
        bash ~/.config/rofi/apps/prompt.sh --query 'Shutdown?' && poweroff
        ;;

    "$reboot  Reboot")
        bash ~/.config/rofi/apps/prompt.sh --query 'Reboot?' && reboot
        ;;

    "$lock  Lock Screen")
        hyprlock
        ;;

    "$sleep  Sleep")
        bash ~/.sleep.sh
        ;;

    "$log_out  Log Out")
	killall Hyprland
        ;;

    *) exit 1 ;;
esac
