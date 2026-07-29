# Instalar o vscode-langservers-extracted

## Instale o pacote correto:

```bash
npm install -g vscode-langservers-extracted
```

## Verifique a instalação:

```bash
which vscode-html-language-server
# ou
vscode-html-language-server --version
```

## Se ainda não funcionar, tente estas alternativas:

### Opção 1: Usando o html-lsp (mais leve)
```bash
npm install -g html-lsp
```

### Opção 2: Usando o emmet-ls
```bash
npm install -g emmet-ls
```

### Opção 3: Usando o typescript-language-server (também suporta HTML)
```bash
npm install -g typescript-language-server
```

## Configuração no Neovim:

Após instalar o `vscode-langservers-extracted`, o Neovim deve reconhecer automaticamente. Se não, configure no seu `init.lua`:

```lua
require'lspconfig'.html.setup{
  cmd = {"vscode-html-language-server", "--stdio"}
}
```

**Importante:** Reinicie o Neovim completamente após a instalação para que o LSP reconheça o novo servidor.