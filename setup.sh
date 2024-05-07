#!/bin/bash

rm /usr/share/sddm/themes/Candy/backgrounds/*
cp *.jpg /usr/share/sddm/themes/Candy/backgrounds/

THEME_CONF="/usr/share/sddm/themes/Candy/theme.conf"
IMAGE_DIR="/usr/share/sddm/themes/Candy/backgrounds/"

image_files=""

# Loop through all image files in the directory and append them to the variable
for file in "$IMAGE_DIR"/*.{jpg,png,jpeg}; do
    if [ -e "$file" ]; then  # Check if the file exists
        image_files+="./backgrounds/$(basename "$file") "
    fi
done

# Trim the last extra space
image_files=${image_files% }

# Use sed to update BackgroundS in theme.conf
sed -i "s|BackgroundS=\".*\"|BackgroundS=\"$image_files\"|" "$THEME_CONF"

echo "BackgroundS updated in theme.conf."
