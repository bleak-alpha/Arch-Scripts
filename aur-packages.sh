#!/usr/bin/sh

printf "Installing Paru"
cd "$HOME"/Downloads/
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si PKGBUILD
rm -fr paru/

printf "Installing Birdtray"
cd "$HOME"/Downloads/
git clone https://aur.archlinux.org/birdtray.git
cd birdtray/
makepkg -si PKGBUILD
rm -fr birdtray/

printf "Installing pnmixer"
cd "$HOME"/Downloads/
https://aur.archlinux.org/pnmixer.git
cd pnmixer/
makepkg -si PKGBUILD
cd .. && rm -fr pnmixer/

printf "Installing Brave"
cd "$HOME"/Downloads/
https://aur.archlinux.org/brave-bin.git
cd brave-bin/
makepkg -si PKGBUILD
cd .. && rm -fr brave-bin/

printf "Installing AptX Drivers"
cd "$HOME"/Downloads/
https://aur.archlinux.org/pulseaudio-modules-bt.git
cd pulseaudio-modules-bt/
makepkg -si PKGBUILD
cd .. && rm -fr pulseaudio-modules-bt/