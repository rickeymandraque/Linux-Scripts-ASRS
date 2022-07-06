#! /bin/bash
# Va créer des dossier TP_Droit0 jusqu'a TP_Droit7, des fichier "Fichier0" jusqu'a "Fichier7" dans les dossiers correspondant et appliquer les droits correspondant au chiffre du dossier et du fichier
# Création des dossier TP_Droit de 0 à 7
mkdir ./TP_Droit{0..7}
# Obtiention de la liste des dossier on pipe à awk et on affiche uniquement la 9eme sortie pour obtenir juste le nom
Liste_Dossier="$(ls -lhAd TP_Droit* | awk '{print$9}')"
# Création d'une fonction appellé Droit_Dossier
function Droit_Dossier()
{
# Creation d'une boucle pour gérer un par un la liste des dossier
# Pour chaque ligne (traitement) dans $Liste_Dossier ; on fait
for traitement in $Liste_Dossier ; do
# la variable nom est égale à traitement (chaque ligne)
nom="$(echo $traitement)"
# la variable num est égale à nom et on pipe pour couper les 8 premiers carateres
num="$(echo $nom  | cut -c 8-)"
# la variable num_droit est égale à affiche moi $num trois fois et on pipe vers sed pour séparer tout les 3 carateres avec un retour à la ligne
num_droit="$(printf "$num"'%.0s' {0..2} | sed 's/.\{3\}/&\
/g')"
# on crée un fichier appellé Fichier$num avec touch vers le dossier $nom (TP_Droit0 par exemple)
touch $nom/Fichier$num
# on change les droit du fichier pour ne pas etre bloqué ou utiliser sudo
chmod $num_droit $nom/Fichier$num
# on change les droit du dossier pour ne pas utiliser sudo
chmod $num_droit $nom
# Fin de la fonction
done
}
# on appel la fonction
droit_dossier
