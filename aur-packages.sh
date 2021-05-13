#!/bin/sh

printf "Installing Paru...."
git clone https://aur.archlinux.org/paru.git $"HOME"/Downloads/
cd $"HOME"/Downloads/paru/
makepkg -si PKGBUILD
cd .. & rm -fr paru/
cd 

printf "Installing AUR Packages...."
paru -Syy --noconfirm birdtray pnmixer brave-bin pulseaudio-modules-bt sublime-text-3 spotify spotifywm-git protonvpn-cli-ng timeshift-bin ttf-google-fonts-typewolf ttf-mac-fonts betterlockscreen 