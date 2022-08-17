#!/bin/bash

set -o noglob
IFS=$'\n' files=($NAUTILUS_SCRIPT_SELECTED_FILE_PATHS)
set +o noglob

output="$(add_underscore ${files[0]})"
input="${files[0]}"

video4discord "$1" -c aac -a 128
notify-send 'video4discord done'
