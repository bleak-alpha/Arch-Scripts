#!/bin/sh
printf "Installing X-Org"
sudo pacman -S --noconfirm --asdeps xorg xorg-xinit xorg-xsetroot xorg-xrandr arandr firefox git wget curl wget neovim vim ttf-fira-code ttf-font-awesome otf-fontawesome powerline-fonts awesome-terminal-fonts

printf "Installing Gnome and Gnome-Applications"
sudo pacman -S --noconfirm gnome gnome-extra

printf "Setting Up xinitrc"
if [ -e .xinitrc ]
then
    if [ "$(sed -n '51p' $HOME/.xinitrc)" = "twm &" ] 
    then
        sudo sed '51,56d' $HOME/.xinitrc
    fi
else
    sudo cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
    sudo sed '51,56d' $HOME/.xinitrc
fi
sudo echo ":'Gnome xinit'
export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME &
export GNOME_SHELL_SESSION_MODE=classic &
exec gnome-session" >> .xinitrc
