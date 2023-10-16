"---------------------------------------
"  _   _        __      ___
" | \ | |       \ \    / (_)
" |  \| | ___  __\ \  / / _ _ __ ___
" | . ` |/ _ \/ _ \ \/ / | | '_ ` _ \
" | |\  |  __/ (_) \  /  | | | | | | |
" |_| \_|\___|\___/ \/   |_|_| |_| |_|
"
"---------------------------------------
" File: init.vim
" Author: Alan Calazans <alancalazans@hotmail.com.br>
" Created: Sex 30 Abr 2021
" Updated: Seg 16 Out 2023
" Installation: - As dotfile drop the file into your $HOME/.config/nvim/ folder.
" License: GNU General Public License v3
"          <http://www.gnu.org/licenses/gpl.html>
" Version: 1.0
" Notes: Based on the file:
"        .vimrc (1.0) made by Ivan Carlos da Silva Lopes
"        .vimrc made by Aurelio Marinho Jarga (verde)
"        .vimrc made by Sérgio Luiz Araújo Silva  (voyeg3r) and
"        .vimrc made by J. F. Mitre <jfmitre (at) gmail.com>
"---------------------------------------
" Suporte a cores.
"---------------------------------------
if $TERM !=? 'xterm-256color'
	set termguicolors
endif
"---------------------------------------
" Suporte ao itálico verdadeiro
"---------------------------------------
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set noautochdir " Definir diretorio atual automaticamente
set nostartofline " Não resetar o cursor para o inicio da linha
set autoread " Ler arquivo automaticamente caso ele for modificado externamente
set ai " Ao criar nova linha, usa indentação da linha anterior
set nocompatible
set ruler " show the cursor position all the time
set showmatch " Faz o highlight do parênteses, colechetes ou chave correspondente
"---------------------------------------
" LIGTHLINE
" Configuration for landscape Theme
"---------------------------------------
let g:lightline = {
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\             [ 'readonly', 'filename', 'modified', ] ],
\     'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'tagbar', 'fileformat', 'fileencoding', 'filetype'] ],
\   },
\   'separator': { 'left': '【', 'right': '】' },
\   'component': {
\     'lineinfo': '%l\%L [%p%%], %c, %n',
\     'readonly': '%{&readonly?"\ue0a2":""}',
\   }
\ }
"---------------------------------------
" Mudar cor da barra de status dependendo do modo
"---------------------------------------
" Ao entrar em modo insert ele muda a cor da barra de status
" altera a cor da linha de status dependendo do modo
if version >= 700
 au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
 au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
"---------------------------------------
" Permite que o mouse seja utilizado na edição
"---------------------------------------
set mouse=a
"---------------------------------------
" Alguns tipos de arquivos devem ser ignorados pelo Vim.
"---------------------------------------
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.wmv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~
"source $VIMRUNTIME/mswin.vim
"behave mswin
"---------------------------------------
" Define codificação, fonte, tema, nº de linha e colunas
"---------------------------------------
"set nobomb
set encoding=utf-8
set fileencoding=utf-8
"set encoding=iso-8859-1
"set fileencoding=iso-8859-1
"---------------------------------------
" Configuração de fonte
"---------------------------------------
"set guifont=Monospace\ 12
if has('gui_running') && !has('gui_win32')
  set guifont=FuraMono\ Nerd\ Font\ 12
else
  set guifont=Consolas:h11
endif
"---------------------------------------
" Configura linhas, colunas
"---------------------------------------
"set lines=42 columns=80
set wildmenu
"---------------------------------------
" Defina o <space> como tecla líder
"---------------------------------------
let g:mapleader = ' '
"---------------------------------------
" Função para trocar o tema de cores
" A primeira linha refere-se ao esquema padrão
"---------------------------------------
" Cores disponíveis:
" aylin, ayu, gruvbox, gruvbox-material,
" palenight, spacecamp.
"---------------------------------------
colorscheme molokai
function! ToggleColorscheme()
  if g:colors_name == 'molokai'
    colorscheme spacecamp
  elseif g:colors_name == 'spacecamp'
    colorscheme gruvbox
  elseif g:colors_name == 'gruvbox'
    colorscheme gruvbox-material
  elseif g:colors_name == 'gruvbox-material'
    colorscheme molokai
  endif
  hi LineNr guifg=#ffffff ctermfg=lightCyan
