#!/usr/bin/bash
printf "Installing X-Org"
pacman -S xorg xorg-xinit xorg-xsetroot arandr pavucontrol blueman firefox thunderbird dunst feh picom git wget curl wget neovim vim ttf-fira-code ttf-font-awesome otf-fontawesome powerline-fonts awesome-terminal-fonts lxappearance

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
":'DWM xinit'
#autostart
exec slstatus &
exec dunst &
exec pnmixer &
exec birdtray &


#Wallpaper
feh --bg-fill walls/001.jpg

#Compositor
picom -f &

#DWM
exec dwm" >> .xinitrc 
#NOTE:If you have more than one gui environment, manually configure the xinitrc

printf "Downloading And Setting Up DWM"
git clone https://github.com/bleak-alpha/walls.git
git clone https://github.com/bleak-alpha/dwm-set.git "$HOME"/Downloads/
cd Downloads/dwm-set/dwm-6.2/
 make clean install
cd .. && cd dmenu-5.0/
 make clean install
cd .. && cd slstatus/
 make clean install
cd .. && cd st-0.8.2/
 make clean install
cd ..
 cp 30-touchpad-Laptop-touchpad-conf.conf /etc/X11/xorg.conf.d/30-touchpad.conf