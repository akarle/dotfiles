#!/bin/sh
# .xsession - xenodm(8) user session script

# Most importantly -- make caps a ctrl!
# see xkeyboard-config(7) for other options!
setxkbmap -option ctrl:nocaps

# Set the background to something that isn't the default
# (this color is from www.openbsd.org's dark theme!)
xsetroot -solid "#1E1F21"

# Source ~/.profile to set up the PATH so terminals like st(1)
# that don't spawn login shells get the env vars they expect
# (also for cwm's program launcher to find things)
. "$HOME/.profile"

# Finally, launch my preferred desktop--currently cwm(1)
exec cwm