endfunction
nmap <silent><leader>/ :call ToggleColorscheme()<cr>:echo g:colors_name<cr>
"---------------------------------------
" Suprime a mensagem inicial do GVim
"---------------------------------------
set shortmess+=I
"---------------------------------------
" Flag tab para 2<->4
"---------------------------------------
let g:tab = 'tab2'
"---------------------------------------
" Tab 2<->4
"---------------------------------------
function! ToggleTab()
  if g:tab=='tab2'
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    let g:tab='tab4'
  else
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    let g:tab='tab2'
  endif
endfunction
nmap <silent><leader>g :call ToggleTab()<cr>:echo g:tab<cr>
"---------------------------------------
" Multiple Cursors
" https://github.com/terryma/vim-multiple-cursors#installation
"---------------------------------------
" As ligações de teclas, desative-as e reatribua-as da maneira que desejar:
"let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_start_word_key      = '<C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'
"---------------------------------------
" Opções da linha de status
"---------------------------------------
" [1][+][RO] ~/.vimrc [vim] [utf-8] 34, 0x22 0-15 13%"
set laststatus=2 " Quando exibir a linha de status: 2=always
set statusline= " Limpa a linha de status
set statusline+=[%n] " Número do buffer atual
set statusline+=%m%r\ " [+] Quando o arquivo for modificado, [RO] para apenas leitura
set statusline+=%f\ " Nome do arquivo
set statusline+=[%{strlen(&ft)?&ft:'none'}] " Tipo do arquivo
set statusline+=[%{strlen(&fenc)?&fenc:&enc}] " Codificação
set statusline+=%= " Alinha tudo a seguir à direita
set statusline+=%b,0x%-8B\ " ASCII e número hexadecimal do caractere sob o cursor
set statusline+=%-4.(%l-%c%)\ %<%P " Linha-coluna do cursor e percentual do arquivo
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ " Como o vim interpreta o cursor abaixo, tipo vimString
"---------------------------------------
" Autocompletar html, css, javascript, php.
"---------------------------------------
filetype on
if has('autocmd')
  filetype plugin indent on
  "           │     │    └──── Enable file type detection
  "           │     └───────── Enable loading of indent file
  "           └─────────────── Enable loading of plugin files
  autocmd FileType javascript set complete-=k/home/$USER/.vim/doc/js-list.txt complete+=k/home/$USER/.vim/doc/js-list.txt
  autocmd FileType php set complete-=k/home/$USER/.vim/doc/php-list.txt complete+=k/home/$USER/.vim/doc/php-list.txt
  autocmd FileType css set complete-=k/home/$USER/.vim/doc/css-list.txt complete+=k/home/$USER/.vim/doc/css-list.txt
  autocmd FileType nim :set expandtab
endif
set omnifunc=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete
" adiciona omnifunc para demais formatos
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
  \ if &omnifunc == "" |
  \  setlocal omnifunc=syntaxcomplete#Complete |
  \ endif
