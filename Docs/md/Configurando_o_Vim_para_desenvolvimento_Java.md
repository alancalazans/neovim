# CONFIGURANDO O VIM PARA DESENVOLVIMENTO JAVA

[fonte](https://averywagar.com/post/vim-java/)

 Qui, 11 de janeiro de 2018 Leitura de 8 minutos

Bem-vindos de volta, meus colegas Vimmers.

Hoje vou mostrar como converter o (Neo)Vim em um IDE Java. Discutiremos vários plug-ins, mapeamentos e ferramentas externas nesta postagem.

## Plug-ins

Portanto, no meu, `.vimrc`tenho uma infinidade de plug-ins diferentes diretamente relacionados ao desenvolvimento Java.

- [Deoplete](https://github.com/Shougo/deoplete.nvim)
- [Javacomplete2](https://github.com/artur-shaik/vim-Javacomplete2)
- [Ale](https://github.com/w0rp/ale)
- [Ultisnips](https://github.com/SirVer/ultisnips)
- [Tagbar](https://github.com/majutsushi/tagbar)
- [Ctrl-P](https://github.com/kien/ctrlp.vim)
- [NERD-TREE](https://github.com/scrooloose/nerdtree)

> Além disso, assumiremos que você tem [o vim-plug](https://github.com/junegunn/vim-plug) instalado como gerenciador de plugins. Caso contrário, recomendo obtê-lo. mas se você não quiser fazer a troca, você pode encontrar todas as instruções de instalação nos plugins GitHub.

**CERTIFIQUE-SE DE CORRER `:PlugInstall`QUANDO TERMINARMOS!**

## Desoplete.nvim

Portanto, o preenchimento automático em programação tem sido um tema quente recentemente. Como muitos desenvolvedores afirmam que confiamos demais no preenchimento automático e não aprendemos tanto sobre a sintaxe real da linguagem. Discordo. Acho que os desenvolvedores usam o preenchimento automático para serem mais rápidos no que fazemos!

> **Nota** : este plugin só funciona no [NeoVim](https://neovim.io/) . Ou com suporte para Vim 8 e python instalado

![esgotar JavaScript](https://camo.githubusercontent.com/cfdefba43971bd44d466ead357bb296e38d7f88c/68747470733a2f2f6d656469612e67697068792e636f6d2f6d656469612f6c344b6930316d30314939424f485745302f67697068792e676966)

### Instalação

Para instalar o Deoplete adicione o seguinte ao seu`.vimrc`

```shell
" Code completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
```

### Configuração

Eu recomendo adicionar o seguinte ao seu `.vimrc`:

```shell
" Não se esqueça de iniciar o deoplete let g:deoplete#enable_at_startup = 1 'Menos spam let g:deoplete#auto_complete_start_length = 2 
" Use smartcase
let g:deoplete#enable_smart_case = 1


" Fontes de conclusão de configuração
let g:deoplete#sources = {}

" IMPORTANTE: INSTALE JAVACOMPLETE2 E ULTISNIPS OU NÃO ADICIONE ESTA LINHA!
" =====================================

let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer', 'ultisnips']

" =====================================

""use TAB as the mapping
inoremap <silent><expr> <TAB>
    \ pumvisible() ?  "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}
```

Agora você está pronto para começar!

## Vim-Javacomplete2

Então, agora que temos um plugin de conclusão funcional para o vim, vamos colocar um pouco de sintaxe Java lá.

### Instalação

Instale o plugin adicionando o seguinte ao seu`.vimrc`

```shell
" Java-completion
Plug 'artur-shaik/vim-Javacomplete2'
```

**OU se você tiver uma máquina rápida**

```shell
" Java-completion
Plug 'artur-shaik/vim-Javacomplete2', {'for': 'java'} " Carregar apenas para arquivos java 
```

### Configurando

Para obter a conclusão automaticamente ao abrir um arquivo Java, adicione isto ao seu`.vimrc`

```shell
" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
```

## ALE

Outro ótimo plugin que uso (não apenas para Java) é o ALE. Que significa Asynchronous Linting Engine, o que basicamente significa que ele informa se você escreveu algum código incorretamente e é muito rápido.

Você pode usar ale para outras linguagens além de Java, ele tem uma longa lista de suporte, incluindo python. C#, C++, Lua, Haskell, JavaScript (sim, incluindo node.js), uma lista completa está disponível [aqui](https://github.com/w0rp/ale#supported-languages)

### Instalação

Então, para corrigir magicamente todo o seu código… adicione o seguinte ao seu`.vimrc`

```shell
Plug 'w0rp-ale'
```

Você Terminou.

### Configurando

Adicione isso e seu novo linter funcionará!

```shell
" Encurtar sinalizadores de erro/aviso
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" Tenho alguns ícones personalizados para erros e avisos, mas fique à vontade para alterá-los.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Desative ou ative a Lista de locais na parte inferior do vim
" Tudo se resume à preferência pessoal.
let g:ale_open_list = 0
let g:ale_loclist = 0


" Configurar compiladores para linguagens

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac']
      \ }
```

É isso. Agora aproveite seu código correto!

## UltiSnips

Outra ferramenta que gosto de usar é o Ultisnips, um gerenciador de snippets digno do seu tempo. Para quem não sabe o que é um snippet: [Wikipedia - Snippet](https://en.wikipedia.org/wiki/Snippet_(programming))

> **Nota** : Este demora um pouco mais para configurar. Mas pode ser extremamente gratificante.

![Gifs Ultisnips](https://camo.githubusercontent.com/296aecf30e1607233814196db6bd3f5f47e70c73/68747470733a2f2f7261772e6769746875622e636f6d2f5369725665722f756c7469736e6970732f6d61737465722f646f632f64656d6f2e676966)

### Instalação

Instale o plugin adicionando o seguinte ao seu`.vimrc`

```shell
" Snippet manager
Plug 'SirVer/ultisnips'
```

### Configurando

Então, como mencionado acima, este leva muito mais tempo para configurar, então peguem suas pipocas, senhoras e senhores…

`.vimrc`configuração

```shell
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" Since we are already using Deoplete, and using tab with both doesn't work nice use <c-j> instead
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
```

Tudo bem, agora que configuramos o Vim para usar snippets. Vamos adicionar alguns ao nosso diretório Ultisnips.

```shell
cd ~/.vim/UltiSnips/
```

Agora que estamos aqui, adicione alguns arquivos de snippets dependendo da linguagem de programação que você deseja.

```shell
touch ./<programming language here>.snippets
```

Como este é um guia Java, usarei Java, mas você entendeu.

#### Adicionando trechos

Agora é hora de adicionar alguns trechos. Por exemplo, meu `java.snippets`pode ser algo como:

```shell
priority 10


# System.out.println();
snippet sout "System.out.println();" bA
System.out.println($0);
endsnippet

snippet br "break" bA
break;
endsnippet

snippet cs "case" b
case $1:
    $2
$0
endsnippet

snippet ca "catch" b
catch (${1:Exception} ${2:e})`!p nl(snip)`{
    $0
}
endsnippet

# Main method for Java Class
snippet main "public static void main()" bA
public static void main (String[] args){
    $0
}
endsnippet

# if statement
snippet if "If this then that" bA
if ($1){
    $2
}
$3
endsnippet

# Else if statement
snippet elif "else if this then that" bA
else if ($1){
    $2
}
$3
endsnippet

snippet for "for(int i; i < imax; i++)" bA
for ($1; $2; $3){
    $4
}

endsnippet
```

Isso me permite digitar `sout`e obter `System.out.println();`, ou `br`virar para `break;`, ou `ca`para `catch (e)`. Há muito mais trechos neste arquivo que não entrarei em detalhes para seu bem. Mas se você estiver interessado, pode ler mais [aqui](https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt) .

## TagBar

Outra ferramenta que gosto de usar é o TagBar, uma ferramenta que mostra as variáveis dos métodos e muito mais em um buffer à direita do seu arquivo

![janela](https://camo.githubusercontent.com/f5065c1dda4cbd6df6eed89c4086e31fc1774b2e/68747470733a2f2f692e696d6775722e636f6d2f6e3462705076332e706e67)

### Instalação

Você pode instalar o TagBar adicionando o seguinte ao seu`.vimrc`

```shell
Plug 'majutsushi/tagbar'
```

### Configurando

Para abrir o TagBar faça`:TagbarToggle`

ou adicione o seguinte ao seu`.vimrc`

```vim
" Ctrl-b to open Tagbar
map <C-b> :TagbarToggle<CR>
```

Agora você pode usar Ctrl-b para abrir o Tagbar.

## CtrlP.vim

Ctrlp é um ótimo localizador difuso que pode ser configurado para usar ferramentas mais rápidas que o grep. Ele pode pesquisar buffers, arquivos e muito mais!

![ctrlp](https://camo.githubusercontent.com/0a0b4c0d24a44d381cbad420ecb285abc2aaa4cb/687474703a2f2f692e696d6775722e636f6d2f7949796e722e706e67)

### Instalação

Você pode instalar Ctrl-P adicionando o seguinte ao seu`.vimrc`

```shell
Plug 'ctrlpvim/ctrlp.vim'
```

### Configurando

Mapeie Ctrl-p para abrir Ctrl-p.

```shell
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" use current git repo/file director with ctrl p
let g:ctrlp_working_path_mode = 'ra'
```

## NERD TREE

NERD TREE é um substituto avançado do netrw para o Vim, não estou dizendo que haja algo errado com o netrw. No entanto, acho que muitos concordariam comigo quando digo que o NERD TREE é mais *amigável ao usuário* .

![nerdtree](https://github.com/scrooloose/nerdtree/raw/master/screenshot.png?Raw=true)

Algumas coisas que você pode fazer com NERD TREE incluem:

- Gerencia arquivos
  - Mover
  - Renomear
  - Excluir
  - Criar
- Verifique os status do git (ou seja, instale o nerdtree-git-plugin)
- Alterar diretório de trabalho

### Instalação

Você pode instalar o NERD TREE adicionando o seguinte ao seu`.vimrc`

```shell
Plug 'scrooloose/nerdtree'
```

### Configurando

Adicione isso ao seu`.vimrc`

```shell
" Abrir quando nenhum arquivo foi especificado na inicialização do vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Alternar nerdtree
map <C-n> :NERDTreeToggle<CR>
```

Agora você pode usar sua nova árvore de arquivos.

## Mapeamentos

Agora veremos alguns atalhos que você pode adicionar ao seu`.vimrc`

## Compilação rápida

Compilar automaticamente java com líder-m

```lisp
" Fácil compilação java no vim
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#
```

## Lista de locais (Saída ALE)

Abra e feche a janela de saída de ALEs com líder-e líder-w

```lisp
"Lista de locais
map <leader>e :lopen<CR>
map <leader>w :lclose<CR>
```

## Ferramentas externas

### Use RipGrep (RG) com Ctrlp

1. Certifique-se de [que o RipGrep](https://github.com/BurntSushi/ripgrep) esteja instalado
2. Adicione o seguinte ao seu`.vimrc`

```shell
function! CtrlPCommand()
  let c = 0
  let wincount = winnr('$')
  " Não abra aqui se o buffer atual não for gravável (por exemplo, NERDTree)
  while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
    exec 'wincmd w'
    let c = c + 1
  endwhile
  exec 'CtrlP'
endfunction
let g:ctrlp_cmd = 'call CtrlPCommand()'

"RipGrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = {
      \ 'dir':  '',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.meta|\.zip|\.rar|\.ipa|\.apk',
      \ }
```

1. Benefício!

## Compiladores Java e ferramentas de linha de comando

1. Instale o OpenJDK para sua versão Java, pois eles tendem a funcionar melhor com plug-ins Vim e Linux.
2. Ouvi coisas boas sobre o JavaKit como compilador ALE. Diz-me o que pensas.

## Conclusão

Agora que você terminou de configurar seu próprio *IDE VimJ* . Agora você pode escrever algum código Java no conforto do seu editor de texto favorito!

## Dr.

Uau, você finalmente terminou! Como é?

Oh, espere um minuto... você realmente não leu isso agora, não é?

O que é isso que você quer que eu faça um tl;dr?

**Que vergonha para você** . Você já deve saber o quão importante é saber tudo o que está no seu vimrc! Mas tudo bem, se você insistir.

```shell
call plug#begin('~/.vim/bundle')

Plug 'Shougo/deoplete.nvim'
Plug 'artur-shaik/vim-javacomplete2' " , { 'for': 'java'}
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
"Ctrlp Settings {{{

let g:ctrlp_map = '<c-p>'

let g:ctrlp_cmd = 'ctrlp'
let g:ctrlp_dont_split = 'nerd'
let g:ctrlp_working_path_mode = 'rw'
set wildignore+=*/.git/*,*/tmp/*,*.swp/*,*/node_modules/*,*/temp/*,*/Builds/*,*/ProjectSettings/*
" Não defina limite máximo de arquivos
let g:ctrlp_max_files = 0
" Pesquise no diretório atual em vez da raiz do projeto


function! CtrlPCommand()
  let c = 0
  let wincount = winnr('$')
  " Don't open it here if current buffer is not writable (e.g. NERDTree)
  while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
    exec 'wincmd w'
    let c = c + 1
  endwhile
  exec 'CtrlP'
endfunction
let g:ctrlp_cmd = 'call CtrlPCommand()'

"RipGrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = {
      \ 'dir':  '',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.meta|\.zip|\.rar|\.ipa|\.apk',
      \ }
" }}}
"Configurações do Ale {{{

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'
let g:ale_open_list = 0
let g:ale_loclist = 0
"g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac']
      \ }
" }}}
" Deoplete {{{

let g:deoplete#enable_at_startup = 1

let g:deoplete#auto_complete_start_length = 2
let g:deoplete#sources = {}
let g:deoplete#sources._=['buffer', 'ultisnips', 'file', 'dictionary']
let g:deoplete#sources.javascript = ['tern', 'omni', 'file', 'buffer', 'ultisnips']

" Use smartcase.
let g:deoplete#enable_smart_case = 1


"set completeopt-=preview

" Use TAB como mapeamento
inoremap <silent><expr> <TAB>
      \ pumvisible() ?  "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}
" }}}
" UltiSnips {{{

" Configuração de gatilho. Não use a guia se você usar https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Se você quiser que o :UltiSnipsEdit divida sua janela.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" }}}
" Java {{{

" Fácil compilação java no vim
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#
" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
" }}}
```

[\#vim](https://averywagar.com/tags/vim/)[ \#java](https://averywagar.com/tags/java/)[ \#devtools](https://averywagar.com/tags/devtools/)

