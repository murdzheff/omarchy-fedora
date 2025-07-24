#!/bin/bash

# Installation de l'écosystème Hyprland pour Fedora
sudo dnf install -y \
  hyprland hyprlock hypridle polkit-gnome \
  waybar mako swaybg swayosd \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Installation des outils spécifiques Hyprland via Flatpak ou compilation
# hyprshot et hyprpicker peuvent nécessiter une compilation depuis les sources
cd /tmp

# Installation de hyprshot (outil de capture d'écran)
if ! command -v hyprshot &> /dev/null; then
  git clone https://github.com/Gustash/hyprshot.git
  cd hyprshot
  make install
  cd ..
  rm -rf hyprshot
fi

# Installation de hyprpicker (sélecteur de couleurs)
if ! command -v hyprpicker &> /dev/null; then
  git clone https://github.com/hyprwm/hyprpicker.git
  cd hyprpicker
  make all
  sudo make install
  cd ..
  rm -rf hyprpicker
fi

# Installation de walker (lanceur d'applications) via Flatpak
flatpak install -y flathub io.github.walker-org.walker

# Installation de libqalculate pour les calculs dans les lanceurs
sudo dnf install -y libqalculate

cd ~

echo "Installation de l'écosystème Hyprland terminée pour Fedora 42"