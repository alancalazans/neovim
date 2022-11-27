#!/bin/bash
#Local user
tar -Jxf _nvim.tar.xz -C $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
cp init.vim $HOME/.config/nvim/
cp ginit.vim $HOME/.config/nvim/
mkdir $HOME/.local/share/fonts
cp NeoVim_fonts/Droid*.otf $HOME/.local/share/fonts/
unzip NeoVim_fonts/FiraMono.zip -d $HOME/.local/share/fonts/
#root
sudo tar -Jxf _nvim.tar.xz -C /root/.config/
sudo cp snippets/* /root/.config/nvim/snippets/
sudo cp init.vim /root/.config/nvim/
sudo cp ginit.vim /root/.config/nvim/
sudo mkdir -p /root/.local/share/fonts
sudo mkdir -p /opt/omnisharp
sudo cp NeoVim_fonts/Droid*.otf /root/.local/share/fonts/
sudo unzip NeoVim_fonts/FiraMono.zip -d /root/.local/share/fonts/
sudo tar -zxf Omnisharp-Roslyn-Server/omnisharp-linux-x64-net6.0.tar.gz -C /opt/omnisharp/
