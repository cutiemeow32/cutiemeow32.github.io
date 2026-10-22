#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")" || exit $?
make -C assets
make -C assets/NekoApp
update_favicon() {
    file="$1"
    echo "Moving $file.."
    mv "$file"{,.bak}
    lines="$(wc -l "$file.bak" | cut '-d ' -f1)"
    echo "Updating $file icon, copying unedited lines from moved file to original location.."
    i=1
    text_prev=""
    cat "$file.bak" | while read -r line; do
        text="$(printf "\r[% 3d%%] Updating $file.." "$((i*100/lines))")"
        if [ "$text" != "$text_prev" ]; then
           printf "%s" "$text"
        fi
        if echo "$line" | grep -F '[ICON-LINE]' >/dev/null 2>&1; then
            echo -n "x$line" | sed 's/^\(.*\)<link .*$/\1/' >> "$file"
            echo -n "<link rel=\"icon\" href=\"data:image/png;base64," >> "$file"
            base64 assets/icon-512.png | while read -r line; do echo -n "$line"; done >> "$file"
            echo "\" />"  >> "$file"
        else
            echo "x$line" >> "$file"
        fi
        ((i++))
    done
    echo
    sed -i 's/^x//' "$file"
    echo "Removing moved $file.."
    rm -f "$file.bak"
}
update_favicon 'Girl Name List.htm'
