#!/bin/env bash
 # Define the choices
choices=(
    "blackburn"
    "copland"
    "multicolor"
    "dracula"
    "powerarrow-blue"
    "Zenburn"
)

# Define the source files (replace with actual file paths)
source_files=(
    "/home/voice49/.config/awesome/themes/blackburn"
    "/home/voice49/.config/awesome/themes/copland"
    "/home/voice49/.config/awesome/themes/multicolor"
    "/home/voice49/.config/awesome/themes/dracula"
    "/home/voice49/.config/awesome/themes/powerarrow-blue"
    "/home/voice49/.config/awesome/themes/Zenburn"
)

# Define the default destination folder
default_folder="/home/voice49/.config/awesome/themes/default"

# Create the rofi menu
selected=$(printf '%s\n' "${choices[@]}" | rofi -dmenu -p "Select a theme")

# Find the index of the selected choice
for i in "${!choices[@]}"; do
   if [[ "${choices[$i]}" = "${selected}" ]]; then
       index=$i
       break
   fi
done

# If a valid choice was made
if [[ -n $index ]]; then
    # Copy the contents of the corresponding folder to the default location
    cp -r "${source_files[$index]}"/* "$default_folder" || { echo "Copy failed"; exit 1; }
    
    # Restart Awesome WM
    awesome-client "awesome.restart()"
    
    echo "Contents copied and Awesome WM restarted."
else
    echo "No valid selection made."
fi


#befo  run  this script  put  a  empty  theme.lua  on  the  default  folder    