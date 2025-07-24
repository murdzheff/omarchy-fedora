#!/bin/bash

# Installation des outils terminal essentiels pour Fedora
sudo dnf install -y \
  wget curl unzip net-tools \
  fd-find eza fzf ripgrep zoxide bat jq \
  wl-clipboard fastfetch btop \
  man-db tldr less whois mlocate bash-completion \
  alacritty

# UV : Gestionnaire de paquets Python moderne (remplace pip/pipenv/pyenv)
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.local/bin/env

# Configuration des aliases pour UV comme gestionnaire Python par défaut
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

echo "Installation des outils terminal terminée pour Fedora 42"