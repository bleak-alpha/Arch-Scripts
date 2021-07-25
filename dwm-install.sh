#!/bin/sh
printf "\nInstalling X-Org"
sudo pacman -Syy --noconfirm xorg xorg-server xorg-xrandr xorg-xinit xorg-xsetroot arandr xbindkeys pavucontrol blueman firefox thunderbird dunst feh picom git wget curl wget neovim vim ttf-fira-code ttf-font-awesome otf-font-awesome powerline-fonts awesome-terminal-fonts lxappearance breeze-gtk xbindkeys playerctl pcmanfm ranger fbv eog deepin-screenshot gimp cmus mpv vlc cheese android-file-transfer curtail otf-fira-mono noto-fonts-emoji gnu-free-fonts noto-fonts okular 

printf "\nSetting Up xinitrc"
wget https://raw.githubusercontent.com/bleak-alpha/dotfiles/master/.xinitrc
sudo mv .xinitrc /home/bleak/.xinitrc
#NOTE:If you have more than one gui environment, manually configure the xinitrc

printf "\nDownloading And Setting Up DWM"
git clone https://github.com/bleak-alpha/walls.git $HOME/
git clone https://github.com/bleak-alpha/dwm-set.git $HOME/
cd $HOME/dwm-set/dwm-6.2/
sudo make clean install
cd .. && cd dmenu-5.0/
sudo make clean install
cd .. && cd slstatus/
sudo make clean install
cd .. && cd st-0.8.2/
sudo make clean install
cd ..
sudo cp 30-touchpad-Laptop-touchpad-conf.conf /etc/X11/xorg.conf.d/30-touchpad.conf

printf "\nSetting up lockscreen"
paru -S betterlockscreen --noconfirm
betterlockscreen -u ~/walls/lock/001.jpg 
