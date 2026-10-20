#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")" || exit $?
icons=( )
for i in 8 16 24 32 48 64 128 256 512; do
    icon="assets/icon-$i.png"
    rm -f "$icon"
    icons+=( "$icon" )
    magick assets/icon.png -scale "${i}x${i}" "$icon"
done
magick "${icons[@]}" favicon.ico
