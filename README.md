# Omarchy Fedora 42 Edition

!! Ne fonctionne pas pour le moment !!

Environnement de bureau Hyprland complet pour Fedora 42 avec support UV, Ansible et OpenTofu.

## 🚀 Installation Rapide

```bash
# Cloner le repository
git clone https://github.com/Mounik/omarchy-fedora
cd omarchy-fedora

# Rendre le script exécutable
chmod +x install.sh

# Lancer l'installation (avec sudo)
sudo ./install.sh
```

Ou installation directe depuis internet :
```bash
curl -fsSL https://raw.githubusercontent.com/Mounik/omarchy-fedora/main/boot.sh | bash
```

## 🎯 Nouvelles Fonctionnalités Fedora Edition

### 🐍 Python Moderne avec UV
- **UV** : Gestionnaire de paquets Python ultra-rapide (remplace pip/pipenv/pyenv)
- **Aliases intégrés** : `pip` → `uv pip`, `venv` → `uv venv`, `python` → `uv run python`
- **Fonction `uv-project()`** : Création projet Python complet avec outils de développement

### 🛠️ DevOps Intégré
- **Ansible** : Automatisation et gestion de configuration
- **OpenTofu** : Alternative open source à Terraform
- **Aliases optimisés** : `tf`/`terraform` → `tofu`, `ap` → `ansible-playbook`
- **Fonction `tofu-workflow()`** : Workflow complet (fmt→init→validate→plan)

### 📦 Gestion des Paquets Fedora
- **DNF optimisé** : Configuration avec téléchargements parallèles et couleurs
- **RPM Fusion** : Accès aux paquets multimédias et propriétaires
- **Flatpak intégré** : Applications modernes via Flathub
- **Recherche interactive** : `dnff` et `flatf` avec prévisualisation fzf

## 🎨 Expérience Identique à Omarchy Original

### Interface Hyprland Complète
- **Même raccourcis clavier** : Super+Espace (launcher), Super+Return (terminal), etc.
- **Thèmes multiples** : catppuccin, tokyo-night, gruvbox, dracula, etc.
- **Applications pré-configurées** : Alacritty, Waybar, Mako, Walker
- **Changement thème à chaud** : Sans redémarrage système

### Outils de Développement
- **LazyVim** : Configuration Neovim avec LSP complets
- **Lazygit/Lazydocker** : Interfaces TUI pour Git et Docker
- **GitHub CLI** : Intégration GitHub native
- **Mise** : Gestionnaire versions multiples pour tous langages

### XCompose et Productivité
- **Émojis rapides** : CapsLock + m + s = 😄, CapsLock + m + h = ❤️
- **Saisie intelligente** : CapsLock + space + space = —
- **Auto-complétion** : CapsLock + space + n/e = nom/email utilisateur

## 📋 Prérequis Fedora 42

- Installation Fedora 42 fraîche ou existante
- Connexion internet pour téléchargement des paquets
- Droits sudo pour l'utilisateur

## 🔧 Adaptations Spécifiques Fedora

### Gestionnaires de Paquets
- **dnf** : Remplace pacman avec optimisations performances
- **Flatpak** : Pour applications non disponibles dans dépôts RPM
- **RPM Fusion** : Codecs multimédias et drivers propriétaires

### Sécurité et Système
- **SELinux** : Politiques adaptées pour Hyprland
- **Firewalld** : Configuration firewall moderne
- **systemd** : Services identiques, configurations portables

### Compilation et Développement
- **Development Tools** : Équivalent base-devel d'Arch
- **Compilation sources** : Scripts automatiques pour outils non-packagés
- **Support multi-architecture** : x86_64 et aarch64

## 🎯 Applications Incluses

### Terminal et CLI
- **Alacritty** : Terminal moderne avec thèmes
- **eza, fzf, ripgrep, zoxide, bat** : Outils CLI modernes
- **btop, fastfetch** : Monitoring et informations système

### Interface Graphique
- **Hyprland** : Window manager Wayland performant
- **Waybar** : Barre de statut modulaire et stylée
- **Walker** : Lanceur d'applications avec recherche floue
- **Mako** : Notifications natives Wayland

### Développement
- **Neovim + LazyVim** : Éditeur avec LSP complets
- **Python (UV)** : Environnement Python moderne
- **Ansible** : Automatisation infrastructure
- **OpenTofu** : Infrastructure as Code
- **Docker + Lazydocker** : Conteneurisation

### Applications Desktop
- **Chromium** : Navigateur principal
- **Nautilus** : Gestionnaire fichiers GNOME
- **mpv, imv, evince** : Multimédia et documents

## 🔄 Après Installation

1. **Redémarrez** pour charger Hyprland
2. **Sélectionnez Hyprland** dans le gestionnaire de session
3. **Super + K** : Afficher tous les raccourcis
4. **Super + Space** : Lancer des applications
5. **Terminal** : Tous les aliases (`tf`, `pip`, `ap`) sont configurés

## 🎨 Gestion des Thèmes

```bash
# Changer de thème
omarchy-theme-set catppuccin
omarchy-theme-set tokyo-night
omarchy-theme-set dracula

# Rotation automatique
omarchy-theme-next

# Menu interactif
omarchy-theme-menu
```

## 🐍 Utilisation UV (Python)

```bash
# Créer un nouveau projet Python
uv-project mon-projet

# Dans le projet
uv add requests pandas
uv add --dev pytest black ruff
uv run python main.py
uv run pytest
```

## 🛠️ DevOps avec OpenTofu et Ansible

```bash
# Workflow OpenTofu complet
tofu-workflow  # fmt → init → validate → plan

# Commandes Ansible
ap playbook.yml  # ansible-playbook
av encrypt vars.yml  # ansible-vault
ag install community.general  # ansible-galaxy
```

## 🆘 Support et Communauté

- **GitHub Issues** : Signaler bugs et demandes fonctionnalités
- **Discord Omarchy** : https://discord.gg/tXFUdasqhY
- **Documentation** : Wiki avec guides détaillés

## 📝 Différences avec Omarchy Original

| Fonctionnalité | Omarchy Arch | Omarchy Fedora |
|----------------|--------------|----------------|
| Gestionnaire paquets | pacman + yay | dnf + flatpak |
| Python | pip/pipenv | UV (moderne) |
| IaC | - | OpenTofu |
| Automation | - | Ansible |
| Sécurité | PAM standard | SELinux + Firewalld |
| Compilation | makepkg | rpmbuild |

---

## 🚀 Développé pour Fedora 42

Cette adaptation conserve 100% de l'expérience Omarchy tout en optimisant pour l'écosystème Fedora et en ajoutant des outils DevOps modernes (UV, Ansible, OpenTofu).

**Même productivité, même beauté, technologies 2025.**
