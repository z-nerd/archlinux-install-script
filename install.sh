#!/bin/bash
# Install ArchLinux script

# TODO: Add function to create /, home, swap, ...

BasePackage(){
	echo "
	Let's have fun with ArchLinux!
	"
	pacstrap /mnt base base-devel linux linux-headers linux-firmware linux-lts linux-lts-headers
}

ConfigureTheSystem(){
	genfstab -U /mnt >> /mnt/etc/fstab
	cat /mnt/etc/fstab
}

ChrootConfig(){
	cd ~
	cp -r archlinux-install-script /mnt
	arch-chroot /mnt ./archlinux-install-script/bin/chroot-config.sh
}


BasePackage
ConfigureTheSystem
ChrootConfig

