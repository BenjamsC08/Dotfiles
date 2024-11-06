#!/bin/bash

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
"

modules = "
	zsh
	p10k
  nvim
	profile
"

DOTFILES_DIR="$HOME/dotfiles"

check_install() {
	if ! pkg info "$1" >/dev/null 2>&1; then
		echo "$1 not installed"
		pkg install -y "$1"
	else
		echo "$1 already installed"
	fi
}

install_package() {
	for package in $package_freeBSD; do
		check_install "$package"
	done
}

create_link() {
	cd "$DOTFILES_DIR"
	for mod in $modules; do
		stow "$mod"
	done
}

dl_nvim() {
  cd ~/.dotfiles/other/
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  cd ~
}

if [ "$1" = "sart" ]; then
	# Starting mode
	install_package
  create_link
  dl_nvim

else
	install_package
	create_link

