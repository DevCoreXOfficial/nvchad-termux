#!/bin/bash

echo -e "\nInstalling NvChad...\n"

# Check if a Termux package is installed
is_installed() {
  dpkg -l | grep -q "^ii  $1 "
}

# Check if a Node.js module is installed globally
npm_installed() {
  npm list -g --depth=0 | grep -q "$1@"
}

# Install required Termux packages if not already installed
for package in git neovim nodejs python curl wget lua-language-server ripgrep stylua tree-sitter-parsers; do
  is_installed "$package" || yes | pkg install "$package"
done

# Install Prettier globally if not already installed
npm_installed "prettier" || npm install -g prettier

# Ensure the configuration directory exists
[ -d ~/.config ] || mkdir -p ~/.config

# Copy Neovim configuration
cp -r ./nvim ~/.config

# Start Neovim
nvim
