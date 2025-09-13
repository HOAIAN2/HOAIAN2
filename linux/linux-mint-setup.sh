#!/bin/bash

# This script not cover external packages like VsCode, Docker, etc.
# Some thing should be config after run this script for some reasons.

# fcitx not remember font size, here is how to fix:
# Fictx Configuration > Global Config > Show Advandced Options > Program > Seconds sleep before fcitx really start

# ! Remmeber to disable automatic screen rotation, otherwise OBS will lag so much

# cinnamon_cursor_size=$(gsettings get org.cinnamon.desktop.interface cursor-size)

# Fonts
sudo apt install -y ttf-mscorefonts-installer \
    fonts-jetbrains-mono \
    fonts-inter \
    fonts-roboto

# Command line tools
sudo apt purge -y vim-tiny && sudo apt autoremove
sudo apt install -y neovim \
    fzf

# GUI apps that doesn't have flatpak official Flatpak or just make sense to install system package
sudo apt install -y audacity \
    gparted \
    gnome-clocks \
    gnome-snapshot # Disable if there's no webcam

# Flatpak apps setup
flatpak install flathub -y com.github.tchx84.Flatseal
flatpak install flathub -y org.gimp.GIMP
flatpak install flathub -y org.kde.kdenlive
flatpak install flathub -y org.inkscape.Inkscape
flatpak install flathub -y com.obsproject.Studio
flatpak install flathub -y com.github.wwmm.easyeffects

# Fix flatpak mouse inconsistent
mkdir -p ~/.local/share/icons/default
printf '[Icon Theme]
Name=Bibata-Modern-Classic
Inherits=Bibata-Modern-Classic' >> ~/.local/share/icons/default/index.theme

# cinnamon_cursor_size * display_scale, should set in flatseal
# flatpak override --env=XCURSOR_SIZE=48