endif
"nmap <leader>a <c-x> <c-o>
setlocal sm " Destaca Abertura e fechamento {} [] ()
"---------------------------------------
" Definindo sintaxe para algumas extenções.
"---------------------------------------
au BufRead,BufNewFile *.phtml set filetype=php
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.ep set filetype=html
au BufRead,BufNewFile *.pl6 set filetype=perl
au BufRead,BufNewFile *.ts set filetype=javascript
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.exs setf erlang
au BufRead,BufNewFile *.ex setf erlang
"---------------------------------------
" Remover barra de menu, barra rolagem e etc do gVim
"---------------------------------------
"set guioptions-=m
"set guioptions-=T
"set guioptions-=r
set guioptions+=b "Exibe barra de rolagem vertical
"---------------------------------------
" Essa opção faz com que o <Backspace> se mova e delete nesses locais:
" indent - permite passar sobre autoindentação.
" eol - permite passar sobre o line-break, juntando duas linhas.
" start - permite passar sobre o ponto de inserção.
"---------------------------------------
set backspace=indent,eol,start
"---------------------------------------
" Numeração de linhas e busca de palavras
"---------------------------------------
set nu "linhas numeradas
set is hls is scs "para busca
"---------------------------------------
" Ativa coloração de sintaxe
"---------------------------------------
syntax on
"---------------------------------------
" Backups
"---------------------------------------
set nobackup "desabilita os bkps
set noswapfile "evita arquivos temporarios
set nowritebackup "evita arquivos tmp que começam com ~ ou termina com .swp
"---------------------------------------
" Identação e quebra de linhas
"---------------------------------------
set linebreak " Quebra a linha sem quebrar a palavra
"set autoindent " Auto identação
"set smartindent " Auto-indenta
set ci "recuo
set tabstop=2 " tab = 2 brancos
set shiftwidth=2 " Quando o autoindent faz um tab, ele é do tamanho de 2
set softtabstop=2 " Tecla Backspace volta 2 espaços quando estiver numa identação
set noexpandtab " set expandtab "cria espaços no lugar de tabulação
let g:status_tab = 'tab'
function! ToggleStatusTab()
  if g:status_tab=='tab'
    set expandtab
    let g:status_tab = 'space'
  else
    set noexpandtab
    let g:status_tab = 'tab'
  endif
