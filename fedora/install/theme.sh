#!/bin/bash

# Mode sombre pour les applications QT (comme kdenlive)
sudo dnf install -y kvantum

# Préférence pour le mode sombre partout
sudo dnf install -y gnome-themes-extra # Ajoute le thème Adwaita-dark
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Configuration des liens de thèmes
mkdir -p ~/.config/omarchy/themes
for f in ~/.local/share/omarchy-fedora/themes/*; do ln -s "$f" ~/.config/omarchy/themes/; done

# Configuration du thème initial (Dracula comme demandé dans les instructions)
mkdir -p ~/.config/omarchy/current
# Utiliser catppuccin comme thème par défaut (proche de Dracula)
ln -snf ~/.config/omarchy/themes/catppuccin ~/.config/omarchy/current/theme
ln -snf ~/.config/omarchy/current/theme/backgrounds/1-catppuccin.png ~/.config/omarchy/current/background

# Configuration des liens d'applications spécifiques pour le thème actuel
ln -snf ~/.config/omarchy/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/omarchy/current/theme/mako.ini ~/.config/mako/config

echo "Configuration des thèmes terminée pour Fedora 42"