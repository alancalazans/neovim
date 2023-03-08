#!/bin/bash
#--------------------
# Download `neovim`:
# https://github.com/neovim/neovim
#--------------------
# Extraindo a pasta `nvim`
# com as configurações do
# `neovim` e atualizando o 
# conteúdo da pasta `snippets`.
#--------------------
unzip _nvim_lua.zip -d $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
#--------------------
# Github do projeto `packer.nim`
# gerenciamento de plugins e pacotes:
# https://github.com/wbthomason/packer.nvim.
# Instalando `packer.nvim` no `Linux`:
#--------------------
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
#--------------------
# Após a instalação do `packer.nvim`
# abrir o `nvim` e no modo normal
# executar o comando `PackerInstall`.
#--------------------
