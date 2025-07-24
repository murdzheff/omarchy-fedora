#!/bin/bash

# Script pour vérifier que l'installation Fedora est autonome

echo "🔍 Vérification de l'autonomie d'Omarchy Fedora..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ERRORS=0

# Vérifier que tous les fichiers nécessaires sont présents
REQUIRED_FILES=(
    "install.sh"
    "boot.sh"
    "ansi.sh"
    "install/1-dnf-setup.sh"
    "install/2-identification.sh"
    "install/3-terminal.sh"
    "install/4-config.sh"
    "install/development.sh"
    "install/hyprlandia.sh"
    "install/desktop.sh"
    "install/fonts.sh"
    "install/theme.sh"
    "install/nvim.sh"
    "config/alacritty/alacritty.toml"
    "config/hypr/hyprland.conf"
    "default/bash/aliases"
    "default/bash/rc"
    "themes/catppuccin/alacritty.toml"
    "bin/omarchy-fedora-theme-set"
    "bin/omarchy-fedora-update"
)

echo "📂 Vérification des fichiers requis..."
for file in "${REQUIRED_FILES[@]}"; do
    if [[ ! -f "$SCRIPT_DIR/$file" ]]; then
        echo "❌ Fichier manquant: $file"
        ((ERRORS++))
    else
        echo "✅ $file"
    fi
done

# Vérifier que les scripts n'ont pas de dépendances au dossier omarchy original
echo -e "\n🔗 Vérification des références internes..."
OMARCHY_REFS=$(grep -r "\.local/share/omarchy-fedora^-]" "$SCRIPT_DIR" 2>/dev/null | grep -v "omarchy-fedora" || true)
if [[ -n "$OMARCHY_REFS" ]]; then
    echo "⚠️  Références au dossier omarchy original trouvées:"
    echo "$OMARCHY_REFS"
    ((ERRORS++))
else
    echo "✅ Aucune référence au dossier omarchy original"
fi

# Vérifier que les thèmes sont présents
echo -e "\n🎨 Vérification des thèmes..."
THEME_COUNT=$(find "$SCRIPT_DIR/themes" -maxdepth 1 -type d | wc -l)
if [[ $THEME_COUNT -lt 5 ]]; then
    echo "❌ Nombre insuffisant de thèmes: $((THEME_COUNT-1))"
    ((ERRORS++))
else
    echo "✅ $((THEME_COUNT-1)) thèmes disponibles"
fi

# Résumé
echo -e "\n📊 Résumé de la vérification:"
if [[ $ERRORS -eq 0 ]]; then
    echo "🎉 Omarchy Fedora est complètement autonome!"
    echo "   Vous pouvez utiliser ce dossier indépendamment du projet omarchy original."
    echo ""
    echo "🚀 Pour installer:"
    echo "   cd $SCRIPT_DIR"
    echo "   sudo ./install.sh"
    echo ""
    echo "🎯 Ou utiliser le bootstrap:"
    echo "   ./boot.sh"
else
    echo "❌ $ERRORS erreur(s) détectée(s). Le projet n'est pas complètement autonome."
fi

exit $ERRORS