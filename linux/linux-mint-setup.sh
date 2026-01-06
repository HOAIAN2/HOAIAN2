#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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
    fonts-firacode \
    fonts-roboto

# Command line tools
sudo apt purge -y vim-tiny && sudo apt autoremove
sudo apt install -y neovim \
    fzf \
    nmap \
    btop \
    ffmpeg

# GUI apps that doesn't have flatpak official Flatpak or just make sense to install system package
sudo apt install -y audacity \
    gparted \
    filezilla \
    gnome-clocks \
    gnome-snapshot # Disable if there's no webcam

# Flatpak apps setup
flatpak install flathub -y com.github.tchx84.Flatseal
flatpak install flathub -y org.gimp.GIMP
flatpak install flathub -y org.kde.kdenlive
flatpak install flathub -y org.inkscape.Inkscape
flatpak install flathub -y com.obsproject.Studio
flatpak install flathub -y com.github.wwmm.easyeffects
flatpak install flathub -y com.usebruno.Bruno
flatpak install flathub -y io.github.alainm23.planify
flatpak install flathub -y md.obsidian.Obsidian
flatpak install flathub -y org.localsend.localsend_app

# Fix flatpak mouse inconsistent
mkdir -p ~/.local/share/icons/default
printf '[Icon Theme]
Name=Bibata-Modern-Classic
Inherits=Bibata-Modern-Classic' > ~/.local/share/icons/default/index.theme

# cinnamon_cursor_size * display_scale, should set in flatseal
# flatpak override --env=XCURSOR_SIZE=48

# Post install setup
# $SCRIPT_DIR/shared/dns-filter.sh
$SCRIPT_DIR/shared/ufw-rules.sh

# Restore bash config
cp ~/.bashrc ~/.bashrc.bak
cp $SCRIPT_DIR/dotfiles/bash/.bashrc ~
cp $SCRIPT_DIR/dotfiles/bash/.bash_aliases ~

# Restore git config
cp $SCRIPT_DIR/dotfiles/git/.gitconfig ~

# Restore nvim config
mkdir -p ~/.config/nvim
cp $SCRIPT_DIR/dotfiles/nvim/init.lua ~/.config/nvim
