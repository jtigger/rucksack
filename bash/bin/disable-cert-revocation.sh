#/bin/bash
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

