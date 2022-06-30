#!/bin/bash

set -o noglob
IFS=$'\n' files=($NAUTILUS_SCRIPT_SELECTED_FILE_PATHS)
set +o noglob

add_underscore() {
	extension="${1##*.}"
	filename="${1%.*}"
	echo ${filename}_.${extension}
}

output="$(add_underscore ${files[0]})"
input="${files[0]}"

video4discord -i "$1" -c aac -o "$output"
notify-send 'video4discord done'
