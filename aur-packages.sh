#!/usr/bin/bash

printf "Installing Paru"
cd "$HOME"/Downloads/
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si PKGBUILD
rm -fr paru/
cd 

paru -Syy birdtray pnmixer brave-bin pulseaudio-modules-bt sublime-text-3 spotify spotifywm-git protonvpn-cli-ng timeshift-bin ttf-google-fonts-typewolf ttf-mac-fonts betterlockscreen 