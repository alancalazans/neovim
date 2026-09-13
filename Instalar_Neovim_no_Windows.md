# Instalar Neovim no Windows

## Passos

- Abra o  ***powershell***:

```powershell
# Instalar o Neovim
winget install --id Neovim.Neovim
# Instalar o Node
winget install --id OpenJS.NodeJS.LTS
# Liberar o NPM (mais informações no arquivo `NPM_-_Execução_de_scripts_foi_desabilitada_no_Windows.md`)
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
# Reinicie o Powershell
# Instalar o Prettier
npm i -g prettier
```

- Abra o ***powershell*** (como administrador) na pasta onde baixou o ***neovim.git*** e execute:

```powershell
cp .\plug.vim C:\Program Files\Neovim\share\nvim\runtime\autoload\
```

- Abra o ***powershell*** (sem ser como administrador) na pasta onde baixou o ***neovim.git*** e execute os comandos:

```powershell
mkdir ~\AppData\Local\nvim
cp .\init.vim ~\AppData\Local\nvim\
cp -r snippets ~\AppData\Local\nvim\
```

- Abra o ***Neovim*** (mantenha no modo normal) e digite ***:PlugInstall + \<ENTER\>*** para instalar os Plugins.
