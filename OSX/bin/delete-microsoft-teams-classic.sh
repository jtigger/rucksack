#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
set -o xtrace

sudo rm -rf "/Applications/Microsoft Teams Classic"
sudo rm -rf "/Library/Audio/Plug-Ins/HAL/MSTeamsAudioDevice.driver"

rm -rf "~/Library/Application Support/Microsoft/Teams"
rm -rf "~/Library/Saved Application State/com.microsoft.teams"
rm -rf "~/Library/WebKit/com.microsoft.teams"
rm -rf "~/Library/Preferences/com.microsoft.teams.plist"
rm -rf "~/Library/Application Scripts/UBF8T346G9.com.microsoft.teams"
rm -rf "~/Library/HTTPStorages/com.microsoft.teams"
rm -rf "~/Library/HTTPStorages/com.microsoft.teams.binarycookies"
rm -rf "~/Library/Logs/Microsoft Teams classic Helper (Renderer)"
rm -rf "~/Library/Group Containers/UBF8T346G9.com.microsoft.teams"
rm -rf "~/Library/Caches/Microsoft/Teams"
rm -rf "~/Library/Caches/com.microsoft.teams"
rm -rf "~/Library/Application Support/Google/Chrome/Default/IndexedDB/https_teams.microsoft.com*"
rm -rf "~/Library/Application Support/Microsoft/Teams"
rm -rf "~/Library/Saved Application State/com.microsoft.teams.savedState"
rm -rf "~/Library/WebKit/com.microsoft.teams"

# Force a restart of the audio daemon
# (launchctl didn't work for me, and the killall is what ran instead)
cat <<EOF

To restart the audio subsystem, run the following (from MS Teams postinstall script):

  sudo launchctl kickstart -kp system/com.apple.audio.coreaudiod || sudo killall coreaudiod"

EOF
