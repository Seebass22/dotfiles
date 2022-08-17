#!/bin/bash

set -o noglob
IFS=$'\n' files=($NAUTILUS_SCRIPT_SELECTED_FILE_PATHS)
set +o noglob

input="${files[0]}"

video4discord "$1"
notify-send 'video4discord done'
