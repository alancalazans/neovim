#!/bin/bash
tar -Jxvf _nvim.tar.xz -C $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
cp init.vim $HOME/.config/nvim/
mkdir $HOME/.local/share/fonts
cp Droid*.otf $HOME/.local/share/fonts/
#Para root
sudo tar -Jxvf _nvim.tar.xz -C /root/.config/
sudo cp snippets/* /root/.config/nvim/snippets/
sudo cp init.vim /root/.config/nvim/
sudo mkdir -p /root/.local/share/fonts
sudo cp Droid*.otf /root/.local/share/fonts/
