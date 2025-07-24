#!/bin/bash

# Installation des applications desktop pour Fedora
sudo dnf install -y \
  brightnessctl playerctl pamixer wireplumber \
  fcitx5 fcitx5-gtk fcitx5-qt \
  nautilus sushi ffmpegthumbnailer \
  slurp \
  mpv evince imv \
  chromium

# Installation de wl-clip-persist via compilation (pas disponible dans les dépôts Fedora)
cd /tmp
if ! command -v wl-clip-persist &> /dev/null; then
  git clone https://github.com/Linus789/wl-clip-persist.git
  cd wl-clip-persist
  make
  sudo make install
  cd ..
  rm -rf wl-clip-persist
fi

# Installation de satty (éditeur de captures d'écran) via Flatpak
flatpak install -y flathub com.gabm.satty

# Installation de wiremix (mixer audio pour PipeWire) si disponible
if dnf search wiremix 2>/dev/null | grep -q wiremix; then
  sudo dnf install -y wiremix
fi

# Sélection d'enregistreur d'écran basé sur le GPU
if lspci | grep -qi 'nvidia'; then
  # Pour les GPU NVIDIA
  sudo dnf install -y wf-recorder
else
  # Pour les autres GPU, installation depuis les sources si nécessaire
  if ! command -v wl-screenrec &> /dev/null; then
    cd /tmp
    git clone https://github.com/russelltg/wl-screenrec.git
    cd wl-screenrec
    cargo install --path .
    cd ..
    rm -rf wl-screenrec
  fi
fi

cd ~

echo "Installation des applications desktop terminée pour Fedora 42"