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

chosen=$(echo -e "$options" | $rofi_command -dmenu -selected-row 2 -p "Powermenu")
case $chosen in
    $power_off)
        run ffplay -nodisp -autoexit  $HOME/Music/logout.wav
        sleep 3
        systemctl poweroff
        ;;
    $reboot)
        run ffplay -nodisp -autoexit  $HOME/Music/device-removed.oga
        sleep 3
        systemctl reboot
        ;;
    $lock)
        run ffplay -nodisp -autoexit  $HOME/Music/alert.wav
        sleep 3
        dm-tool lock
         #1#scrot /tmp/screen.png
         #1#xwobf -s 11 /tmp/screen.png
         #1#i3lock -i /tmp/screen.png
         #1#rm /tmp/screen.png
        ;;
    $suspend)
        systemctl hibernate
        ;;
    $log_out)
        run ffplay -nodisp -autoexit  $HOME/Music/logout.wav
        sleep 3
        xdotool key --clearmodifiers super+shift+x exit
        ;;
esac
