#!/usr/bin/sh
printf "Installing X-Org"
pacman -S xorg xorg-xinit xorg-xsetroot arandr firefox git wget curl wget neovim vim ttf-fira-code ttf-font-awesome otf-fontawesome powerline-fonts awesome-terminal-fonts

printf "Installing KDE and KDE-Applications"
pacman -S --noconfirm kde-applications plasma

printf "Setting Up xinitrc"
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
sed '51,56d' $HOME/.xinitrc
echo 
":'KDE xinit'
export DESKTOP_SESSION=plasma &
exec startplasma-x11" >> .xinitrc