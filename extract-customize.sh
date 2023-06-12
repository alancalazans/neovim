#!/bin/bash
#user
tar -Jxf nvim.tar.xz -C $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
cp init.vim $HOME/.config/nvim/
cp ginit.vim $HOME/.config/nvim/
# Caso o diretório de fontes não exista.
if ! [ -d "$HOME/.local/share/fonts" ]; then
	mkdir -p "$HOME/.local/share/fonts"
	cp NeoVim_fonts/Droid*.otf "$HOME/.local/share/fonts/"
	unzip NeoVim_fonts/FiraMono.zip -d "$HOME/.local/share/fonts/"
fi
#root
sudo tar -Jxf nvim.tar.xz -C /root/.config/
sudo cp snippets/* /root/.config/nvim/snippets/
sudo cp init.vim /root/.config/nvim/
sudo cp ginit.vim /root/.config/nvim/
# Caso o diretório de fontes não exista.
if ! [ -d "/root/.local/share/fonts" ]; then
	sudo mkdir -p "/root/.local/share/fonts"
	sudo cp NeoVim_fonts/Droid*.otf "/root/.local/share/fonts"
	sudo unzip NeoVim_fonts/FiraMono.zip -d "/root/.local/share/fonts"
fi
#sudo mkdir -p /opt/omnisharp
#sudo tar -zxf Omnisharp-Roslyn-Server/omnisharp-linux-x64-net6.0.tar.gz -C /opt/omnisharp/
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
if [ ! -f ~/.eslintrc.js ]; then
	echo -e 'module.exports = {
			"env": {
				"browser": true,
				"es2021": true
			},
			"overrides": [
			],
			extends: [
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
fi
