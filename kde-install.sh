#!/usr/bin/sh
printf "Installing X-Org"
pacman -S xorg xorg-xinit xorg-xsetroot arandr firefox git wget curl wget neovim vim ttf-fira-code ttf-font-awesome otf-fontawesome powerline-fonts awesome-terminal-fonts

printf "Installing KDE and KDE-Applications"
pacman -S --noconfirm kde-applications plasma

printf "Setting Up xinitrc"
if [ -e .xinitrc ]
then
    if [ "$(sed -n '51p' "$HOME"/.xinitrc)" = "twm &" ] 
    then
        sed '51,56d' "$HOME"/.xinitrc
    fi
else
    cp /etc/X11/xinit/xinitrc "$HOME"/.xinitrc
    sed '51,56d' "$HOME"/.xinitrc
fi
echo 
":'KDE xinit'
export DESKTOP_SESSION=plasma &
exec startplasma-x11" >> .xinitrc