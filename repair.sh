#!/bin/bash
rm -rf $HOME/.config/nvim
tar -Jxf nvim.tar.xz -C $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
cp init.vim $HOME/.config/nvim/
cp ginit.vim $HOME/.config/nvim/
