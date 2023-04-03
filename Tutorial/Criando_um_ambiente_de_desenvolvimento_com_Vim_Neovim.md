# Criando um ambiente de desenvolvimento com Vim/Neovim

site [dev.to](https://dev.to/edersonferreira/criando-um-ambiente-de-desenvolvimento-com-vim-neovim-42)

Durante lives na [Twitch](https://twitch.tv/), [Rattones](https://twitter.com/rattones/) e outras pessoas me sugeriram fazer um artigo ensinando como transformar um Vim puro á um bom ambiente de desenvolvimento generalista, e será isso que irei mostrar.

# Neovim

Primeiramente, neste artigo não irei usar o Vim, mas sim o [Neovim](https://github.com/neovim/neovim/). Neovim é um fork do Vim só que com mais contribuições open-source, mais atualizado com recursos como API's para várias linguagens e janelas flutuantes. Por isso ele será usado ao invés do Vim.

# Instalação

Precisaremos do Neovim e Node/NPM (Para o autocomplete). As instruções para instalação estão abaixo:

## Ubuntu, Mint e derivados

```
sudo apt install neovim nodejs npm git
```

## Fedora

```
sudo dnf install neovim nodejs git
```

## Arch

```
sudo pacman -S neovim nodejs npm git
```

# Primeiras noções no Neovim

Podemos abrir um arquivo vazio novo no Neovim executando `nvim` apenas. Com isso, uma janela como essa irá se abrir:

[![Captura de tela de uma janela vazia do Neovim](https://res.cloudinary.com/practicaldev/image/fetch/s--03aF30Qk--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/7d24rrzvo3ywh8jf7m3r.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--03aF30Qk--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/7d24rrzvo3ywh8jf7m3r.png)

Também podemos especificar um arquivo, abrindo esse arquivo dentro do editor, como por exemplo: `nvim meuArquivo.txt`, uma janela como essa irá se abrir:

[![Captura de tela de uma janela do Neovim aberta com um arquivo](https://res.cloudinary.com/practicaldev/image/fetch/s--MfRiDMeN--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/2fpcjataunfa5oew4dbr.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--MfRiDMeN--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/2fpcjataunfa5oew4dbr.png)

A maioria dos plugins são compatíveis tanto com Vim e com Neovim. Além das configurações e teclas. Logo toda vez que estiver escrito "Vim" neste artigo, a dica também valerá para o Neovim.

Dentro do Vim (e dentro do Neovim também) temos o conceito de modos. Há 4 principais modos dentro do Vim:

## Normal

O modo normal é o principal modo do Vim. Dentro desse modo a maioria das teclas tem uma função específica, como deletar um caractere, ir para outro modo, mover o cursor,etc. Alguns exemplos são:

- `h` ou seta para esquerda | Mover o cursor um caractere á esquerda
- `j` ou seta para baixo | Mover o cursor um caractere para baixo
- `k` ou seta para cima | Mover o cursor um caractere para cima
- `l` ou seta para direita | Mover o cursor um caractere á direita
- `x` | Deletar o caractere atual
- `dd` | Remove uma linha
- `u` | Retroceder uma ação
- `<CTRL>+R` | Refazer uma ação

Entre outras várias teclas.

## Inserção

O modo de inserção será o modo onde iremos inserir texto. Dentro deste modo toda tecla comum insere texto dentro do arquivo. Podemos entrar dentro do modo de inserção normalmente apertando `i` e começando a escrever. Podemos sair do modo de inserção apertando a tecla `<ESC>`. Voltando ao modo normal.

Uma dica é usar o `o` para entrar no modo de inserção inserindo uma linha abaixo, e com o `O` para inserir uma linha acima. Isso é útil para adicionar linhas mais rapidamente.

## Visual

O modo visual é o modo de seleção. Dentro desse modo poderemos selecionar texto para copiar, remover, editar,etc. Para acessar o modo visual, esteja no modo normal e aperte a tecla `v`. Para apagar todo o texto selecionado por exemplo, selecione o texto e aperte `x`.

## Comando

O modo de comando é o modo onde podemos usar comandos do Vim ou dos plugins que iremos inserir. Esse modo pode ser acessado usando a tecla `:` no modo normal. Experimente digitar `:echo "Hello World"` no modo de comando para ver um `Hello World` na barra do seu Vim.

Alguns comandos são:

- `:w` | Salvar arquivo
- `:q` | Sair do arquivo
- `:q!` | Forçar saida do arquivo (caso o arquivo não esteja salvo)
- `:wq` | Salvar e sair do arquivo

# Vim Plug

Agora vamos começar a parte dos Plugins. Primeiramente iremos precisar de um gerenciador de Plugins. Há vários ótimos disponíveis, mas neste tutorial iremos usar o [Vim Plug](https://github.com/junegunn/vim-plug). O Vim Plug é bem simples de adicionar, remover e gerenciar os plugins.

Para instalar, use este comando em qualquer distribuição Linux:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```



# Instalando Plugins

Para instalar um plugin, primeiramente precisaremos criar o nosso arquivo de configuração do Neovim. Primeiramente, crie um diretório `nvim` dentro de `~/.config`, com por exemplo:

```
mkdir ~/.config/nvim
```



Agora, dentro do diretório `nvim`, iremos criar um arquivo `init.vim` com as configurações, logo, você pode fazer isso com:

```
nvim ~/.config/nvim/init.vim
```



Apenas por teste, abra esse arquivo, aperte `i` para ir ao modo de inserção, digite:

```
set number
set termguicolors
```



Agora aperte `<ESC>`, e `:wq` para salvar o arquivo.

Agora, caso você entre no arquivo novamente, você verá números que representam cada linha do arquivo!

A outra configuração que fizemos `set termguicolors` habilita melhor compatibilidade com temas. Isso será útil para instalar um tema personalizado ao seu Neovim.

[![Captura da nova configuração do Neovim com números ao lado das linhas](https://res.cloudinary.com/practicaldev/image/fetch/s--weD6T3Ys--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/nsz0dejb2x9u1t3i2csk.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--weD6T3Ys--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/nsz0dejb2x9u1t3i2csk.png)

Agora, iremos inserir abaixo dessa configuração dos números, este código:

```
set number

call plug#begin()

call plug#end()
```



Agora, iremos inserir dentro destes dois `call`, os plugins. Vamos supor que você queria usar o tema de cores [Dalton](https://github.com/edersonferreira/dalton-vim):

[![Captura de tela do tema Dalton](https://res.cloudinary.com/practicaldev/image/fetch/s--MkwRVjq4--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/edersonferreira/dalton-vim/master/assets/dalton.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--MkwRVjq4--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/edersonferreira/dalton-vim/master/assets/dalton.png)

Para instalar qualquer plugin, precisaremos colocar `Plug` seguido do usuário/repostório. Para instalar especificamente o Dalton será por exemplo assim:

```
set number

call plug#begin()

Plug 'edersonferreira/dalton-vim'

call plug#end()
```



Agora, salve e feche o arquivo com `:wq`, entre novamente e digite `:PlugInstall` no modo de comando para instalar o tema.

> Toda vez que você adicionar um novo plugin, lembre de rodar `:PlugInstall` para fazer a instalação.

Após instalar o tema, vá na linha abaixo de `call plug#end()` e digite `color dalton` para definir o Dalton como o tema padrão do seu Neovim. Ao final, o arquivo ficará assim:

```
set number

call plug#begin()

Plug 'edersonferreira/dalton-vim'

call plug#end()

color dalton
```



Após isso, o Dalton já será o tema padrão do seu Neovim!

# Plugins Funcionais

Agora iremos instalar alguns plugins funcionais para o Neovim. Que trarão novas funcionalidades e facilidades pra transformar um Neovim puro em um bom ambiente de desenvolvimento.

## Vim Polyglot

[Vim Polyglot](https://github.com/sheerun/vim-polyglot) é um plugin que possibilita *syntax highlight* para várias linguagens no Vim. Para instalar, adicione

```
Plug 'sheerun/vim-polyglot'
```



Entre os dois `call` dentro do seu `init.vim`

## NERDtree

[NERDtree](https://github.com/preservim/nerdtree) É uma barra de navegação por arquivos e diretórios. Facilita na edição de múltiplos arquivos.

[![Captura de tela do NERDtree](https://res.cloudinary.com/practicaldev/image/fetch/s--CBp7df3S--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/preservim/nerdtree/master/screenshot.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--CBp7df3S--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/preservim/nerdtree/master/screenshot.png)

Para instalar, coloque esse `Plug` no seu `init.vim`

```
Plug 'preservim/nerdtree'
```



Agora devemos criar um **map**, que são atalhos para comandos do Vim. Normalmente, após o `:PlugInstall`, você teria que executar `:NERDTree` no modo de comando, mas podemos criar um map para facilitar isso:

Insira abaixo do `call plug#end()` este conteúdo:

```
nnoremap <C-n> :NERDTreeToggle<CR>
```



Com isso, após salvar e entrar novamente em algum arquivo, usando `CTRL + N` A barra lateral do NERDTree irá aparecer.

## Vim Airline

Vim Airline é uma barra personalizada para melhorar a beleza, e possibilitar que você veja os buffers (arquivos abertos) de forma gráfica e facil.

[![demo do Vim Airline](https://res.cloudinary.com/practicaldev/image/fetch/s--FK5PvQUB--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://github.com/vim-airline/vim-airline/wiki/screenshots/demo.gif)](https://res.cloudinary.com/practicaldev/image/fetch/s--FK5PvQUB--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://github.com/vim-airline/vim-airline/wiki/screenshots/demo.gif)

Para instalar o Vim Airline, coloque este `Plug` no seu `init.vim`

```
Plug 'vim-airline/vim-airline'
```



Agora, precisaremos configurar algumas configurações do Airline, deixando mais funcional e bonito. Um exemplo de configuração é essa:

> Sempre quando é algo não relacionado á instalação de plugins, copie fora dos dois `call`, para separar as instalações dos plugins das configurações.

```
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_theme='dalton'
```



Agora você terá todos os arquivos que você abriu em uma barra cima, e com o tema Dalton que instalamos anteriormente.

[![Captura de tela do Neovim usando Airline](https://res.cloudinary.com/practicaldev/image/fetch/s--n3cFoEh1--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/tk2ouk118b28pxg1lqsi.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--n3cFoEh1--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/tk2ouk118b28pxg1lqsi.png)

## CoC.nvim

[CoC.nvim](https://github.com/neoclide/coc.nvim) é um autocomplete para várias linguagens. O CoC funciona apenas no Neovim pois é usado internamente a API do Neovim, para acessar os dados sobre o arquivo e aparecer as janelas que sugerem as palavras.

[![Captura de tela do CoC funcionando](https://res.cloudinary.com/practicaldev/image/fetch/s--a2ea9qY8--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif)](https://res.cloudinary.com/practicaldev/image/fetch/s--a2ea9qY8--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif)

Para instalar, adicione este `Plug`:

```
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```



Agora, depois do CoC instalado, use o comando `CocInstall` seguido do pacote da linguagem que você deseja. Para por exemplo, instalar o pacote do Javascript, TypeScript e JSON, use:

```
:CocInstall coc-json coc-tsserver
```



E além disso precisaremos configurar os atalhos do CoC. Para assim usar `<TAB>` para dar foco nas opções, poder usar as setas para mover e `<ENTER>` para selecionar. Coloque isso no final do arquivo.

```
" Configurações do CoC.nvim

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Fim das configurações do CoC.nvim
```



Pronto, agora você já tem um bom autocomplete instalado, Você só vai precisar ver quais são os nomes dos pacotes de autocomplete do CoC das linguagens que você usa, e instalar com `:CocInstall`.

# ALE

[ALE](https://github.com/dense-analysis/ale) é um analisador de código assíncrono. Com o ALE, você conseguirá ver os erros que há no seu código diretamente no editor.

[![Demo do Ale](https://res.cloudinary.com/practicaldev/image/fetch/s--QLvrcWPY--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://user-images.githubusercontent.com/3518142/59195938-3a81b100-8b85-11e9-8e8d-6a601b1db908.gif)](https://res.cloudinary.com/practicaldev/image/fetch/s--QLvrcWPY--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://user-images.githubusercontent.com/3518142/59195938-3a81b100-8b85-11e9-8e8d-6a601b1db908.gif)

Para instalar, adicione este `Plug`:

```
Plug 'dense-analysis/ale'
```



## Vim Coloresque

[Vim Coloresque](https://github.com/gko/vim-coloresque) é um plugin que adiciona destaque de cores para nomes de cores, hexadecimais, rgba,etc. Facilitando pra editar por exemplo, arquivos CSS.

[![Demo do Vim Coloresque](https://camo.githubusercontent.com/402543f507e017f9611c807bf473e9211a4d06fac8480bb6ea5274dce3325b76/68747470733a2f2f7261772e6769746875622e636f6d2f676f726f64696e736b69792f76696d2d636f6c6f7265737175652f6d61737465722f73637265656e2e706e67)](https://camo.githubusercontent.com/402543f507e017f9611c807bf473e9211a4d06fac8480bb6ea5274dce3325b76/68747470733a2f2f7261772e6769746875622e636f6d2f676f726f64696e736b69792f76696d2d636f6c6f7265737175652f6d61737465722f73637265656e2e706e67)

Para instalar o Vim Coloresque adicione este `Plug`:

```
Plug 'gko/vim-coloresque'
```



## Vim Devicons

[Vim Devicons](https://github.com/ryanoasis/vim-devicons) é um plugin para adicionar ícones para certas linguagens, frameworks, tipos de arquivos,etc. ao Vim.

[![Demo do Vim Devicons](https://res.cloudinary.com/practicaldev/image/fetch/s--WcVbGFuD--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v0.10.x/overall-screenshot.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--WcVbGFuD--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v0.10.x/overall-screenshot.png)

Para instalar, adicione este `Plug`:

```
Plug 'ryanoasis/vim-devicons'
```



E também rode este comando para adicionar as fontes:

```
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```



Também é bom usar junto com o [NERDTree Syntax Highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)

[![Demo do NERDTree syntax highlight](https://res.cloudinary.com/practicaldev/image/fetch/s--iSz-Zmsx--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/tiagofumo/vim-nerdtree-syntax-highlight/master/screenshots/allfiles.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--iSz-Zmsx--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/tiagofumo/vim-nerdtree-syntax-highlight/master/screenshots/allfiles.png)

O NERDTree Syntax Highlight pode ser instalado adicionando esse `Plug`:

```
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
```

## Vim IndentGuides

[Vim IndentGuides](https://dev.tothaerkh/vim-indentguides) é um plugin que destaca a indentação do arquivo que você está editando.

[![Demo do Vim IndentGuides](https://res.cloudinary.com/practicaldev/image/fetch/s--ThEgovDb--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/thaerkh/vim-indentguides/master/wiki/screenshots/demo.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--ThEgovDb--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://raw.githubusercontent.com/thaerkh/vim-indentguides/master/wiki/screenshots/demo.png)

Para instalar o Vim IndentGuides adicione este `Plug`:

```
Plug 'thaerkh/vim-indentguides'
```



E no final do seu `init.vim`, adicionar os caracteres que irão aparecer na guia da indentação. Tanto para espaço quanto para TAB:

```
" Configurações do Vim IndentGuides

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

" Fim das configurações do Vim IndentGuides
```



## Lexima.vim

[Levxima.vim](https://github.com/cohama/lexima.vim) é um plugin de auto-pairs para o Neovim. Com ele, sempre que você digitar `{`, `'`, `"`, `[` ou outras teclas, já será autocompletado o fechamento, como `}`, `'`, `"`, `]`.

Para instalar esse Plugin, adicione este `Plug`:

```
Plug 'cohama/lexima.vim'
```



Agora, no final do arquivo você deve adicionar qual será o caractere que irá adicionar as linhas de indentação, uma sugestão é essa:

```
" Configurações do lexima.vim

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

" Fim das configurações do lexima.vim
```



# Maps Importantes

Também é interessante que você tenha algumas maps (atalhos) que facilitem a edição de arquivos. Todas esses maps podem ser facilmente mudados para uma outra tecla.

Alguns exemplos são:

## Salvar arquivos com CTRL + S

```
nnoremap <C-s> :w!<CR>
```



## Sair do Vim com CTRL + q

```
nnoremap <C-q> :qa<CR>
```



## Alternar entre abas (buffers) com F1 e F2

```
nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>
```



## Alternar a posição de uma linha com SHIFT + seta para cima e SHIFT + seta para baixo

```
nnoremap <silent> <s-Down> :m +1<CR>
nnoremap <silent> <s-Up> :m -2<CR>
```



## Copiar um texto e enviar esse texto para a área de transferência

```
vnoremap <C-c> "+y<CR>
```

# E Agora?

Agora você já está com um Neovim bem configurado. Agora você deve aprender mais sobre o Vim, atalhos, sobre os modos, etc. Um **ÓTIMO** vídeo em português para aprender é [esse do Calango Hackerclub](https://www.youtube.com/watch?v=UUzW46SeLhg)

E também buscar mais plugins, configurações, adaptações,etc. Específicos para o quê você faz no editor. Uma boa dica é trocar o Dalton por um tema que você já utiliza ou outro que você achar agradável.

E por fim, obrigado por ler esse artigo :)