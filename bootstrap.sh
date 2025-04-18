#!/bin/bash

echo -e "Updating NvChad..."

# install new packages
yes|pkg install perl

# copy nvim directory
cp -r ./nvim ~/.config
echo -e "NvChad Updated!"
echo -e "Run: nvim (recommended)"
