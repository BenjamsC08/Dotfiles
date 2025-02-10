#!/bin/bash

package_classic="
  stow wget terminator zsh git gcc clang valgrind gdb build-essential wget 
  curl zip unzip pciutils tree neofetch luarocks xsel xclip
"

modules_classic="
  font
  ghostty
  nvim
  zsh
"

DOTFILES_DIR="$HOME/.Dotfiles"

OS_INFOS=$(uname -a)

install_BSD_package() {
  for package in $package_classic; do
    if ! pkg info "$package" >/dev/null 2>&1; then
      echo "Trying to install $package"
      pkg install -y "$package"
    else
      echo "$package already installed"
    fi
  done
}

install_deb_package() {
  for package in $package_classic; do
    if ! dpkg -s "$package" >/dev/null 2>&1; then
      echo "Trying to install $package"
      sudo apt update && sudo apt install -y "$package"
    else
      echo "$package already installed"
    fi
  done
}

install_other() {
    mkdir -p ~/Documents/AppImg/
    cd ~/Documents/AppImg/

    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    if [ ! -f "nvim.appimage" ]; then
        echo "Error downloading nvim.appimage"
        exit 1
    fi
    chmod u+x nvim.appimage

    wget -O KeePassXC.AppImage https://github.com/keepassxreboot/keepassxc/releases/download/2.7.9/KeePassXC-2.7.9-x86_64.AppImage
    if [ ! -f "KeePassXC.AppImage" ]; then
        echo "Error downloading KeePassXC.AppImage"
        exit 1
    fi
    chmod u+x KeePassXC.AppImage

    wget -O Ghostty.AppImage https://github.com/psadi/ghostty-appimage/releases/download/v1.1.0%2B1/Ghostty-1.1.0-x86_64.AppImage
    if [ ! -f "Ghostty.AppImage" ]; then
        echo "Error downloading Ghostty.AppImage"
        exit 1
    fi
    chmod u+x Ghostty.AppImage

    curl -fsS https://dl.brave.com/install.sh | sh
}

create_link() {
    if echo "$OS_INFOS" | grep -q "NixOS"; then
        if [ -d /etc/nixos ]; then
            sudo stow -v -t /etc/nixos Nixos
        else
            echo "/etc/nixos does not exist. Skipping stow for NixOS."
        fi
    fi

    cd "$DOTFILES_DIR"
    for mod in $modules_classic; do
        stow "$mod"
    done
}

if command -v apt >/dev/null 2>&1; then
    install_deb_package
    install_other
    create_link
elif command -v pkg >/dev/null 2>&1; then
    install_BSD_package
    install_other
    create_link
elif echo "$OS_INFOS" | grep -q "NixOS"; then
    if [ -e /etc/nixos/configuration.nix ]; then
        read -p "Le fichier /etc/nixos/configuration.nix existe déjà. Voulez-vous le supprimer (y/N)? " response
        if [[ "$response" == "y" ]]; then
            rm -rf /etc/nixos/configuration.nix
            echo "Fichier supprimé."
        else
            echo "Le fichier n'a pas été supprimé."
        fi
    fi
    create_link
else
  echo "OS or package installer not supported"
  exit 1
fi

