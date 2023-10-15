#!/bin/bash
rofi_command="rofi -rofipower.rasi"

### Options ###
power_off="  Shutdown"
reboot="  Restart"
lock="  Lock"
suspend="  Suspend"
log_out="  log out"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen  -l dimblur         #  betterlockscreen [-u <PATH>] [-l <EFFECT>] [-w <EFFECT>] --show-layout#

        ;;
    $suspend)
        systemctl hibernate
        ;;
    $log_out)
        xdotool key --clearmodifiers super+shift+x exit
        ;;
esac
