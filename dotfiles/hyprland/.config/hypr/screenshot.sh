#!/usr/bin/env bash

# Folder penyimpanan screenshot
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
FILE="$DIR/screenshot_${TIMESTAMP}.png"

MODE="$1"

case "$MODE" in
area)
  GEOM=$(slurp)
  if [ -n "$GEOM" ]; then
    grim -g "$GEOM" - | satty --filename - \
      --output-filename "$DIR/satty-%Y%m%d-%H%M%S.png" \
      --copy-command "wl-copy --type image/png" \
      --early-exit \
      --fullscreen
  fi
  ;;
active)
  ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')
  if [ -n "$ACTIVE_MONITOR" ]; then
    grim -o "$ACTIVE_MONITOR" "$FILE"
    wl-copy --type image/png <"$FILE"
    notify-send "Screenshot Monitor Aktif" "Tersimpan di:\n$FILE" -i "$FILE"
  fi
  ;;
full)
  grim "$FILE"
  wl-copy --type image/png <"$FILE"
  notify-send "Screenshot Fullscreen" "Tersimpan di:\n$FILE" -i "$FILE"
  ;;
*)
  echo "Usage: $0 {area|active|full}"
  exit 1
  ;;
esac
