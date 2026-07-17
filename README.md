## 📋 GUIA DE ATALHOS DE TECLADO - NEOVIM

### 🔹 Tecla Líder: **Espaço** (`<leader>`)

---

### 📌 NAVEGAÇÃO E GERENCIAMENTO DE BUFFERS

| Atalho      | Modo            | Função                        |
| ----------- | --------------- | ----------------------------- |
| `<leader>l` | Normal / Visual | Navega para o próximo buffer  |
| `<leader>j` | Normal / Visual | Navega para o buffer anterior |
| `<leader>q` | Normal / Visual | Fecha o buffer atual          |

---

### 📌 GERENCIAMENTO DE ABAS

| Atalho         | Modo            | Função            |
| -------------- | --------------- | ----------------- |
| `<C-t>`        | Insert / Normal | Abre uma nova aba |
| `<C-PageUp>`   | Insert          | Próxima aba       |
| `<C-PageDown>` | Insert          | Aba anterior      |
| `<C-e>`        | Insert          | Fecha a aba atual |

---

### 📌 INDENTAÇÃO E ESPAÇAMENTO

| Atalho      | Modo                     | Função                                     |
| ----------- | ------------------------ | ------------------------------------------ |
| `<Tab>`     | Normal / Visual          | Indenta o bloco/linha atual                |
| `<S-Tab>`   | Normal / Insert / Visual | Desindenta o bloco/linha atual             |
| `<leader>g` | Normal                   | Alterna tamanho do tab entre 2 e 4 espaços |
| `<leader>t` | Normal                   | Alterna entre usar tab ou espaços          |
| `<leader>[` | Normal                   | Converte tabs em espaços                   |
| `<leader>]` | Normal                   | Converte espaços duplos em tabs            |

---

### 📌 MANIPULAÇÃO DE TEXTO

| Atalho       | Modo                     | Função                               |
| ------------ | ------------------------ | ------------------------------------ |
| `<C-s>`      | Normal / Visual / Insert | Salva o arquivo                      |
| `<C-z>`      | Normal / Visual / Insert | Desfaz (Undo)                        |
| `<C-y>`      | Normal / Visual / Insert | Refaz (Redo)                         |
| `<C-d>`      | Visual                   | Duplica o bloco de texto selecionado |
| `<C-S-Up>`   | Visual                   | Move bloco selecionado para cima     |
| `<C-S-Down>` | Visual                   | Move bloco selecionado para baixo    |
| `<C-X>`      | Insert / Visual / Normal | Corta o texto selecionado            |
| `<C-C>`      | Insert / Visual          | Copia o texto selecionado            |
| `<C-V>`      | Insert / Visual / Normal | Cola da área de transferência        |
| `<C-A>`      | Normal / Insert / Visual | Seleciona todo o texto               |

---

### 📌 FORMATAÇÃO E ALINHAMENTO

| Atalho      | Modo   | Função                                    |
| ----------- | ------ | ----------------------------------------- |
| `<leader>,` | Normal | Alinha texto à esquerda                   |
| `<leader>.` | Normal | Alinha texto à direita                    |
| `<leader>;` | Normal | Centraliza o texto                        |
| `<leader>m` | Normal | Remove ^M (quebras de linha Windows)      |
| `<leader>s` | Normal | Remove espaços no final das linhas        |
| `<leader>i` | Normal | Alterna exibição de caracteres invisíveis |

---

### 📌 BUSCA E LIMPEZA

| Atalho      | Modo   | Função                  |
| ----------- | ------ | ----------------------- |
| `<leader>b` | Normal | Limpa o buffer de busca |

---

### 📌 PLUGINS

| Atalho      | Modo   | Função                  | Plugin        |
| ----------- | ------ | ----------------------- | ------------- |
| `<leader>n` | Normal | Abre/fecha o NERDTree   | NERDTree      |
| `<leader>e` | Normal | Dispara o Emmet         | Emmet-vim     |
| `<C-j>`     | Insert | Próximo snippet         | SnipMate      |
| `<leader>u` | Normal | Ativa/desativa o DrawIt | DrawIt **∗¹** |

> **∗¹ :** Abaixo há um um guia chamado ***Como Usar o DrawIt no Neovim***

---

### 📌 APARÊNCIA E TEMAS

| Atalho      | Modo   | Função                                                          |
| ----------- | ------ | --------------------------------------------------------------- |
| `<leader>/` | Normal | Alterna temas: molokai → spacecamp → gruvbox → gruvbox-material |

---

### 📌 FECHAMENTO E CONTROLE

| Atalho   | Modo                                 | Função                 |
| -------- | ------------------------------------ | ---------------------- |
| `<A-q>`  | Normal / Visual / Insert             | Fecha todas as janelas |
| `<C-F4>` | Normal / Insert / Command / Operator | Fecha a janela atual   |

---

### 📌 MOVIMENTAÇÃO NO INSERT

| Atalho  | Modo   | Função                    |
| ------- | ------ | ------------------------- |
| `<A-h>` | Insert | Move cursor para esquerda |
| `<A-l>` | Insert | Move cursor para direita  |
| `<A-j>` | Insert | Move cursor para baixo    |
| `<A-k>` | Insert | Move cursor para cima     |

---

