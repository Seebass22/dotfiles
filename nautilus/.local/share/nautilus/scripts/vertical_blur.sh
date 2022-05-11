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

res="$(zenity --forms --title="vertical blur" --text="output resolution" --add-entry="horizontal resolution" --add-entry="vertical resolution")"
x="$(echo "$res" | cut -d'|' -f 1)"
y="$(echo "$res" | cut -d'|' -f 2)"
if [ -z "$x" ]; then
	x=1080
	y=1920
fi
if [ -z "$y" ]; then
	x=1080
	y=1920
fi

~/bashscripts/ffmpeg/vertical_blur.sh "$input" "$output" -x "$x" -y "$y"