endfunction
nmap <silent><leader>t :call ToggleStatusTab()<cr>:echo g:status_tab<cr>
"set nowrap  " Sem wrap (quebra de linha)
"---------------------------------------
" permite indentar bloco de texto selecionado usando 'tab'
" com guia e “des”indentar usando 'shift + tab'
"---------------------------------------
imap <s-tab> <c-o><lt><lt>
nmap <tab> >>
nmap <s-tab> <lt><lt>
vmap <tab> >>
vmap <s-tab> <lt>
"---------------------------------------
" Atalhos Abas
" 'Ctrl+t' abre uma nova aba
"---------------------------------------
imap <c-t> <esc>:tabnew<cr>
nmap <c-t> :tabnew<cr>
"---------------------------------------
" 'Ctrl+PageUp' pula para próxima aba
"---------------------------------------
imap <c-pageup> <esc>:tabnext<cr>
"---------------------------------------
" 'Ctrl+PageDown' volta para aba anterior
"---------------------------------------
imap <c-pagedown> <esc>:tabprevious<cr>
"---------------------------------------
" 'Ctrl+e' fecha a aba corrente
"---------------------------------------
imap <c-e> <esc>:tabclose<cr>
"---------------------------------------
" Atalhos comuns de teclado
" Permite selecionar com SHIFT + SETA como no Windows
"---------------------------------------
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive
"---------------------------------------
" Mostra ou não a identacão
"---------------------------------------
"set listchars=tab:¦·,trail:·,eol:$
"set listchars=tab:▸·,trail:·,eol:¬
set listchars=tab:¦\ ,trail:·,eol:¬
set list
nmap <leader>i :set list!<cr>
"---------------------------------------
" Backspace no modo de visão apaga a seleção
"---------------------------------------
vmap <bs> d
"---------------------------------------
" CTRL-S salva
"---------------------------------------
nmap <c-s> :update<cr>
vmap <c-s> <c-c>:update<cr>
imap <c-s> <c-o>:update<cr>
"---------------------------------------
" CTRL-Z desfaz
"---------------------------------------
nmap <c-z> u
vmap <c-z> <c-c>u
imap <c-z> <c-o>u
"---------------------------------------
" CTRL-Y refaz
"---------------------------------------
nmap <c-y> <c-r>
vmap <c-y> <c-c><c-r>
imap <c-y> <c-o><c-r>
"---------------------------------------
" Fechar Editor
"---------------------------------------
nmap <c-q> :q<cr>
vmap <c-q> <c-c>:q<cr>
imap <c-q> <c-o>:q<cr>
"---------------------------------------
" CTRL-F4 fecha a janela
"---------------------------------------
nmap <c-F4> <c-w>c
imap <c-F4> <c-o><c-w>c
cmap <c-F4> <c-c><c-w>c
omap <c-F4> <c-c><c-w>c
"---------------------------------------
" Mova para o próximo buffer com <líder> + l
"---------------------------------------
nmap <leader>l :bnext<cr>
vmap <leader>l <c-c>:bnext<cr>
"---------------------------------------
" Mova para o buffer anterior com <líder> + j
"---------------------------------------
nmap <leader>j :bprevious<cr>
vmap <leader>j <c-c>:bprevious<cr>
"---------------------------------------
" Fechar o buffer atual com <líder> + q
"---------------------------------------
nmap <leader>q :bdelete<cr>
vmap <leader>q <c-c>:bdelete<cr>
"---------------------------------------
" Alinhamento de texto
"---------------------------------------
nmap <leader>, :left<cr>
nmap <leader>. :right<cr>
nmap <leader>; :center<cr>
"---------------------------------------
" Emmet
"---------------------------------------
nmap <leader>e <c-y>,
"---------------------------------------
" Retira os ^M que ficam no final de arquivos salvos pelo windows.
"---------------------------------------
nmap <leader>m :%s/\r//g<cr>
"---------------------------------------
" Remove espaços redundantes no fim das linhas com \s
"---------------------------------------
nmap <leader>s mz:%s/\s\+$//g<cr>`z
"---------------------------------------
" Limpa o buffer de buscas
"---------------------------------------
nmap <leader>b :let @/=""<cr>
"---------------------------------------
" Recarrega o arquivo de configuração
"---------------------------------------
nmap <leader>v :source $MYVIMRC<cr>
"---------------------------------------
" Convert <tab> em <spaces> e vice-versa
"---------------------------------------
nmap <leader>[ :set expandtab<cr> :retab<cr>
nmap <leader>] :%s/\s\{2,}/\t/g<cr>
"---------------------------------------
" Mapeia a tecla \c para compilar o programa em C
"---------------------------------------
"au BufNewFile,BufRead *.c nmap \c :!gcc "%" -Wall -o "%<"<cr>
"au BufNewFile,BufRead *.c nmap \c :!gcc -Wall "%"<cr>
"---------------------------------------
" Mapeia a tecla \x para executar o programa
"---------------------------------------
"nmap \x :!./"%<"<cr>
"nmap \x :!./a.out<cr>
"---------------------------------------
" mostra o inicio de um bloco recem fechado {}, [], ()
"---------------------------------------
" set sn
"---------------------------------------
" Movimentando o cursor
"---------------------------------------
imap <M-h> <left>
imap <M-j> <down>
imap <M-k> <up>
imap <M-l> <right>
"---------------------------------------
" Habilita auto-indentação
"---------------------------------------
if has("autocmd")
  filetype plugin indent on
endif
"---------------------------------------
" Movimentação de bloco de texto selecionado
"---------------------------------------
" Move bloco de texto selecionado pra cima
function! MoveUp()
  let end=line("'>")
  let start=line("'<")
  if (start > 1)
    let dif=end - start
    exec "'<,'>d"
    exec "normal kP"
    exec "normal " . (start-1) . "GV" . (end-1) . "G"
    else
    exec "normal " . (start) . "GV" . (end) . "G"
  endif
endfunction
" Move bloco de texto selecionado para baixo
function! MoveDown()
  let end=line("'>")
  let start=line("'<")
  if (end < line("$")-1)
    let dif=end - start
    exec "'<,'>d"
    exec "normal p" . (start+1) . "GV" . (end+1) . "G"
  else
    exec "normal " . (start) . "GV" . (end) . "G"
  endif
endfunction
" Duplica um bloco de texto
function! Duplicate()
  let end=line("'>")
  let start=line("'<")
  let dif=end - start
  exec "'<,'>y"
  exec "normal " . end . "G"
  exec "normal p"
  exec "normal " . (start+dif+1) . "GV" . (end+dif+1) . "G"
