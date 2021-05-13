#!/bin/sh

printf "installing Base Packages...."	
pacstrap -i /mnt base base-devel linux linux-firmware linux-headers vi vim git nvim

printf "Downloading Scripts..."
cd /mnt
git clone https://github.com/bleak-alpha/Arch-Scripts.git
cd..

printf "Generating the fstab file...."
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

printf "Changing root directory...."
arch-chroot /mnt
