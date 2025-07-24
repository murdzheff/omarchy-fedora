#!/bin/bash

# Sortie immédiate si une commande échoue
set -e

# Gestion des erreurs pour Fedora
catch_errors() {
  echo -e "\n\e[31mÉchec de l'installation Omarchy Fedora!\e[0m"
  echo "Vous pouvez réessayer en exécutant: bash ~/.local/share/omarchy-fedora/install.sh"
  echo "Obtenez de l'aide de la communauté: https://discord.gg/tXFUdasqhY"
}

trap catch_errors ERR

# Déterminer le répertoire du script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Installation de tous les composants
for f in "$SCRIPT_DIR"/install/*.sh; do
  echo -e "\nExécution de l'installateur: $f"
  source "$f"
done

# Mise à jour de la base de données locate maintenant que tout est installé
sudo updatedb

# Mise à jour de tous les paquets installés
sudo dnf upgrade -y

# Proposition de redémarrage
gum confirm "Redémarrer pour appliquer tous les paramètres?" && reboot