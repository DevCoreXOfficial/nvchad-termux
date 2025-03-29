#!/bin/bash

git pull origin main
cp -r ./nvim ~/.config
nvim -c ":Lazy sync"
echo -e "NvChad Updated!"
