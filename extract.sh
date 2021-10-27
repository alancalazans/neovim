#!/bin/bash
tar -Jxvf _nvim.tar.xz -C $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
cp init.vim $HOME/.config/nvim/
sudo tar -Jxvf _nvim.tar.xz -C /root/.config/
sudo cp snippets/* /root/.config/nvim/snippets/
sudo cp init.vim /root/.config/nvim/
