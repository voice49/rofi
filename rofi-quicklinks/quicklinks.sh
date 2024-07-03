#!/usr/bin/env bash
declare -A URLS
URLS=(
  ["google"]="https://www.google.com/search?q="
  ["yahoo"]="https://search.yahoo.com/search?p="
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["github"]="https://github.com/search?q="
  ["askubuntu"]="http://askubuntu.com/search?q="
  ["piratebay"]="https://thepiratebay.org/search/"
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["eshop"]="https://www.e-shop.gr/search?q="
  ["skroutz"]="https://www.skroutz.gr/search?keyphrase="
  ["efood"]="https://www.e-food.gr/s/"
  ["twitch"]="https://www.twitch.tv/search?term="
)

# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
  # Pass the list to rofi
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -no-custom -location 0 -p "Search" )

  if [[ -n "$platform" ]]; then
    query=$( (echo ) | rofi  -dmenu -matching fuzzy -location 0 -p "Search" )

    if [[ -n "$query" ]]; then
      url=${URLS[$platform]}$query
      xdg-open "$url"
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0