endfunction
" Move bloco de texto selecionado pra cima
vmap <c-s-up> :<c-u> call MoveUp()<cr>
" Move bloco de texto selecionado pra baixo
vmap <c-s-down> :<c-u>call MoveDown()<cr>
" Duplica o bloco de texto selecionado
vmap <c-d> :<c-u>call Duplicate()<cr>
"---------------------------------------
" Fechamento automático de tags HTML
"---------------------------------------
imap ><tab>> <esc>mt?<\w<cr>:let @/=""<cr>lyiw`ta</><esc>P`tli
"---------------------------------------
" Entra no modo visual para tabular bloco
"---------------------------------------
"imap <f11> <esc><s-v>
"---------------------------------------
" Abreviações
"---------------------------------------
"iab http http://
"iab https https://
iab ´a á
iab ´A Á
iab ´e é
iab ´E É
iab ´i í
iab ´I Í
iab ´o ó
iab ´O Ó
iab ´u ú
iab ´U Ú
iab a. ª
iab o. º
iab no. nº
iab No. Nº
iab 1a. 1ª
iab 2a. 2ª
iab 3a. 3ª
iab 4a. 4ª
iab 5a. 5ª
iab 6a. 6ª
iab 7a. 7ª
iab 8a. 8ª
iab 9a. 9ª
iab 10a. 10ª
iab 11a. 11ª
iab 12a. 12ª
iab 13a. 13ª
iab 14a. 14ª
iab 15a. 15ª
"---------------------------------------
" Habilitar área de transferência do sistema
"---------------------------------------
"set clipboard=unnamed " No Windows
set clipboard=unnamedplus " No Linux
"---------------------------------------
"Copy/Paste/Cut
"---------------------------------------
"if has('unnamedplus')
"  set clipboard=unnamed,unnamedplus
"endif
"---------------------------------------
" Modifica o comportamento do menu de
" auto-completar para se comportar mais como
" uma IDE.
"---------------------------------------
set completeopt=noinsert,menuone,noselect
"---------------------------------------
" Destaca a linha atual no editor.
"---------------------------------------
set cursorline
"---------------------------------------
" Esconde buffers1 não usados.
"---------------------------------------
set hidden
"---------------------------------------
" Mostra as linhas a partir da atual. Útil
" para auxiliar em comandos que usam mais
" linhas.
"---------------------------------------
"set relativenumber
"---------------------------------------
" configura o comportamento da divisão da
" tela com o comando :split (dividir a tela
" horizontalmente) e :vsplit (verticalmente).
" Neste caso, as telas sempre se dividirão
" abaixo da tela atual e à direita.
"---------------------------------------
set splitbelow splitright
"---------------------------------------
" Mostra o título do arquivo
"---------------------------------------
set title
"---------------------------------------
" Tempo e milissegundos para aceitar comandos.
"---------------------------------------
set ttimeoutlen=0
"---------------------------------------
"<Ctrl-X> -- cut (goto visual mode and cut)
"---------------------------------------
imap <C-X> <C-O>vgG
vmap <C-X> "*x<Esc>i
nmap <C-X> <c-x> <c-o>
"---------------------------------------
"<Ctrl-C> -- copy (goto visual mode and copy)
"---------------------------------------
imap <C-C> <C-O>vgG
vmap <C-C> "*y<Esc>i
"---------------------------------------
"<Ctrl-A> -- copy all
"---------------------------------------
"imap <C-A> <C-O>gg<C-O>gH<C-O>G<Esc>
vmap <C-A> <Esc>gggH<C-O>G<Esc>i
"---------------------------------------
"<Ctrl-V> -- paste
"---------------------------------------
nm \\paste\\ "=@*.'xy'<CR>gPFx"_2x:echo<CR>
imap <C-V> x<Esc>\\paste\\"_s
vmap <C-V> "-cx<Esc>\\paste\\"_x
"---------------------------------------
"<Ctrl-A> -- copy all
"---------------------------------------
nmap <c-a> gggH<c-o>G
imap <c-a> <c-o>gg<c-o>gH<c-o>G
cmap <c-a> <c-c>gggH<c-o>G
omap <c-a> <c-c>gggH<c-o>G
smap <c-a> <c-c>gggH<c-o>G
xmap <c-a> <c-c>ggVG
map <c-a> <esc>ggvG
"---------------------------------------
" VIM-PLUG (https://github.com/junegunn/vim-plug)
"---------------------------------------
call plug#begin('~/.config/nvim/plugged')
	"---------------------------------------
	" Appearance
	"---------------------------------------
	Plug 'vim-airline/vim-airline'
	Plug 'gko/vim-coloresque'
	Plug 'ryanoasis/vim-devicons'
	"---------------------------------------
	" Utilities
	"---------------------------------------
	Plug 'mattn/emmet-vim'
	Plug 'jiangmiao/auto-pairs'
	"Plug 'ervandew/supertab'
	Plug 'MarcWeber/vim-addon-mw-utils'
	Plug 'tomtom/tlib_vim'
	Plug 'garbas/vim-snipmate'
	Plug 'sheerun/vim-polyglot'
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ap/vim-css-color'
	Plug 'thaerkh/vim-indentguides'
	Plug 'vim-scripts/DrawIt'
	"---------------------------------------
	" Completion / linters / formatters
	"---------------------------------------
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'artur-shaik/vim-Javacomplete2'
	Plug 'majutsushi/tagbar'
	Plug 'dense-analysis/ale'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'alaviss/nim.nvim'
