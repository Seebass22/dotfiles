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

res="$(zenity --forms --title="cut video" --text="" --add-entry="start" --add-entry="stop" --add-entry="filename")"
start="$(echo "$res" | cut -d'|' -f 1)"
stop="$(echo "$res" | cut -d'|' -f 2)"
out="$(echo "$res" | cut -d'|' -f 3)"

[ -z "$start" ] && [ -z "$stop" ] && [ -z "$out" ] && exit

if [ -n "$start" ]; then
	ss="-ss 00:${start}"
fi
if [ -n "$stop" ]; then
	to="-to 00:${stop}"
fi
if [ -n "$out" ]; then
	output="$out"
fi

cmd="ffmpeg -i \"\$input\" $ss $to \"\$output\""
eval $cmd
