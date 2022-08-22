#!/bin/bash
sudo tar -Jxvf nvim-linux64.tar.gz -C /opt/
sudo mv /opt/nvim-linux64 /opt/nvim
sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
tar -Jxvf _nvim.tar.xz -C $HOME/.config/
cp init.vim $HOME/.config/nvim/
cp ginit.vim $HOME/.config/nvim/
cp snippets/*.snippets $HOME/.config/nvim/snippets/
mkdir -p $HOME/.local/share/fonts
cp Droid*.otf $HOME/.local/share/fonts/
#Para root
sudo tar -Jxvf _nvim.tar.xz -C /root/.config/
sudo cp init.vim /root/.config/nvim/
sudo cp ginit.vim /root/.config/nvim/
sudo cp snippets/*.snippets /root/.config/nvim/snippets/
sudo mkdir -p /root/.local/share/fonts
sudo cp Droid*.otf /root/.local/share/fonts/
clear
echo '[Desktop Entry]
Name=Neovim
GenericName=Text Editor
Comment=Edit text files
Comment[en_CA]=Edit text files
Comment[en_GB]=Edit text files
Comment[pt]=Editar ficheiros de texto
Comment[pt_BR]=Edite arquivos de texto
TryExec=nvim
Exec=nvim %F
Terminal=true
Type=Application
Keywords=Text;editor;
Icon=nvim
Categories=Utility;TextEditor;
StartupNotify=false
MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;' | sudo tee /usr/share/applications/nvim.desktop
sudo chmod 755 /usr/share/applications/nvim.desktop
