#!/bin/bash
sudo rm -r $HOME/.config/nvim
tar -Jxf _nvim.tar.xz -C $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
cp init.vim $HOME/.config/nvim/
cp ginit.vim $HOME/.config/nvim/