### 📌 CONFIGURAÇÃO E RECARREGAMENTO

| Atalho      | Modo   | Função                              |
| ----------- | ------ | ----------------------------------- |
| `<leader>v` | Normal | Recarrega o arquivo de configuração |

---

### 📌 ABREVIAÇÕES NO INSERT

| Digite | Expande para |
| ------ | ------------ |
| `a.`   | ª            |
| `o.`   | º            |
| `no.`  | nº           |
| `No.`  | Nº           |

---

### 📌 RESUMO DE TECLAS ESPECIAIS

| Tecla        | Descrição     |
| ------------ | ------------- |
| `<leader>`   | Espaço        |
| `<C-...>`    | Ctrl + tecla  |
| `<S-...>`    | Shift + tecla |
| `<A-...>`    | Alt + tecla   |
| `<Tab>`      | Tecla Tab     |
| `<S-Tab>`    | Shift + Tab   |
| `<PageUp>`   | Page Up       |
| `<PageDown>` | Page Down     |
| `<F4>`       | Tecla F4      |

---

### 📌 LEGENDA DOS MODOS

| Sigla        | Significado              |
| ------------ | ------------------------ |
| **Normal**   | Modo normal (tecla Esc)  |
| **Insert**   | Modo de inserção         |
| **Visual**   | Modo de seleção visual   |
| **Command**  | Modo de linha de comando |
| **Operator** | Modo de operador         |

---

📌 **Dica:** Este guia pode ser consultado rapidamente usando `:help` ou mantendo uma cópia impressa ao lado do monitor enquanto você se acostuma com os atalhos.

---

## Como Usar o DrawIt no Neovim

O **DrawIt** é um plugin que permite desenhar diagramas ASCII diretamente no seu editor de texto, usando caracteres para formar linhas, retângulos, elipses e setas .

### 🚀 Iniciando e Parando

No seu arquivo `init.vim`, você já tem o atalho configurado:

| Atalho      | Modo   | Função                  |
| ----------- | ------ | ----------------------- |
| `<leader>u` | Normal | Ativa/desativa o DrawIt |

Isso equivale a executar os comandos `\di` para iniciar e `\ds` para parar .

---

### 🎨 Modos de Desenho

Após ativar o DrawIt (`\di`), você pode usar dois modos:

| Modo        | Tecla             | Função                                                                      |
| ----------- | ----------------- | --------------------------------------------------------------------------- |
| **Desenho** | Teclas de direção | Deixa um rastro de caracteres ao mover o cursor                             |
| **Apagar**  | `Espaço`          | Alterna para o modo de apagar, removendo caracteres por onde o cursor passa |

---

### ↕️ Desenhando Linhas

**Linhas retas** (use as teclas de direção):

| Tecla | Direção  |
| ----- | -------- |
| `←`   | Esquerda |
| `→`   | Direita  |
| `↑`   | Cima     |
| `↓`   | Baixo    |

**Linhas diagonais** :

| Tecla      | Direção                |
| ---------- | ---------------------- |
| `PageUp`   | Cima + Direita (`/`)   |
| `PageDown` | Baixo + Direita (`\`)  |
| `Home`     | Cima + Esquerda (`\`)  |
| `End`      | Baixo + Esquerda (`/`) |

---

### ➡️ Desenhando Setas

| Atalho | Resultado                 |
| ------ | ------------------------- |
| `>`    | Seta para direita (`->`)  |
| `<`    | Seta para esquerda (`<-`) |
| `^`    | Seta para cima (`^`)      |
| `v`    | Seta para baixo (`v`)     |
| `\>`   | Seta grossa para direita  |
| `\<`   | Seta grossa para esquerda |
| `\^`   | Seta grossa para cima     |
| `\v`   | Seta grossa para baixo    |

---

### 📦 Desenhando Formas no Modo Visual

Selecione uma área com `Ctrl-V` (bloco visual) e use:

| Atalho | Função                                                      |
| ------ | ----------------------------------------------------------- |
| `\b`   | Desenha um **retângulo** ao redor da seleção                |
| `\e`   | Desenha uma **elipse** dentro da seleção                    |
| `\a`   | Desenha uma linha com **seta** entre os cantos da seleção   |
| `\l`   | Desenha uma **linha** entre os cantos da seleção (sem seta) |
| `\f`   | **Preenche** a figura com um caractere                      |

---

### ✏️ Dicas e Truques

- **Movendo blocos**: Selecione uma área com o mouse, depois segure `Ctrl` e arraste para mover o bloco 
- **Apagando áreas grandes**: Selecione a área no modo visual e execute `r` (substitui por espaços) 
- **Espaços necessários**: Para usar `\b`, `\e`, `\a` etc., a área deve conter espaços em branco 
- **Evite o modo Insert**: Durante o desenho, use o modo de substituição (`R`) para não estragar o diagrama 

---

### 🎯 No Seu `init.vim`

O comando já está configurado:

```vim
nmap <silent><leader>u :call ToggleDrawIt()<cr>:echo g:di<cr>
```

Basta pressionar `<leader>u` (Espaço + U) para ativar/desativar o DrawIt. O plugin alterna entre os estados "start" e "stop" .

---

Com um pouco de prática, você conseguirá criar diagramas ASCII rapidamente dentro do Neovim!
