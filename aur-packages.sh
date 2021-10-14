#!/bin/sh

printf "Installing Paru...."
git clone https://aur.archlinux.org/paru.git
cd paru;
makepkg -si PKGBUILD;

printf "Installing AUR Packages...."
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
paru -Syy --noconfirm birdtray pnmixer brave-bin pulseaudio-modules-bt sublime-text-3 spotify spotifywm-git protonvpn-cli-ng onlyoffice-bin coreinfo betterlockscreen papirus-icon-theme-git 

