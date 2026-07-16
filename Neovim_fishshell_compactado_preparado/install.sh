#!/bin/bash
sudo unzip nvim-preparado.zip -d /opt/
cp /opt/nvim/nvim.desktop ~/.local/share/applications/
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/
cat << EOF >> ~/.config/fish/conf.d/add_to_path.fish
# --------------
# --- NEOVIM ---
# --------------
fish_add_path /opt/nvim/usr/bin
EOF
