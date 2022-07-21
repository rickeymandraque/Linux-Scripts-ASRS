# Alias Personnalisé

WHITE="\[\033[0m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32;40m\]"
BLUE="\[\033[1;34m\]"

# Remonter l'arborescence

alias ...="cd ../.."
alias ....="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias .7="cd ../../../../../../.."
alias .8="cd ../../../../../../../.."
alias .9="cd ../../../../../../../../.."

# Créer des dossier de A à Z
alias MKDirAZ="mkdir ./{A..Z}"
# Effacer l'écran façon Windows
alias cls="clear"
# Paser en root
alias BeRoot="sudo -i"
# Rechercher une commande dans l'historique du terminal
alias gh='history | grep'
# Ping façon Windows
alias ping="ping -c 4"
# Obtenir l'IP publique via ifconfig.me
alias MonIPP="printf '\033[0;31m'"$(curl -s ifconfig.me/ip)"'\033[0m'"
# Obtenir le pays de la connexion publique
alias CountryIP="printf '\033[0;31m'"$(curl -s ifconfig.co/country)"'\033[0m'"
# Obtenir L'IP locale via route vers les DNS google
alias MonIPL="printf '\033[0;31m'"$(ip route get 8.8.8.8 | awk '{print $3}')"'\033[0m'"
# alias MonIPL="printf '\033[0;31m'"$(hostname -I)"'\033[0m'"
# On cumule les 3 !
alias IPInfos='printf " IP Locale : \t$(MonIPL)\n IP Public : \t$(MonIPP)\n Pays : \t$(CountryIP)\n"'
# trouver une info sur une IP
alias KiC="IP=$1 ; curl -s --no-keepalive https://ipapi.co/$IP/json"
# Chercher un paquet
alias search='apt-cache search'
# Télécharge les informations des paquets à partir des sources configurées
alias CheckMAJ="sudo apt update "
# Installe les mises à jour identifiée avec apt update sans supprimer les paquets installés.
alias MAJ="sudo apt update && sudo apt upgrade"
# En plus de mettre à jour les paquets existants, elles vont également être en mesure de gérer les dépendances.
alias FullMAJ="sudo apt update && sudo apt dist-upgrade"
# Installer des logiciels
alias jeveux="sudo apt-get install"
complete -F _minimal jeveux
# Speed test depuis github sans sauvegarder le script
alias Speed_Test="wget --quiet -O - speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3"
# Décoder une chaîne en base64
alias dcode64="echo "$1" | base64 -d"
# Encoder une chaîne en base64
alias ncode64="echo "$1" | base64"
alias Météo='curl wttr.in/${1}'
alias exitcode='echo $?'
