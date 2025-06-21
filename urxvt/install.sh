#!/bin/bash

# URxvt installation script

echo "Setting up URxvt configuration..."

# Create necessary directories
mkdir -p ~/.urxvt
mkdir -p ~/.local/share/fonts

# Link URxvt extensions directory
if [ -d ~/.urxvt/ext ]; then
    echo "Removing existing ~/.urxvt/ext directory..."
    rm -rf ~/.urxvt/ext
fi
ln -sf ~/Dotfiles/urxvt/ext ~/.urxvt/
echo "✓ Linked URxvt extensions"

# Link Xresources configuration
ln -sf ~/Dotfiles/Xresources ~/.Xresources
echo "✓ Linked Xresources"

# Load Xresources
xrdb -merge ~/.Xresources
echo "✓ Loaded Xresources configuration"

# Install Source Code Pro font
cp ~/Dotfiles/"Sauce Code Pro Nerd Font Complete Mono.ttf" ~/.local/share/fonts/
echo "✓ Copied Source Code Pro font"

# Update font cache
fc-cache -fv > /dev/null 2>&1
echo "✓ Updated font cache"

echo ""
echo "URxvt setup complete! You can now launch urxvt."
echo "Note: If the font doesn't appear, try restarting your terminal or logging out and back in."