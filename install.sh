#!/usr/bin/sh

base_install()
{	echo "Will Install following packages:
		1. base and base-developer packages.
		2. linux kernel, linux kernel headers and linux firmware.
		3. vim and neovim text editor"	
	pacstrap -i /mnt base base-devel linux linux-firmware linux-headers vim nvim
}

while true
do
 read -r -p "Are You Sure? [Y/n] " ch
 
 case $ch in
     [yY][eE][sS]|[yY])
 												base_install
 												break;;
     
		 [nN][oO]|[nN])
        								echo "Enter a valid choice"
												continue;;
     *)
 			echo "Invalid input...";;
 esac
done

echo "Generating the fstab file...."
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

echo "Changing root directory...."
arch-chroot /mnt