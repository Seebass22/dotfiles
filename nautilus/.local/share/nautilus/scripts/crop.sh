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

res="$(zenity --forms --title="crop video" --text="" --add-entry="x" --add-entry="y" --add-entry="x resolution" --add-entry="y resolution")"
x="$(echo "$res" | cut -d'|' -f 1)"
y="$(echo "$res" | cut -d'|' -f 2)"
xres="$(echo "$res" | cut -d'|' -f 3)"
yres="$(echo "$res" | cut -d'|' -f 4)"

[ -z "$x"] && exit

if [ -z "$y" ]; then
	y=0
fi
if [ -z "$xres" ]; then
	xres=1080
fi
if [ -z "$yres" ]; then
	yres=1080
fi

ffmpeg -i "$input" -filter:v "crop=${xres}:${yres}:${x}:${y}" "$output"
