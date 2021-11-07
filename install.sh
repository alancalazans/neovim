#!/bin/bash
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root/ /opt/nvim
sudo ln -sf /opt/nvim/usr/bin/nvim /usr/bin/nvim
tar -Jxvf _nvim.tar.xz -C $HOME/.config/
cp init.vim $HOME/.config/nvim/
cp snippets/*.snippets $HOME/.config/nvim/snippets/
sudo tar -Jxvf _nvim.tar.xz -C /root/.config/
sudo cp init.vim /root/.config/nvim/
sudo cp snippets/*.snippets /root/.config/nvim/snippets/
clear
echo '[Desktop Entry]
Version=0.4.4
Name=Neovim
GenericName=Text Editor
Comment=Edit text files
TryExec=nvim
Exec=/opt/nvim/usr/bin/nvim
Icon=/opt/nvim/nvim.png
Terminal=true
Type=Application
Keywords=Text;editor;
Categories=Utility;TextEditor;Development;
StartupNotify=false
MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;' | sudo tee /usr/share/applications/nvim.desktop
sudo chmod 755 /usr/share/applications/nvim.desktop
