#!/usr/bin/sh

printf "installing Base Packages...."	
pacstrap -i /mnt base base-devel linux linux-firmware linux-headers vim nvim}

printf "Generating the fstab file...."
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

printf "Changing root directory...."
arch-chroot /mnt

printf "Setting up Locales and timezone"
ln -sf /usr/share/zoneinfo/Asia/Kolkatta /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8"
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archlap" >> /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1	archlap.localdomain archlap" >> /etc/hosts

printf "Change root password...."
passwd

printf "Creating New User...."
useradd -g users -G  power,storage,wheel,audio,video,libvert -m bleak
printf "Password For bleak: "
passwd bleak
printf "Making Changes to sudoers file...."
cp /etc/sudoers /etc/sudoers.bkp
echo "wheel ALL=(ALL) ALL" >> /etc/sudoers