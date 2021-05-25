#!/bin/sh

printf "Installing Paru...."
git clone https://aur.archlinux.org/paru.git
cd paru;
makepkg -si PKGBUILD;

printf "Installing AUR Packages...."
paru -Syy --noconfirm birdtray pnmixer brave-bin pulseaudio-modules-bt sublime-text-3 spotify spotifywm-git protonvpn-cli-ng timeshift-bin ttf-google-fonts-typewolf ttf-mac-fonts betterlockscreen 
