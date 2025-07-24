#!/bin/bash

# Installation des outils de développement pour Fedora
sudo dnf install -y \
  cargo rust clang llvm \
  ImageMagick \
  mariadb-connector-c-devel postgresql-devel \
  gh

# Installation de mise (gestionnaire de versions de runtime)
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc

# Installation des outils TUI via Flatpak
flatpak install -y flathub io.github.jesseduffield.lazygit
flatpak install -y flathub io.github.jesseduffield.lazydocker

# Ansible pour l'automatisation et la gestion de configuration
sudo dnf install -y ansible ansible-core

# OpenTofu (alternative open source à Terraform)
# Installation via le script officiel
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method rpm
rm install-opentofu.sh

echo "Installation des outils de développement terminée pour Fedora 42"