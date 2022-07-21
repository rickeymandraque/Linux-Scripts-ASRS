# Fonctions

# Créer un dossier et entrer dedans
function mkcd() { mkdir -p "$@" && cd "$_"; }
alias mkcd="mkcd"
# Créer des repertoires de Janvier à Décembre
function mkmonth() {
for i in {1..12}; do
  echo "$(date +"%B" --date "${i}/15")" | sed 's/./\U&/'
done
}

# Créer des repertoires de Lundi à Dimanche
function mkdays() {
  for i in {1..7}; do
    mkdir /tmp/$(date +"%A" --date "$i days ago") | sed 's/./\U&/'
  done
}

# affiche les 10 commandes les plus utilisés
function top10()
{
  history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head
}

# Extraire automatiquement 
function extract {
 if [ -z "$1" ]; then
    # afficher l'utilisation si aucun paramètre n'est donné.
    echo "Usage: extract <chemin/Nom_Fichier>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <chemin/Nom_Fichier_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
   for n in $@
do
    if [ -f $n ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case "${n%,}" in
          *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                        tar xvf "$n"       ;;
          *.lzma)       unlzma ./$n      ;;
          *.bz2)        bunzip2 ./$n     ;;
          *.rar)        unrar x -ad ./$n ;;
          *.gz)         gunzip ./$n      ;;
          *.tar)        tar xvf ./$n     ;;
          *.tbz2)       tar xvjf ./$n    ;;
          *.tgz)        tar xvzf ./$n    ;;
          *.zip)        unzip ./$n       ;;
          *.Z)          uncompress ./$n  ;;
          *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                        7z x ./$n        ;;
          *.xz)         unxz ./$n        ;;
          *.exe)        cabextract ./$n  ;;
          *)            echo "extract: '$n' - méthode d'archivage inconnue" ;;
        esac
    else
        echo "$n - fichier ne existe pas"
    fi
  done
fi
}



# Mettre un mot en capital
capup(){
    if [ $# -lt 1 ]; then
        echo "Usage: upper word"
        return 1
    fi
    echo ${@^^}
}


# Mettre un mot en minuscule
minuscule(){
    if [ $# -lt 1 ]; then
        echo "Usage: lower word"
        return 1
    fi
    echo ${@,,}
}

# convertir du decimal vers le binaire

function convert-decimaltobinary(){
        n="$1"
        bit=""
        while [ "$n" -gt 0 ]; do
            bit="$(( n&1 ))$bit";
            : $(( n >>= 1 ))
        done
        printf "%s\n" "$bit"
    }
# convertir du binaire vers le décimal

    function convert-binarytodecimal()
    {
        echo "$((2#$1))"
    }
    
# convertir de l'hexa vers le décimal
    function convert-hextodecimal(){
        echo $(( 16#$1 ))
    }

# Convertir une  video en gif
  function qq_convert_video_to_gif(){
    ffmpeg -i $1 $1.gif
  }
