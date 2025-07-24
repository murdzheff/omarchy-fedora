#!/bin/bash

# Déterminer le répertoire racine du projet
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Installer le projet dans ~/.local/share pour cohérence avec l'original
mkdir -p ~/.local/share
cp -R "$SCRIPT_DIR" ~/.local/share/omarchy-fedora

# Copie des configurations Omarchy adaptées pour Fedora
cp -R ~/.local/share/omarchy-fedora/config/* ~/.config/

# Utilisation du bashrc par défaut d'Omarchy Fedora
echo "source ~/.local/share/omarchy-fedora/default/bash/rc" >~/.bashrc

# S'assurer que le répertoire applications existe pour update-desktop-database
mkdir -p ~/.local/share/applications

# Configuration GPG avec plusieurs serveurs de clés pour une meilleure fiabilité
sudo mkdir -p /etc/gnupg
sudo cp ~/.local/share/omarchy-fedora/default/gpg/dirmngr.conf /etc/gnupg/
sudo chmod 644 /etc/gnupg/dirmngr.conf
sudo gpgconf --kill dirmngr || true
sudo gpgconf --launch dirmngr || true

# Configuration PAM faillock pour Fedora (adaptation des chemins)
if [ -f "/etc/pam.d/system-auth" ]; then
  sudo sed -i 's|^\(auth\s\+required\s\+pam_faillock.so\)\s\+preauth.*$|\1 preauth silent deny=10 unlock_time=120|' "/etc/pam.d/system-auth"
  sudo sed -i 's|^\(auth\s\+\[default=die\]\s\+pam_faillock.so\)\s\+authfail.*$|\1 authfail deny=10 unlock_time=120|' "/etc/pam.d/system-auth"
fi

# Configuration des aliases Git communs
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch main

# Configuration de l'identification depuis les entrées d'installation
if [[ -n "${OMARCHY_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMARCHY_USER_NAME"
fi

if [[ -n "${OMARCHY_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMARCHY_USER_EMAIL"
fi

# Configuration XCompose par défaut déclenchée avec CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omarchy-fedora/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMARCHY_USER_NAME"
<Multi_key> <space> <e> : "$OMARCHY_USER_EMAIL"
EOF

echo "Configuration du système terminée pour Fedora 42"