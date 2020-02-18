#!/usr/bin/env bash
# I first wrote this script back when I was at the Ruby/Rails meetup at Cal
# Tech.  We were having trouble with their wireless and disabling cert
# revocation check was the workaround.
#
# Turning off this feature means opening yourself up to a MITM attack.
# Search the web for more details.

case "$1" in 
  on)
    REVOCATION_MODE="BestAttempt"
    ;;
  off)
    REVOCATION_MODE="None"
    ;;
  *)
    echo $"Usage: $0 {on|off}"
    exit 1
esac

defaults write com.apple.security.revocation CRLStyle -string $REVOCATION_MODE
defaults write com.apple.security.revocation OCSPStyle -string $REVOCATION_MODE

