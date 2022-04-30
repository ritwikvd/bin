#!/bin/bash

if test "$1" = "-"; then
    git switch -
    exit
fi

echo $(git b -a | tr -d "* " | tr " " "\n")

read -rp $'\n'"Regex: " PATTERN

FORMATTED_BRANCHES=$(git b -a | tr -d "* " | rg $PATTERN | node_numbered_output)

read -rp "Select: "$'\n'"$FORMATTED_BRANCHES"$'\n' SELECTED_NUMBER

git switch $(echo $FORMATTED_BRANCHES | tr " " "\n" | rg ":$SELECTED_NUMBER" | cut -d ":" -f 1 | rg -o "[^/]*$")

