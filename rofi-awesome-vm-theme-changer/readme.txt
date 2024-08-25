#          
#              _          _  _   ___  
#  __   _____ (_) ___ ___| || | / _ \ 
#  \ \ / / _ \| |/ __/ _ \ || || (_) |
#   \ V / (_) | | (_|  __/__   _\__, |
#    \_/ \___/|_|\___\___|  |_|   /_/ 
                                   


Awesome WM Theme Selector

This script allows you to easily select and switch between different Awesome WM themes using a simple rofi menu.

## Prerequisites

Before running the script, ensure you have the following:

1. **An empty default folder**: Create a folder at the following path
2. **A `theme.lua` file**: Inside the `default` folder, create a file named `theme.lua`. This file will be used to define the default theme settings.

3. **Update `rc.lua`**: Modify your `rc.lua` file to include the default theme and keybinding. Add the following lines:
 rc.lua
-- Keep themes in alphabetical order for Awesome WM
local themes = {
"blackburn", -- 1
"copland", -- 2
"multicolor", -- 3
"powerarrow", -- 4
"powerarrow-blue", -- 5
"powerarrow-dark", -- 6
"default", -- 7
}

-- Choose your theme here
local chosen_theme = themes[7] -- Set the default theme to "default"
-- Keybinding to launch the theme selector
awful.key({ modkey }, "t", function()
awful.spawn.with_shell("$HOME/.config/rofi/rofi-awesome-theme-selector.sh")
end, {description = "Awesome theme changer", group = "super"})
# Usage

4. Run the script:
5. A rofi menu will appear, allowing you to select a theme. Choose your desired theme, and the script will copy the theme files to the default folder and restart Awesome WM.

## Notes

- Ensure that the paths in the script are correct and point to your actual theme directories.
- You can add more themes to the `choices` and `source_files` arrays in the script as needed.

## License

This project is licensed under the MIT License.