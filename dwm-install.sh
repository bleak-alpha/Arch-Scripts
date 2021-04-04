#!/usr/bin/sh
printf "Installing X-Org"
pacman -S xorg xorg-xinit xorg-xsetroot arandr firefox thunderbird dunst feh picom git wget curl wget neovim vim ttf-fira-code

printf "Setting Up xinitrc"
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
sed '51,56d' $HOME/.xinitrc
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

 printf "Downloading And Setting Up DWM"
 git clone https://github.com/bleak-alpha/dwm-set.git $HOME/Downloads/
 cd Downloads/dwm-set/
 