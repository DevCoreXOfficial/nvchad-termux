#!/bin/bash

echo -e "Updating NvChad..."
cp -r ./nvim ~/.config
nvim -c ":Lazy sync"
echo -e "NvChad Updated!"
