#!/bin/bash

# Define theme names
DARK_THEME='Gruvbox-Dark'
LIGHT_THEME='Gruvbox-Light'

# Get current theme (remove quotes from gsettings output)
CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")

# Determine the opposite theme without changing anything yet
if [ "$CURRENT_THEME" = "$LIGHT_THEME" ]; then
    # If current theme is light, set THEME variable to dark
    THEME="$DARK_THEME"
    gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
else
    # If current theme is anything else, set THEME variable to light
    THEME="$LIGHT_THEME"
    gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
fi

# At this point, THEME contains the opposite theme name
# but no actual theme change has occurred

# Clear existing GTK4 config
rm -rf ~/.config/gtk-4.0
mkdir -p ~/.config/gtk-4.0

# Link the theme's GTK4 CSS files
if [ -d "/usr/share/themes/$THEME/gtk-4.0" ]; then
    ln -s /usr/share/themes/$THEME/gtk-4.0/* /home/sar/.config/gtk-4.0/
fi

# Update Flatpak theme at user level (no sudo needed)
flatpak override --user --env=GTK_THEME="$THEME"
