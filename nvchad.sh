#!/bin/bash

if [[ ! -d ~/.config ]]; then
  mkdir -p ~/.config
fi

cp -r ./nvim ~/.config

nvim
