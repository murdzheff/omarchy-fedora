#!/bin/bash

# Installation des polices de base pour Fedora
if [ -z "$OMARCHY_BARE" ]; then
  sudo dnf install -y fontawesome-fonts google-noto-fonts google-noto-emoji-fonts google-noto-cjk-fonts google-noto-fonts-extra
else
  sudo dnf install -y fontawesome-fonts google-noto-fonts google-noto-emoji-fonts
fi

mkdir -p ~/.local/share/fonts

# Installation de CaskaydiaMono Nerd Font si non présente
if ! fc-list | grep -qi "CaskaydiaMono Nerd Font"; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip CascadiaMono.zip -d CascadiaFont
  cp CascadiaFont/CaskaydiaMonoNerdFont-Regular.ttf ~/.local/share/fonts/
  cp CascadiaFont/CaskaydiaMonoNerdFont-Bold.ttf ~/.local/share/fonts/
  cp CascadiaFont/CaskaydiaMonoNerdFont-Italic.ttf ~/.local/share/fonts/
  cp CascadiaFont/CaskaydiaMonoNerdFont-BoldItalic.ttf ~/.local/share/fonts/
  cp CascadiaFont/CaskaydiaMonoNerdFontPropo-Regular.ttf ~/.local/share/fonts/
  cp CascadiaFont/CaskaydiaMonoNerdFontPropo-Bold.ttf ~/.local/share/fonts/
  cp CascadiaFont/CaskaydiaMonoNerdFontPropo-Italic.ttf ~/.local/share/fonts/
  cp CascadiaFont/CaskaydiaMonoNerdFontPropo-BoldItalic.ttf ~/.local/share/fonts/
  rm -rf CascadiaMono.zip CascadiaFont
  fc-cache -f
  cd -
fi

# Installation de iA Writer Mono S si non présente
if ! fc-list | grep -qi "iA Writer Mono S"; then
  cd /tmp
  wget -O iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
  unzip iafonts.zip -d iaFonts
  cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/.local/share/fonts/
  rm -rf iafonts.zip iaFonts
  fc-cache -f
  cd -
fi

echo "Installation des polices terminée pour Fedora 42"