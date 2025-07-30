#!/bin/bash

# Installation des outils de développement de base pour Fedora
# Utiliser dnf group install pour DNF5
dnf group install -y "Development Tools" "Development Libraries" || \
dnf install -y gcc gcc-c++ make cmake autoconf automake libtool pkgconf-devel

# Configuration des dépôts RPM Fusion pour les paquets supplémentaires
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Installation de Flatpak pour les applications non disponibles dans les dépôts
dnf install -y flatpak


# Configuration DNF pour des performances améliorées
tee -a /etc/dnf/dnf.conf << 'EOF'

# Configuration pour de meilleures performances
max_parallel_downloads=10
defaultyes=True
keepcache=True

# Couleurs et interface améliorée
color=always
EOF

echo "Configuration DNF et dépôts terminée pour Fedora 42"
