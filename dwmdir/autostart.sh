#!/bin/bash

refreshapplications() {
# Example: killall command1; command1 &
    killall feh; feh --bg-fill ~/.dwm/wallpaper &
    killall setxkbmap; setxkbmap no &
    killall xrdb; xrdb ~/.Xresources &
    killall picom; picom &
    killall slstatus; slstatus &
}

autostartapplications() {
    #Example; command1 &
    #akonadictl start &
    openrgb --startminimized &
    #signal-desktop --use-tray-icon &
    #/usr/bin/nextcloud --background &
    /usr/bin/gentoo-pipewire-launcher &
}

refreshapplications

if [[ `pgrep -f $0` != "$$" ]]; then # Checks if the script is already running
    exit 0;
else
    autostartapplications

    while true; do # This keeps the script in a constant loop in order to be visible as a process
        sleep 500
    done
fi
