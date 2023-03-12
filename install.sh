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
# executar o comando `:PackerInstall`.
#--------------------
#--------------------
# ALE
# Github: https://github.com/dense-analysis/ale
# Instalando:
#--------------------
mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale
#--------------------
# ESLint
# https://eslint.org/
# Instalando:
#--------------------
npm install eslint -g
#--------------------
# Criando arquivo de configuração
# `.eslintrc.js` na pasta de usuário:
#--------------------
echo -e 'module.exports = {
    "env": {
			"browser": true,
			"es2021": true
    },
    "overrides": [
    ],
    extendes: [
    	"standard",
    	"eslint:recommended",
    	"prettier"
    ],
    "parserOptions": {
			"ecmaVersion": "latest"
    },
    "rules": {
    }
}' > ~/.eslintrc.js