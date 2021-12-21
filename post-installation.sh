#!/bin/bash
# Post Installation script
paru(){
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
}

basic(){
    sudo pacman -Sy --noconfirm xorg xorg-xrandr ntfs-3g alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol bluez bluez-utils networkmanager network-manager-applet networkmanager-qt ttf-dejavu zip unzip unrar xarchiver
    sudo systemctl enable NetworkManager.service
}

basicApps(){
    sudo pacman -Sy --noconfirm midori firefox vlc nautilus gimp inkscape blender openshot obs-studio libreoffice gnome-system-monitor
}

# TODO: Fix graphicsDriver function and nvidia setting
graphicsDriver(){
    sudo pacman -Sy --noconfirm xorg-xkbcomp xorg-xkbevd xorg-xkbutils xfce4 xfce4-goodies
}

programming(){
    sudo pacman -Sy --noconfirm python nodejs arduino arduino-docs meld code qt6 qtcreator pycharm-community-edition leafpad android-file-transfer android-tools android-udev
}

devOs(){
    sudo pacman -Sy --noconfirm git docker docker-compose docker-machine virtualbox virtualbox-guest-iso virtualbox-ext-vnc
}

hack(){
    sudo pacman -Sy --noconfirm proxychains-ng proxytunnel tor polipo
}

paru
basic
graphicsDriver
basicApps
programming
devOs
hack
