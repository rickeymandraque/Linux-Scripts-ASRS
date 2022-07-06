#! /bin/bash
mkdir ./TP_Droit{0..7}
Liste_Dossier="$(ls -lhAd TP_Droit* | awk '{print$9}')"
function Droit_Dossier()
{
for traitement in $Liste_Dossier ; do
nom="$(echo $traitement)"
num="$(echo $nom  | cut -c 8-)"
num_droit="$(printf "$num"'%.0s' {0..2} | sed 's/.\{3\}/&\
/g')"
touch $nom/Fichier$num
chmod $num_droit $nom/Fichier$num
chmod $num_droit $nom
done
}

droit_dossier
