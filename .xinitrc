# This is the config I use for dwm + startx
setxkbmap -option caps:ctrl_modifier
slstatus &

if [ -e ~/background.png ]; then
    feh --bg-fill ~/background.png
else
    xsetroot -solid black
fi

if [ $(uname) = "OpenBSD" ]; then
    # On my thinkpad, I seem to need these xinput calls to get
    # middle click scroll to work on OpenBSD. Linux is fine
    xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
    xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
    xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

    # since xenodm is run as root, we need to export ENV
    # ~/.shrc otherwise the interactive shells spawned in st
    # won't have the right profile. Sourcing .profile should do it
    # and get local aliases, etc
    . $HOME/.profile

    # Prefer UTF-8 in X for unicode character support
    export LC_CTYPE="en_US.UTF-8"

    # Lock on 5m idle
    xidle -program "/usr/X11R6/bin/xlock" -timeout 300 &

    # xenodm handles ssh-agent for us
    exec cwm
else
    ssh-agent dwm
fi
