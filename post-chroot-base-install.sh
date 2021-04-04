#!/usr/bin/sh

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

printf "Installing Neccessary Packages...."
pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet iwd mtools dosfstools reflector xdg-user-dirs xdg-utils inetutils dnsutils bluez bluez-utils alsa-utils pulseaudio openssh rsync reflector acpi acpi_call acpid ebtables iptables ipset firewalld flatpak os-prober
printf "Enabling Neccessary Services"

