#!/bin/bash

music_library="$HOME/Music"

fallback_image="/home/tuxm/.icons/Papirus-Dark/64x64/apps/gnome-music.svg"

ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" /tmp/mpd_cover.jpg > /dev/null 2>&1 && \

notify-send -i /tmp/mpd_cover.jpg "Now Playing:" "$(mpc current)" || \

notify-send -i $fallback_image "Now Playing:" "$(mpc current)"
