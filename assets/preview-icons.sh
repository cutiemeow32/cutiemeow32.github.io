#!/bin/bash
# Set settings for Bash so we reduce the risk of erroneous script behaviour breaking things.
set -euo pipefail
# Extra debugging environment variable to debug script errors by tracing commands.
if [ -v "CM32_PREVIEW_ICONS_SCRIPT_SET_DASH_X" ] && [ -n "$CM32_PREVIEW_ICONS_SCRIPT_SET_DASH_X" ]; then
    # Enable command tracing if the above environment variable is set and non-empty
    set -x
fi
# Save the current umask so we can restore it later.
old_umask="$(umask)"
# Just in case the script exits before we normally restore the umask, restore the umask on exit too.
trap 'umask "$old_umask"' exit
# Make sure the temporary file isn't accessible by others to minimise risk of other processes screwing up the operation of this script.
umask 077
# Create the temporary file.
tmpfile="$(mktemp)"
# Grab all icon files
readarray -t sizes <<< "$(for i in icon-*.png; do # Get all files matching the glob `icon-*.png`. This will be filtered by grep for only icons with the correct format.
        size="$(echo -n "$i" | grep --only '[0-9]+' -E)" # Get the size in the file. One or two lines, but if there are two lines they must be equal.
        size_line_count="$(echo "$size" | wc -l | cut -d' ' -f1)" # Get the amount of lines in the size to check against
        # Verify the size in the icon filename, starting with the line count.
        if [ "$size_line_count" -gt 2 ] || [ "$size_line_count" -eq 0 ]; then
            continue
        elif [ "$size_line_count" -eq 2 ]; then # If there are two lines..
            # .. verify they're the same, and if they aren't..
            if [ "$(echo -n "$size" | head -n1)" -ne "$(echo -n "$size" | tail -n1)" ]; then
                # .. skip the file, otherwise..
                continue
            fi
            # .. get only the first line for further checks.
            size="$(echo -n "$size" | head -n1)"
        fi
        echo "$i" # If all checks passed, output the filename for further processing.
    done |
        grep -E '^icon-[0-9]+.png$' | # Filter for only valid icon names
        grep --only '[0-9]*' | # Get only the sizes
        sort -n # Sort icon sizes in ascending order
)"
# Delete the temporary file as we don't need it anymore
rm -f "$tmpfile"
# Unset the variable holding the path of the temporary file to better catch uses of it after its deletion.
unset tmpfile
# Restore the umask because we don't want to mess up the environment upon exit.
umask "$old_umask"
# Iterate over all sizes, so we can display them.
for size in "${sizes[@]}"; do
    clear
    echo "Icon@${size}x${size} (PNG):" # Display an informational line.
    kitten icat --hold "icon-${size}.png" # Display the image, using the Kitty terminal's `icat` kitten
    echo # Add an extra newline Just-in-Cast™
done
