#!/usr/bin/bash
sudo pacman -S zsh

chsh -s $(which zsh)


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#changes to zshrc
sed 's/# ZSH_THEME="robbyrussel"/ZSH_THEME="agnoster"/' .zshrc


#make dotfiles backup to github....