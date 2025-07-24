#!/bin/bash

# Installation de Neovim et des outils associés pour Fedora
if ! command -v nvim &>/dev/null; then
  sudo dnf install -y neovim luarocks tree-sitter-cli

  # Installation de LazyVim
  rm -rf ~/.config/nvim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  cp -R ~/.local/share/omarchy-fedora/config/nvim/* ~/.config/nvim/
  rm -rf ~/.config/nvim/.git
  echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua
  
  echo "Installation et configuration de Neovim avec LazyVim terminée pour Fedora 42"
fi