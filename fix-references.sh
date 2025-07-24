#!/bin/bash

# Script pour corriger toutes les références à l'ancien dossier omarchy

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔧 Correction des références pour rendre Omarchy Fedora autonome..."

# Fonction pour remplacer récursivement dans tous les fichiers
fix_references() {
    # Remplacer ~/.local/share/omarchy-fedorapar ~/.local/share/omarchy-fedora
    # sauf quand c'est déjà omarchy-fedora
    find "$SCRIPT_DIR" -type f \( -name "*.conf" -o -name "*.toml" -o -name "*.css" -o -name "*.desktop" -o -name "*.service" -o -name "rc" \) \
        -exec sed -i 's|\.local/share/omarchy-fedora^-]|.local/share/omarchy-fedora|g' {} \;
    
    # Remplacer dans les scripts bash aussi
    find "$SCRIPT_DIR" -type f -name "*.sh" \
        -exec sed -i 's|\.local/share/omarchy-fedora^-]|.local/share/omarchy-fedora|g' {} \;
        
    # Remplacer dans les fichiers sans extension
    find "$SCRIPT_DIR" -type f ! -name "*.*" \
        -exec sed -i 's|\.local/share/omarchy-fedora^-]|.local/share/omarchy-fedora|g' {} \;
}

# Exécuter les corrections
fix_references

# Corrections spécifiques pour les cas particuliers
echo "🔧 Corrections spécifiques..."

# Corriger le nom dans applications/omarchy.desktop
if [[ -f "$SCRIPT_DIR/applications/omarchy.desktop" ]]; then
    sed -i 's|Name=Omarchy|Name=Omarchy Fedora|g' "$SCRIPT_DIR/applications/omarchy.desktop"
    sed -i 's|Comment=About Omarchy|Comment=About Omarchy Fedora Edition|g' "$SCRIPT_DIR/applications/omarchy.desktop"
fi

# Ajouter le dossier bin au PATH dans shell
if [[ -f "$SCRIPT_DIR/default/bash/shell" ]]; then
    sed -i 's|:$HOME/.local/share/omarchy-fedora/bin:|:$HOME/.local/share/omarchy-fedora/bin:|g' "$SCRIPT_DIR/default/bash/shell"
fi

echo "✅ Corrections terminées!"
echo ""
echo "🔍 Vérification des corrections..."

# Vérifier qu'il ne reste plus de références incorrectes
REMAINING_REFS=$(grep -r "\.local/share/omarchy-fedora^-]" "$SCRIPT_DIR" 2>/dev/null | grep -v "omarchy-fedora" || true)

if [[ -z "$REMAINING_REFS" ]]; then
    echo "✅ Toutes les références ont été corrigées!"
    echo "   Le projet Omarchy Fedora est maintenant complètement autonome."
else
    echo "⚠️  Références restantes à corriger:"
    echo "$REMAINING_REFS"
fi