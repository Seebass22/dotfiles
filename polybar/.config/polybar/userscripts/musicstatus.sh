#!/bin/bash
mpdstatus="$(mpc status | sed -n '2p' | awk '{print $1}')"

ps aux | grep -q "[s]potify"
if [ $? -eq 0 ]; then
	if [ "$mpdstatus" == '[playing]' ]; then
		status="$(mpc status | head -n1) $mpdstatus"
	else
		spotifystatus="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | sed -n 2p | awk '{print $3}' | sed -e 's/^./[/' -e 's/.$/]/')"
		song="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)"
		artist="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artist/{n;n;p}' | cut -d '"' -f 2)"
		status="$(echo $artist - $song) $spotifystatus"
	fi
elif [ $? -eq 1 ]; then
	if [ "$mpdstatus" == '[playing]' ] || [ "$mpdstatus" == '[paused]' ]; then
		status="$(mpc status | head -n1) $mpdstatus"
	else
		status="mpd stopped"
	fi
fi
echo "$status"
