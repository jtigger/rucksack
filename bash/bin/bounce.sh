#/bin/bash
/usr/sbin/networksetup -setairportpower en1 off
sleep 1
/usr/sbin/networksetup -setairportpower en1 on

echo "Waiting for link to reset..."
sleep 5
echo "Testing connectivity..."
ping -c 3 www.google.com
