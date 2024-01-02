#!/bin/rc
bind -a '#l1' /net
aux/wpa -p -2 -s 'SSID' /net/ether1
ip/ipconfig ether /net/ether1
cat /usr/glenda/ssh.key >/mnt/factotum/ctl
