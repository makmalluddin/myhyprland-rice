#!/usr/bin/env bash

MODE="$1"

case "$MODE" in
area)
  grim -g "$(slurp)" - | satty --filename - --copy-command wl-copy --early-exit --fullscreen
  ;;
active)
  ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')
  if [ -n "$ACTIVE_MONITOR" ]; then
    grim -o "$ACTIVE_MONITOR" - | satty --filename - --copy-command wl-copy --early-exit --fullscreen
  fi
  ;;
full)
  grim - | satty --filename - --copy-command wl-copy --early-exit --fullscreen
  ;;
*)
  echo "Usage: $0 {area|active|full}"
  exit 1
  ;;
esac
