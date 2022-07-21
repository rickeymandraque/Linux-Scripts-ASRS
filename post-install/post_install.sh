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
sudo apt autoremove --purge snapd
# On supprime le cache des paquet snap
sudo rm -rf /var/cache/snapd/
rm -rf ~/snap

# On créer des Fichiers pour bloquer completement les snaps
sudo wget "https://raw.githubusercontent.com/rickeymandraque/Linux-Scripts-ASRS/main/post-install/nosnap" -O /etc/apt/preferences.d/nosnap
sudo wget "https://raw.githubusercontent.com/rickeymandraque/Linux-Scripts-ASRS/main/post-install/firefox-for-nosnaps" -O /etc/apt/preferences.d/firefox-for-nosnaps
sudo wget "https://raw.githubusercontent.com/rickeymandraque/Linux-Scripts-ASRS/main/post-install/50unattended-upgrades-firefox" -O /etc/apt/apt.conf.d/50unattended-upgrades-firefox
# On ajoute les dépots supplémentaire.
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo add-apt-repository ppa:astroncia/iptv -y

wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/Atom.list'

sudo apt update && sudo apt upgrade -y && sudo apt update && sudo apt dist-upgrade -y

# sudo apt install firefox firefox-locale-fr gnome-shell gnome-shell-extensions xul-ext-ubufox libarchive-tools bash-completion gtk-theme-switch atom acetoneiso aspell aspell-en astronciaiptv
# tldr -u