call plug#end()
"---------------------------------------
" DrawIt {{{
"---------------------------------------
" Flag
let g:di = 'stop'
function! ToggleDrawIt()
  if g:di=='stop'
    :DIstart
    let g:di='start'
  else
    :DIstop
    let g:di='stop'
  endif
endfunction
nmap <silent><leader>u :call ToggleDrawIt()<cr>:echo g:di<cr>
" }}}
"---------------------------------------
"NERDTree {{{
"---------------------------------------
nmap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }
" }}}
"---------------------------------------
" Ale {{{
"---------------------------------------
let g:ale_completion_enabled = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" Configurar compiladores para linguagens
let g:ale_linters = {
\  'cs':['syntax', 'semantic', 'issues'],
\  'python': ['pylint'],
\  'java': ['javac']
\}
"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\}
"
"let g:ale_fixers = {
"\   '*': ['trim_whitespace'],
"\}
"
"let g:ale_fix_on_save = 1
" }}}
"---------------------------------------
" SnipMate {{{
"---------------------------------------
" Para usar a versão mais atual do analisador
let g:snipMate = { 'snippet_version': 1 }
imap <c-j> <Plug>snipMateNextOrTrigger
" }}}
"---------------------------------------
filetype indent off
filetype plugin off
"---------------------------------------
" Deoplete {{{
"---------------------------------------
" Não se esqueça de iniciar o deoplete
" let g:deoplete#enable_at_startup = 1 'Menos spam
" let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_at_startup = 1
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
"---------------------------------------
" Vim-Javacomplete2 {{{
"---------------------------------------
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
" }}}
"---------------------------------------
" TagBar {{{
"---------------------------------------
" Ctrl-b to open Tagbar
map <c-b> :TagbarToggle<CR>
" }}}
"---------------------------------------
" Folding / Unfolding {{{
"---------------------------------------
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
set fillchars=fold:\ "The backslash escapes a space
set foldtext=CustomFoldText()
function! CustomFoldText()
	let indentation = indent(v:foldstart - 1)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = " " . foldSize . " lines "
	let foldLevelStr = repeat("+--", v:foldlevel)
	let expansionString = repeat(" ", indentation)
	return expansionString . foldLevelStr . foldSizeStr
endfunction
" }}}
"---------------------------------------
" Cor da numeração lateral {{{
"---------------------------------------
"hi LineNr guifg=blue ctermfg=lightBlue
"hi LineNr guifg=green ctermfg=lightGreen
"hi LineNr guifg=yellow ctermfg=lightYellow
"hi LineNr guifg=pink ctermfg=lightPink
"hi LineNr guifg=magenta ctermfg=lightPink
hi LineNr guifg=#ffffff ctermfg=lightCyan
" }}}
