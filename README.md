# Arch Linux Installation Scripts
These are various shell scripts for installation of/in Arch linux which includes OS installation to my programming essential tools

## Type Of Scripts
So I have created around 8 shell scripts for ease of use
Which Are-
#### I. Arch Linux Installation Scripts
`pre-chroot-base-install.sh` and `post-chroot-base-install.sh` scripts are arch linux installation scripts for efi machines
There are two scripts i.e. a pre-chroot installation script and a post-chroot installation script.
Before you start the script make sure you have formatted the root and efi partitions and mounted them properly.
First run the pre-chroot script to install base packages, since you are already in logged in as root so you won't need to run it as sudo.
```
chmod +x pre-chroot-base-install.sh
./pre-chroot-base-install.sh
```
Once the base packages are installed the script will change root by `arch-chroot /mnt` before its execution is done.
After that run post-chroot script to begin setup of localization, host, networking, useradd, and grub installation
```
chmod +x post-chroot-base-install.sh
./post-chroot-base-install.sh
```
Once the script has done executing it will reclone the entire script repository into the user's Download folder.
Feel free to make any changes to the script that fit for your needs ;)
If you're having any doubt consult [arch linux installation guide](https://wiki.archlinux.org/index.php/Installation_guide).

#### II. Graphical Environments
There are 3 scipts for 3 graphical environments which I use i.e. `DWM`, `KDE Plasma`, `Gnome`. Note that you have manually start the x server by `startx` or install a display manager and enable it
###### 1. [DWM](https://wiki.archlinux.org/index.php/Dwm):
`dwm-install.sh` script will install dwm from repository which has many configs that I made, [click here](https://github.com/bleak-alpha/dwm-set/) to check those configs and it will also install require prerequisites neccessary for dwm to run.
The script will automaticaly create an xinitrc file (if not present) and make the required changes to start dwm with x automatically.
Just change the script to an executible and run it.
```
chmod +x ./dwm-install.sh
./dwm-install.sh
```
###### 2. [KDE Plasma](https://wiki.archlinux.org/index.php/KDE):
`kde-install.sh` script will install `plasma` and `kde-applications` from the arch repository.
Just make this script executible and run it.
```
chmod +x kde-install.sh
./kde-install.sh
```
The script will automatically create an xinitrc file (if not present) and make the required changes to start kde with x automatically.
If you want to start kde with a display manager, it will have sddm installed with it. Just enable the sddm service and start it
```
sudo systemctl enable --now sddm
sudo systemctl start sddm
```

###### 3. [Gnome](https://wiki.archlinux.org/index.php/GNOME):
`gnome-install.sh` script will install `gnome` and `gnome-extra` (for customizability) from the arch repository
Just make this script executible and run it.
```
chmod +x gnome-install.sh
sudo ./gnome-install.sh
```
The script will automatically create an xinitrc file (if not present) and make required changes to it to start gnome with x automatically.
If you want to start gnome with a display manager, it will have gdm installed with it. Just enable the gdm service and start it
```
sudo systemctl enable --now gdm
sudo systemctl start gdm
```


#### III. AUR Packages:
`aur-packages.sh` script will install `paru`; it is an aur-pacman wrapper with similar commands and flags to `pacman`, [click here](https://github.com/morganamilo/paru).
Just make this script executible and run it WITHOUT sudo.
```
chmod +x aur-packages.sh
./aur-packages.sh
```
After its done installing `paru`, `paru` will download and install these aur packages:
* `birdtray` Thunderbird Email systray
* `pnmixer` PulseAudio systray
* `brave-bin` Brave, A chromium-based web browser (I have a potato laptop so I cant afford to compile)
* `pulseaudio-modules-bt` AptX Bluetooth Drivers (for my headphones)
* `sublime-text-3` A GUI text editor
* `spotify` A music streaming service (as if you didn't know)
* `spotifywm-git` A module to run spotify on tiling window managers
* `protnvpn-cli-ng` OpenVPN based ProtonVPN CLI client
* `timeshift-bin` Application to backup and restore system using snapshots
* `ttf-google-fonts-typewolf` Font pack from google which has a better font collection
* `ttf-mac-fonts` Mac emojis
* `betterlockscreen` Lockscreen when laptop is suspended or on stand-by


#### IV. My Programming Essentials
`programming-essentials.sh` script will make some changes to `/etc/pacman.conf` and include `multilib` repository and install some of my essential programming tools and applications which are:
* `wine` Windows compatibility layer to run MS-Windows Application (mainly Borland C++, cause gcc acts weird in my laptop)
* `code` Visual Studio Code to execute and write code in various languages (btw I also use neovim so don't bash me as normie)
* `gnome-keyring` To store crendentials in VS Code
* `python` Python shell for programming
* `jre-openjdk` Java Runtime Environment for writing and testing Java code
* `rust` Rust programming language to create and test applications
* `ghc` `cabal-install` `stack` Tools needed to run HasKell Server, and to test HasKell code.
Just make script executible and run it.
```
chmod +x programming-essentials.sh
./programming-essentials.sh
```
These are my required applications. If you have some other requirments, make changes that fit your needs and run the script ;) and its not that hard to create shell scripts if you are already familiar with programming, it took me around 30 mins to understand few syntaxes and control structures.
