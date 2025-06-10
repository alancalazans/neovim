#!/bin/bash
tar -Jxf nvim.tar.xz -C $HOME/.config/
cp snippets/* $HOME/.config/nvim/snippets/
cp init.vim $HOME/.config/nvim/
cp ginit.vim $HOME/.config/nvim/
# Caso o diretório de fontes não exista.
if ! [ -d "$HOME/.local/share/fonts" ]; then
	mkdir -p "$HOME/.local/share/fonts"
	cp NeoVim_fonts/Droid*.otf "$HOME/.local/share/fonts/"
	unzip NeoVim_fonts/FuraMono_Linux.zip -d "$HOME/.local/share/fonts/"
else
	if [ ! -f ~/.local/share/fonts/Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete.otf ]; then
		cp NeoVim_fonts/Droid*.otf "$HOME/.local/share/fonts/"
	fi
	if [ ! -f ~/.local/share/fonts/Fura\ Mono\ Bold\ Nerd\ Font\ Complete\ Mono.otf ]; then
		cp NeoVim_fonts/Droid*.otf "$HOME/.local/share/fonts/"
		unzip NeoVim_fonts/FuraMono_Linux.zip -d "$HOME/.local/share/fonts/"
	fi
	if [ ! -f ~/.local/share/fonts/MonoLisa-italic.ttf ]; then
		cp NeoVim_fonts/MonoLisa-italic.ttf "$HOME/.local/share/fonts/"
		cp NeoVim_fonts/MonoLisa-normal.ttf "$HOME/.local/share/fonts/"
	fi
fi
#sudo mkdir -p /opt/omnisharp
#sudo tar -zxf Omnisharp-Roslyn-Server/omnisharp-linux-x64-net6.0.tar.gz -C /opt/omnisharp/
#--------------------
# Criando arquivo de configuração
# `.eslintrc.js` no path do usuário:
#--------------------
if [ ! -f ~/.eslintrc.js ]; then
	echo -e "module.exports = {
			\"env\": {
				\"browser\": true,
				\"es2021\": true
			},
			\"overrides\": [
			],
			\"extends\": [
				\"standard\",
				\"eslint\": \"recommended\",
				\"prettier\"
			],
			\"parserOptions\": {
				\"ecmaVersion\": \"latest\"
			},
			\"rules\": {
			}
	}" > ~/.eslintrc.js
	#--------------------
	# ESLint
	# https://eslint.org/
	# Instalar:
	echo 'Rode o comando: "npm i -g eslint" caso ainda não tenha instalado o "eslint"'
fi
