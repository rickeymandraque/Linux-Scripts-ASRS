#!/bin/bash

# Cette variable ne sert pas à grand chose, c'est juste pour illustrer.
WorkingDir="$PWD"
# Pour chaque nom dans toute les entrée on fait
for Liste_Fichiers in "$@"; do
  # Si il commence par "." suivie de qqchose alors
  if [[ "$Liste_Fichiers" == .* ]]; then
    # On attribut la variable LNH (List Not Hidden) et on coupe le "." du début
    LNH="$WorkingDir/$(echo $Liste_Fichiers | cut -c 2- )"
    # On le renomme de .nom à .nom | le "." coupé !
    mv "$WorkingDir/$Liste_Fichiers" "$LNH"
    # Sinon
  else
    # On le renomme de nom à .nom
  mv "$WorkingDir/$Liste_Fichiers" "$WorkingDir/.$Liste_Fichiers"
  # If terminé
  fi
  # for terminé
done
