#! /bin/bash

read -rp "Regex: " PATTERN
FORMATTED_BRANCHES=$(git b -a | tr -d "* " | rg $PATTERN | node_numbered_output)

read -rp "Select: "$'\n'"$FORMATTED_BRANCHES"$'\n' SELECTED_NUMBER
git switch $(echo $FORMATTED_BRANCHES | rg ":$SELECTED_NUMBER" | cut -d ":" -f 1)

