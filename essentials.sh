#!/bin/sh

#adding pacman repositories 
sed -i 's/#[multilib]/[multilib]/g' /etc/pacman.conf
sed -i 's+#Include = /etc/pacman.d/mirrorlist+Include = /etc/pacman.d/mirrorlist+g' /etc/pacman.conf

sudo pacman -Syy --noconfirm --asdeps wine 
sudo pacman -S code gnome-keyring python jre-openjdk rust golang ghc cabal-install stack mpv libreoffice-fresh;

