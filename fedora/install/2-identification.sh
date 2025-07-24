#!/bin/bash

# Installation de gum pour les interfaces utilisateur interactives
sudo dnf install -y gum

# Déterminer le répertoire racine du projet
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Configuration de l'identification utilisateur
source "$SCRIPT_DIR/ansi.sh"
echo -e "\nSaisie de l'identification pour git et l'auto-complétion..."
export OMARCHY_USER_NAME=$(gum input --placeholder "Entrez votre nom complet" --prompt "Nom> ")
export OMARCHY_USER_EMAIL=$(gum input --placeholder "Entrez votre adresse email" --prompt "Email> ")