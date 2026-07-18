# Guia Completo de Atalhos de Teclado - Neovim

## 📋 Sumário

1. [Teclas Líder](#teclas-líder)
2. [Navegação e Movimentação](#navegação-e-movimentação)
3. [Abas e Janelas](#abas-e-janelas)
4. [Buffers](#buffers)
5. [Edição e Seleção](#edição-e-seleção)
6. [Formatação e Alinhamento](#formatação-e-alinhamento)
7. [LSP e Diagnósticos](#lsp-e-diagnósticos)
8. [Snippets e Autocompletar](#snippets-e-autocompletar)
9. [Gerenciamento de Arquivos](#gerenciamento-de-arquivos)
10. [Funcionalidades Especiais](#funcionalidades-especiais)
11. [Resumo Rápido](#resumo-rápido)

---

## 🎯 Teclas Líder

| Atalho    | Modo  | Função      | Descrição                                    |
| --------- | ----- | ----------- | -------------------------------------------- |
| `<space>` | Todos | Tecla Líder | Tecla principal para comandos personalizados |

### Comandos com `<leader>`:

| Atalho      | Função                    | Descrição                                           |
| ----------- | ------------------------- | --------------------------------------------------- |
| `<leader>g` | `ToggleTab()`             | Alterna entre tabulação 2 e 4 espaços               |
| `<leader>t` | `ToggleStatusTab()`       | Alterna entre tabs e espaços                        |
| `<leader>i` | `set list!`               | Mostra/oculta caracteres invisíveis (tabs, espaços) |
| `<leader>e` | `Emmet`                   | Expande abreviações Emmet                           |
| `<leader>m` | `%s/\r//g`                | Remove caracteres ^M (quebra de linha Windows)      |
| `<leader>s` | `%s/\s\+$//g`             | Remove espaços redundantes no fim das linhas        |
| `<leader>b` | `let @/=""`               | Limpa o buffer de buscas (highlight)                |
| `<leader>v` | `source $MYVIMRC`         | Recarrega a configuração do Neovim                  |
| `<leader>[` | `set expandtab` + `retab` | Converte tabs para espaços                          |
| `<leader>]` | `%s/\s\{2,}/\t/g`         | Converte espaços para tabs                          |
| `<leader>,` | `:left`                   | Alinha texto à esquerda                             |
| `<leader>.` | `:right`                  | Alinha texto à direita                              |
| `<leader>;` | `:center`                 | Centraliza texto                                    |
| `<leader>/` | `ToggleColorscheme()`     | Alterna entre temas de cores                        |
| `<leader>u` | `ToggleDrawIt()`          | Ativa/desativa o modo DrawIt                        |
| `<leader>l` | `:bnext`                  | Próximo buffer                                      |
| `<leader>j` | `:bprevious`              | Buffer anterior                                     |
| `<leader>q` | `:bdelete`                | Fecha o buffer atual                                |

---

## 🧭 Navegação e Movimentação

| Atalho         | Modo          | Função                     | Descrição                                  |
| -------------- | ------------- | -------------------------- | ------------------------------------------ |
| `<Alt-h>`      | Insert        | `<left>`                   | Move cursor uma posição para esquerda      |
| `<Alt-l>`      | Insert        | `<right>`                  | Move cursor uma posição para direita       |
| `<Alt-j>`      | Insert        | `<down>`                   | Move cursor uma linha para baixo           |
| `<Alt-k>`      | Insert        | `<up>`                     | Move cursor uma linha para cima            |
| `<C-PageUp>`   | Insert        | `:tabnext`                 | Próxima aba                                |
| `<C-PageDown>` | Insert        | `:tabprevious`             | Aba anterior                               |
| `<Tab>`        | Normal/Visual | `>>`                       | Indenta bloco selecionado                  |
| `<S-Tab>`      | Normal/Visual | `<<`                       | Desindenta bloco selecionado               |
| `<S-Tab>`      | Insert        | `<c-o><lt><lt>`            | Desindenta no modo insert                  |
| `K`            | Normal        | `vim.lsp.buf.hover`        | Mostra informações do símbolo sob o cursor |
| `[d`           | Normal        | `vim.diagnostic.goto_prev` | Vai para diagnóstico anterior              |
| `]d`           | Normal        | `vim.diagnostic.goto_next` | Vai para próximo diagnóstico               |

---

## 📑 Abas e Janelas

| Atalho         | Modo          | Função                  | Descrição                       |
| -------------- | ------------- | ----------------------- | ------------------------------- |
| `<C-t>`        | Insert        | `<esc>:tabnew<cr>`      | Abre uma nova aba               |
| `<C-t>`        | Normal        | `:tabnew`               | Abre uma nova aba               |
| `<C-PageUp>`   | Insert        | `<esc>:tabnext<cr>`     | Próxima aba                     |
| `<C-PageDown>` | Insert        | `<esc>:tabprevious<cr>` | Aba anterior                    |
| `<C-e>`        | Insert        | `<esc>:tabclose<cr>`    | Fecha a aba atual               |
| `<C-F4>`       | Normal/Insert | `<c-w>c`                | Fecha a janela atual            |
| `<C-n>`        | Normal        | `:NvimTreeToggle`       | Abre/fecha a árvore de arquivos |

---

## 📂 Buffers

| Atalho      | Função       | Descrição            |
| ----------- | ------------ | -------------------- |
| `<leader>l` | `:bnext`     | Próximo buffer       |
| `<leader>j` | `:bprevious` | Buffer anterior      |
| `<leader>q` | `:bdelete`   | Fecha o buffer atual |

---

## ✏️ Edição e Seleção

| Atalho       | Modo   | Função            | Descrição                         |
| ------------ | ------ | ----------------- | --------------------------------- |
| `<C-s>`      | Normal | `:update`         | Salva o arquivo                   |
| `<C-s>`      | Visual | `<c-c>:update`    | Salva o arquivo                   |
| `<C-s>`      | Insert | `<c-o>:update`    | Salva o arquivo                   |
| `<C-z>`      | Normal | `u`               | Desfaz                            |
| `<C-z>`      | Visual | `<c-c>u`          | Desfaz                            |
| `<C-z>`      | Insert | `<c-o>u`          | Desfaz                            |
| `<C-y>`      | Normal | `<c-r>`           | Refaz                             |
| `<C-y>`      | Visual | `<c-c><c-r>`      | Refaz                             |
| `<C-y>`      | Insert | `<c-o><c-r>`      | Refaz                             |
| `<C-a>`      | Todos  | `<esc>ggvG`       | Seleciona todo o texto            |
| `<C-c>`      | Insert | `<C-O>vgG`        | Copia (entra em modo visual)      |
| `<C-c>`      | Visual | `"*y<Esc>i`       | Copia para clipboard do sistema   |
| `<C-x>`      | Insert | `<C-O>vgG`        | Corta (entra em modo visual)      |
| `<C-x>`      | Visual | `"*x<Esc>i`       | Corta para clipboard do sistema   |
| `<C-v>`      | Insert | `x<Esc>\paste\`   | Cola do clipboard do sistema      |
| `<C-v>`      | Normal | `"\=@*"`          | Cola do clipboard do sistema      |
| `<C-v>`      | Visual | `"-cx<Esc>\paste` | Cola substituindo seleção         |
| `<BS>`       | Visual | `d`               | Apaga a seleção                   |
| `<C-s-up>`   | Visual | `MoveUp()`        | Move bloco selecionado para cima  |
| `<C-s-down>` | Visual | `MoveDown()`      | Move bloco selecionado para baixo |
| `<C-d>`      | Visual | `Duplicate()`     | Duplica bloco selecionado         |
| `<Alt-q>`    | Normal | `:qall`           | Fecha o editor                    |
| `<Alt-q>`    | Visual | `<c-c>:q`         | Fecha o editor                    |

### Comandos de Folding

| Atalho | Função | Descrição                       |
| ------ | ------ | ------------------------------- |
| `zf`   | `zf`   | Cria um fold (dobra)            |
| `zo`   | `zo`   | Abre um fold                    |
| `zc`   | `zc`   | Fecha um fold                   |
| `zR`   | `zR`   | Abre todos os folds             |
| `zM`   | `zM`   | Fecha todos os folds            |
| `za`   | `za`   | Alterna entre abrir/fechar fold |

---

## 🎨 Formatação e Alinhamento

| Atalho      | Função    | Descrição               |
| ----------- | --------- | ----------------------- |
| `<leader>,` | `:left`   | Alinha texto à esquerda |
| `<leader>.` | `:right`  | Alinha texto à direita  |
| `<leader>;` | `:center` | Centraliza texto        |

---

## 🔍 LSP e Diagnósticos

| Atalho       | Função                       | Descrição                                  |
| ------------ | ---------------------------- | ------------------------------------------ |
| `K`          | `vim.lsp.buf.hover`          | Mostra informações do símbolo sob o cursor |
| `gd`         | `vim.lsp.buf.definition`     | Vai para definição do símbolo              |
| `gi`         | `vim.lsp.buf.implementation` | Vai para implementação                     |
| `gr`         | `vim.lsp.buf.references`     | Mostra referências do símbolo              |
| `<leader>rn` | `vim.lsp.buf.rename`         | Renomeia símbolo                           |
| `<leader>ca` | `vim.lsp.buf.code_action`    | Ações de código (refatoração)              |
| `[d`         | `vim.diagnostic.goto_prev`   | Vai para diagnóstico anterior              |
| `]d`         | `vim.diagnostic.goto_next`   | Vai para próximo diagnóstico               |
| `<leader>e`  | `vim.diagnostic.open_float`  | Abre diagnóstico em janela flutuante       |

---

## 📝 Snippets e Autocompletar

| Atalho    | Modo          | Função                       | Descrição                                        |
| --------- | ------------- | ---------------------------- | ------------------------------------------------ |
| `<Tab>`   | Insert        | `select_next_item()`         | Próxima sugestão de autocompletar                |
| `<S-Tab>` | Insert        | `select_prev_item()`         | Sugestão anterior                                |
| `<CR>`    | Insert        | `confirm({ select = true })` | Confirma seleção de autocompletar                |
| `<C-l>`   | Insert/Select | `expand_or_jump()`           | Expande snippet ou pula para próximo placeholder |
| `<C-h>`   | Insert/Select | `jump(-1)`                   | Volta para placeholder anterior                  |

---

## 📁 Gerenciamento de Arquivos

| Atalho      | Função            | Descrição                       |
| ----------- | ----------------- | ------------------------------- |
| `<C-n>`     | `:NvimTreeToggle` | Abre/fecha a árvore de arquivos |
| `<leader>v` | `source $MYVIMRC` | Recarrega a configuração        |
| `<C-s>`     | `:update`         | Salva o arquivo atual           |

---

## 🛠️ Funcionalidades Especiais

| Atalho      | Função                | Descrição                           |
| ----------- | --------------------- | ----------------------------------- |
| `<leader>e` | `Emmet`               | Expande abreviações Emmet           |
| `<leader>u` | `ToggleDrawIt()`      | Ativa/desativa modo de desenho      |
| `<leader>g` | `ToggleTab()`         | Alterna tabulação 2 ↔ 4 espaços     |
| `<leader>t` | `ToggleStatusTab()`   | Alterna tabs ↔ espaços              |
| `<leader>i` | `set list!`           | Mostra/oculta caracteres invisíveis |
| `<leader>m` | `%s/\r//g`            | Remove ^M (Windows)                 |
| `<leader>s` | `%s/\s\+$//g`         | Remove espaços no fim das linhas    |
| `<leader>b` | `let @/=""`           | Limpa highlight de busca            |
| `<leader>/` | `ToggleColorscheme()` | Alterna temas de cores              |

### Comandos de Texto

| Atalho      | Função                    | Descrição                  |
| ----------- | ------------------------- | -------------------------- |
| `<leader>[` | `set expandtab` + `retab` | Converte tabs para espaços |
| `<leader>]` | `%s/\s\{2,}/\t/g`         | Converte espaços para tabs |

---

## 🎯 Resumo Rápido

### Teclas mais usadas:

- **`<space>`** - Tecla líder para todos os comandos personalizados
- **`<C-s>`** - Salvar
- **`<C-z>`** - Desfazer
- **`<C-y>`** - Refazer
- **`<C-n>`** - Abrir árvore de arquivos
- **`<C-t>`** - Nova aba
- **`<C-PageUp/PageDown>`** - Navegar entre abas
- **`gd`** - Ir para definição
- **`K`** - Ver informações do símbolo

### Plugins ativados:

- **Lualine** - Statusline moderna
- **Indent Blankline** - Guias de indentação
- **nvim-tree** - Navegador de arquivos
- **nvim-cmp** - Autocompletar
- **LuaSnip** - Snippets
- **Mason + LSP** - Servidor de linguagem
- **Conform** - Formatador automático
- **Emmet** - Expansão de HTML/CSS
- **DrawIt** - Desenho no editor

---

## 📌 Observações

1. **Clipboard**: O clipboard do sistema está habilitado (`set clipboard=unnamedplus`)
2. **Mouse**: Suporte a mouse ativado para seleção e navegação
3. **Numeração**: Linhas numeradas com `set nu`
4. **Destaque**: Buscas com highlight e busca incremental (`set is hls is scs`)
5. **Auto-indentação**: Ativada automaticamente para todos os tipos de arquivo
6. **Backup**: Desativado (`set nobackup`, `set noswapfile`)
7. **Encoding**: UTF-8 por padrão
