# #! /bin/bash

# snap remove --purge firefox
# snap remove --purge snap-store
# snap remove --purge gnome-3-38-2004
# snap remove --purge gtk-common-themes
# snap remove --purge snapd-desktop-integration
# snap remove --purge bare
# snap remove --purge core20
# snap remove --purge snapd
# apt remove --autoremove snapd
# apt purge snap*


# printf "Package: snapd\nPin: release *\nPin-Priority: -1\n" > /etc/apt/preferences.d/nosnap
# printf "Package: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1\n\nPackage: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 99" > /etc/apt/preferences.d/firefox-for-nosnaps
# printf 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' >> /etc/apt/apt.conf.d/50unattended-upgrades-firefox
# add-apt-repository ppa:mozillateam/ppa -y
# apt update && apt upgrade -y && apt update && apt dist-upgrade -y

# apt install firefox firefox-locale-fr gnome-shell gnome-shell-extensions xul-ext-ubufox

#! /bin/bash
# Pour Ubuntu 22.04
# On desactive les services snap
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
# on désinstalle les paquet snap dans un ordre bien précis
sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-3-38-2004
# Il n'y a pas deb disponible pour ce paquet...
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core20
sudo snap remove --purge snapd
# On vire tout !
sudo apt autoremove --purge -y snapd
# On supprime le cache des paquet snap
sudo rm -rf /var/cache/snapd/
rm -rf ~/snap

# On créer des Fichiers pour bloquer completement les snaps
sudo printf "Package: snapd\nPin: release a=*\nPin-Priority: -10\n" > /etc/apt/preferences.d/nosnap
sudo printf "Package: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1\n\nPackage: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 99" > /etc/apt/preferences.d/firefox-for-nosnaps
sudo printf 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' >> /etc/apt/apt.conf.d/50unattended-upgrades-firefox
# On ajoute les dépots supplémentaire.
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo add-apt-repository ppa:astroncia/iptv -y

wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/Atom.list'

sudo apt update && sudo apt upgrade -y && sudo apt update && sudo apt dist-upgrade -y

# sudo apt install firefox firefox-locale-fr gnome-shell gnome-shell-extensions xul-ext-ubufox libarchive-tools bash-completion gtk-theme-switch atom acetoneiso aspell aspell-en astronciaiptv
# tldr -u


