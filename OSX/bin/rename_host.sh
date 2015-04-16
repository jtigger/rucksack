#!/bin/bash
set -e

if [ "$1" == "" ]; then
  echo "Pray tell... what name with which I shall bless this device?"
  exit 1;
fi

HOSTNAME=$1
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo scutil --set ComputerName $HOSTNAME
diskutil rename / $HOSTNAME

echo 
echo "NOTE: Close all terminal windows to complete the change."
