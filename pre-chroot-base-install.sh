#!/bin/sh

printf "Installing Base Packages...."	
pacstrap -i /mnt base base-devel linux linux-firmware linux-headers vi vim git nvim

printf "Generating the fstab file...."
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

printf "Switch to chroot and copy the scripts into /mnt"
