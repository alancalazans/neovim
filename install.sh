#!/bin/bash
curl -LO $(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -o 'https://github.com/neovim/neovim/releases/download/[^"]*nvim-linux-x86_64.tar.gz')
sudo tar -xf nvim-linux-x86_64.tar.gz -C /opt/
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
sudo cp plug.vim /opt/nvim/share/nvim/runtime/autoload/
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/
echo 'Obs.: Abra o editor `nvim` digite `:PlugInstall` + <ENTER> para instalar os Plugins.'
