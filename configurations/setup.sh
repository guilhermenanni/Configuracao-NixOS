#!/usr/bin/env bash

set -e

echo "restaurando ambiente gnome..."
dconf load / < gnome-configuration/gnome-settings.ini

echo "Instalando extensões..."
mkdir -p ~/.local/share/gnome-shell/extensions
cp -r gnome-configuration/extensions/* ~/.local/share/gnome-shell/extensions/

echo "Instalando temas..."
mkdir -p ~/.themes ~/.icons
cp -r gnome-configuration/themes/* ~/.themes/ 2>/dev/null
cp -r gnome-configuration/icons/* ~/.icons/ 2>/dev/null

echo "Aplicando wallpaper..."
mkdir -p ~/Imagens
cp -r gnome-configuration/wallpapers/* ~/Imagens/ 2>/dev/null

echo "Gnome configurado com sucesso! Reinicie o sistema após o fim da instalação para aplicar as mudanças."

echo "Restaurando Ghostty terminal..."

mkdir -p ~/.config/ghostty
cp -r ghostty-configuration/* ~/.config/ghostty/ 2>/dev/null

mv ~/.zshrc ~/.zshrc.old >/dev/null 2>&1 || true
cp .zshrc ~/.zshrc

echo "por questoes de segurança, a configuraçao do nixos deve ser aplicada manualmente, copie o conteúdo do arquivo nixos-configuration.nix para o arquivo /etc/nixos/configuration.nix e rode o comando 'nixos-rebuild switch' para aplicar as mudanças."