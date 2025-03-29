#!/bin/bash

cp -r ./nvim ~/.config
nvim -c ":Lazy sync"
echo -e "NvChad Updated!"
