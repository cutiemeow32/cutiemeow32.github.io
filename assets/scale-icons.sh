#!/bin/bash
set -euo pipefail
if [ "$#" -ne 4 ]; then
    echo "Error: Incorrect number of arguments: $#." >&2
    exit 1
fi
if ! [ "$3" -eq "$3" ] 2>/dev/null; then
    echo "Error: Output Size must be an integer." >&2
    exit 1
fi
if ! [ "$4" -eq "$4" ] 2>/dev/null; then
    echo "Error: Base Size must be an integer." >&2
    exit 1
fi

if [ -f "$2" ]; then
    echo "  [REMOVE-EXISTING]     $2" >&2
    rm -f "$2"
fi

if [ "$3" -lt "$4" ]; then
    echo "  [SCALE@LINEAR@$3x$3]  $1 -> $2" >&2
    magick "$1" -scale "$3x$3" "$2"
else
    echo "  [SCALE-NEAREST@$3x$3] $1 -> $2" >&2
    magick "$1" -sample "$3x$3" "$2"
fi
