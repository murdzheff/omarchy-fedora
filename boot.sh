#!/bin/bash

ansi_art=' ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████    ▄████████  ▄████████    ▄█    █▄    ▄██   ▄  
███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███   ███    ███ ███    ███   ███    ███   ███   ██▄
███    ███ ███   ███   ███   ███    ███   ███    ███ ███    █▀    ███    ███   ███▄▄▄███
███    ███ ███   ███   ███   ███    ███  ▄███▄▄▄▄██▀ ███         ▄███▄▄▄▄███▄▄ ▀▀▀▀▀▀███
███    ███ ███   ███   ███ ▀███████████ ▀▀███▀▀▀▀▀   ███        ▀▀███▀▀▀▀███▀  ▄██   ███
███    ███ ███   ███   ███   ███    ███ ▀███████████ ███    █▄    ███    ███   ███   ███
███    ███ ███   ███   ███   ███    ███   ███    ███ ███    ███   ███    ███   ███   ███
 ▀██████▀   ▀█   ███   █▀    ███    █▀    ███    ███ ████████▀    ███    █▀     ▀█████▀ 
                                          ███    ███                                    
                                                                          
                       FEDORA 42 EDITION'

echo -e "\n$ansi_art\n"

# Installation des paquets de base pour Fedora
sudo dnf install -y git

# Déterminer si on exécute depuis un dossier local ou on doit cloner
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -f "$SCRIPT_DIR/install.sh" ]]; then
  # Installation locale
  echo -e "\nInstallation locale d'Omarchy Fedora Edition..."
  echo -e "\nDémarrage de l'installation pour Fedora 42..."
  source "$SCRIPT_DIR/install.sh"
else
  # Installation depuis GitHub
  echo -e "\nCloning Omarchy Fedora Edition..."
  rm -rf ~/.local/share/omarchy-fedora/
  git clone https://github.com/votre-repo/omarchy-fedora.git ~/.local/share/omarchy-fedora >/dev/null
  
  # Utilisation d'une branche personnalisée si spécifiée
  if [[ -n "$OMARCHY_FEDORA_REF" ]]; then
    echo -e "\nUtilisation de la branche: $OMARCHY_FEDORA_REF"
    cd ~/.local/share/omarchy-fedora
    git fetch origin "${OMARCHY_FEDORA_REF}" && git checkout "${OMARCHY_FEDORA_REF}"
    cd -
  fi
  
  echo -e "\nDémarrage de l'installation pour Fedora 42..."
  source ~/.local/share/omarchy-fedora/install.sh
fi