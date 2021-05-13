#!/bin/sh
sudo pacman -S zsh powerline-fonts

chsh -s $(which zsh)


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#changes to zshrc
sed -i 's/ZSH_THEME="robbyrussel"/ZSH_THEME="agnoster"/g' .zshrc


#make dotfiles backup to github....