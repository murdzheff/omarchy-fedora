#!/bin/bash

echo "🔧 Correction du script 1-dnf-setup.sh..."

# Remplacer le contenu du script défaillant
cat > ~/.local/share/omarchy-fedora/install/1-dnf-setup.sh << 'EOF'
#!/bin/bash

# Installation des outils de développement de base pour Fedora
echo "Installation des outils de développement..."
sudo dnf install -y gcc gcc-c++ make cmake autoconf automake libtool pkgconf pkg-config

# Configuration des dépôts RPM Fusion pour les paquets supplémentaires  
echo "Configuration des dépôts RPM Fusion..."
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Installation de Flatpak pour les applications non disponibles dans les dépôts
echo "Installation de Flatpak..."
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Configuration DNF pour des performances améliorées
echo "Configuration DNF..."
sudo tee -a /etc/dnf/dnf.conf << 'DNFEOF'

# Configuration pour de meilleures performances
max_parallel_downloads=10
defaultyes=True
keepcache=True

# Couleurs et interface améliorée
color=always
DNFEOF

echo "✅ Configuration DNF et dépôts terminée pour Fedora 42"
EOF

chmod +x ~/.local/share/omarchy-fedora/install/1-dnf-setup.sh

echo "✅ Script corrigé avec succès!"
echo "Relancez maintenant: bash ~/.local/share/omarchy-fedora/install.sh"