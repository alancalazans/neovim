#!/bin/bash
sudo tar -zxvf nvim-linux64.tar.gz -C /opt/
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
Exec=/opt/nvim/bin/nvim %F
Icon=/opt/nvim/share/icons/hicolor/128x128/apps/nvim.png
Terminal=true
Type=Application
Keywords=Text;editor;
Categories=Utility;TextEditor;Development;
StartupNotify=false
MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;' | sudo tee ~/.local/share/applications/nvim.desktop
chmod 755 ~/.local/share/applications/nvim.desktop
