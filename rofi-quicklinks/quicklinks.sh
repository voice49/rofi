#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi - quicklinks.rasi"

# Links 
facebook=" facebook"
instagram=" instagram"
netflix=" netflix"



# Variable passed to rofi
options="$facebook\n$instagram\n$netflix"

chosen="$(echo -e "$options" | $rofi_command -p "  " -dmenu -selected-row 0)"
case $chosen in
        $facebook)
        brave --new-tab https://www.facebook.com
        ;;
    $instagram)
        brave --new-tab https://www.instagram.com/?hl=el
        ;;
    $netflix)
        brave --new-tab https://www.netflix.com/browse
        ;;
esac
