#! /bin/bash

snap remove --purge firefox
snap remove --purge snap-store
snap remove --purge gnome-3-38-2004
snap remove --purge gtk-common-themes
snap remove --purge snapd-desktop-integration
snap remove --purge bare
snap remove --purge core20
snap remove --purge snapd
apt remove --autoremove snapd
apt purge snap*


printf "Package: snapd\nPin: release *\nPin-Priority: -1\n" > /etc/apt/preferences.d/nosnap
printf "Package: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1\n\nPackage: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 99" > /etc/apt/preferences.d/firefox-for-nosnaps
printf 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' >> /etc/apt/apt.conf.d/50unattended-upgrades-firefox
add-apt-repository ppa:mozillateam/ppa -y
apt update && apt upgrade -y && apt update && apt dist-upgrade -y

apt install firefox firefox-locale-fr gnome-shell xul-ext-ubufox
