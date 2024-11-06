#!/bin/bash

# Liste des paquets à installer sur Debian
package_Debian="
  stow
  gcc
  gdb
  git
  make
  neofetch
  bash
  curl
  nano
  wget
  valgrind
  zsh
"

# Modules de dotfiles à lier
modules="
  zsh
  p10k
  nvim
  profile
"

DOTFILES_DIR="$HOME/.dotfiles"

# Fonction pour vérifier et installer un paquet avec apt
check_install() {
  if ! dpkg -s "$1" >/dev/null 2>&1; then
    echo "$1 not installed"
    sudo apt update && sudo apt install -y "$1"
  else
    echo "$1 already installed"
  fi
}

# Fonction pour installer tous les paquets listés
install_package() {
  for package in $package_Debian; do
    check_install "$package"
  done
}

# Fonction pour créer des liens symboliques avec Stow
create_link() {
  cd "$DOTFILES_DIR"
  for mod in $modules; do
    stow "$mod"
  done
}

# Fonction pour télécharger et configurer Neovim
dl_nvim() {
  mkdir -p ~/.dotfiles/other/
  cd ~/.dotfiles/other/
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  cd ~
}

# Lancement du script en fonction du paramètre
if [ "$1" = "start" ]; then
  # Mode de démarrage
  install_package
  create_link
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  chsh -s /bin/zsh
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
  dl_nvim
else
  install_package
  create_link
fi
