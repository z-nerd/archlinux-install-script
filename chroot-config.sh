#!/bin/bash
# Chroot config script

ClockConfig(){
	cd 
	ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
	hwclock --systohc
}

# TODO: delete cd /archlinux-install-script/bin and make it a path variable
LanguageConfig(){
	cd /archlinux-install-script/bin
	cp ./config-files/locale.gen /etc/locale.gen	
	locale-gen
	echo LANG=en_US.UTF-8 > /etc/locale.conf
}

ConfigPacman(){
	cp ./config-files/pacman.conf /etc/pacman.conf
}

HostConfig(){
	echo archLinux > /etc/hostname
}

Initramfs(){
	mkinitcpio -P
}

SetRootPassword(){
	passwd
}

InternetConfig(){
    sudo pacman -Sy --noconfirm dhcpcd networkmanager-pptp networkmanager-vpnc networkmanager-openvpn networkmanager-openconnect iwd
    systemctl enable NetworkManager.service
	systemctl enable dhcpcd.service
    systemctl start dhcpcd.service
	#systemctl enable iwd.service
	#systemctl start iwd.service
}

# TODO: make AddUser() more dynamic
AddUser(){
	cp ./config-files/sudoers /etc/sudoers
	sudo pacman -Sy --noconfirm nano vim zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting grml-zsh-config
	useradd -m -G wheel,power,storage,tty -s /bin/zsh zero
	passwd zero
}

BootLoader(){
	pacman -Sy --noconfirm grub os-prober
	grub-install /dev/sda
	grub-mkconfig -o /boot/grub/grub.cfg
}

ClockConfig
LanguageConfig
ConfigPacman
HostConfig
Initramfs
InternetConfig
BootLoader
SetRootPassword
AddUser
