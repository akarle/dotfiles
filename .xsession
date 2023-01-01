#!/bin/sh
# .xsession - xenodm(8) user session script

# Old Xorg default DPI, looks good on my laptop
# https://marc.info/?l=openbsd-tech&m=163674121630769&w=2
xrandr --dpi 96

# Most importantly -- make caps a ctrl!
# see xkeyboard-config(7) for other options!
setxkbmap -option ctrl:nocaps

# Set the background to something that isn't the default
# (this color is from plan9's rio(1) default background )
xsetroot -solid "#777777"

# Source ~/.profile to set up the PATH so terminals like st(1)
# that don't spawn login shells get the env vars they expect
# (also for cwm's program launcher to find things)
. "$HOME/.profile"

if [ "$(uname)" = "OpenBSD" ]; then
	# Enable middle click + trackpoint scrolling. Doc in ws(4) and xinput(1)
	#
	#   `xinput --list` shows /dev/wsmouse to be our mouse device
	#
	# ws(4) shows the accepted values/desc for the device!
	#  * Wheel Emulation -- mouse acts like a scroll wheel when Button pressed (1 for true)
	#  * Wheel Em Button -- button that enables the Wheel Emulation (2 for middle)
	#  * Wheel Em Axes   -- buttons that represent Xup/down Yup/down. 4/5 is scroll
	#                       up/down 6/7 is "thumb" (side) up/down.
	xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
	xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
	xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5
fi

# Finally, launch my preferred desktop--currently cwm(1)
exec cwm
