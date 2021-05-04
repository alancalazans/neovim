#!/bin/bash
tar -Jxvf _nvim.tar.xz -C $HOME/.config/
cp init.vim $HOME/.config/nvim/
sudo tar -Jxvf _nvim.tar.xz -C /root/.config/
sudo cp init.vim /root/.config/nvim/
