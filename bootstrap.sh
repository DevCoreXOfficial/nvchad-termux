#!/bin/bash

echo -e "Updating NvChad..."
cp -r ./nvim ~/.config
read -p "Open Neovim? [Y/n] " open

if [[ "${open}" == "y" || "${open}" == "Y" ]]; then
  nvim
elif [[ "${open}" == "n" || "${open}" == "n" ]]; then
  echo -e ""
else
  echo -e "Canceled"
fi

echo -e "NvChad Updated!"
