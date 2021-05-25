#!/bin/sh

printf "Setting up Locales and timezone"
timedatectl set-ntp true;
ln -sf /usr/share/zoneinfo/Asia/Kolkatta /etc/localtime;
hwclock --systohc;
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen;
locale-gen;
echo "LANG=en_US.UTF-8" >> /etc/locale.conf;
echo "archlap" >> /etc/hostname;
{ echo "127.0.0.1	localhost";
  echo "::1         localhost";
  echo "127.0.1.1	archlap.localdomain archlap"; }>> /etc/hosts;

printf "Change root password...."
passwd;

printf "Creating New User...."
useradd -g users -G  power,storage,wheel,audio,video -m bleak;
printf "Password For bleak: ";
passwd bleak;
printf "Making Changes to sudoers file...."
cp /etc/sudoers /etc/sudoers.bkp; #Backing up sudoers file in case I fuck up
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers;

printf "Installing Neccessary Packages...."
pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet iwd dhcpd mtools dosfstools xdg-user-dirs xdg-utils inetutils dnsutils bluez bluez-utils alsa-utils pulseaudio libldac openssh rsync acpi acpi_call acpid ebtables iptables ipset firewalld flatpak os-prober;

printf "Enabling Neccessary Services"
systemctl enable NetworkManager;
systemctl enable dhcpd;
systemctl enable bluetooth;
systemctl enable sshd;
systemctl enable firewalld;
systemctl enable acpid;
systemctl enable iwd;

printf "Installing Grub And Generating Config File...."
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB;
#Comment lines 40 and 41 if you have want to configure dual-boot
mkdir /winboot;
mount /dev/sda /winboot; #here /dev/sda1 is windows efi partition yours may vary
grub-mkconfig -o /boot/grub/grub.cfg;

printf "Script Has Finished Installation...."

printf "Copy the Scripts to Home To continue Installation"
