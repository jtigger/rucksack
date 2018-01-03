#/bin/bash
killall IVPN
/usr/sbin/networksetup -setairportpower en1 off
sleep 10
/usr/sbin/networksetup -setairportpower en1 on
sleep 5
open /Applications/IVPN.app
