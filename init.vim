"=======================================
"  _   _        __      ___
" | \ | |       \ \    / (_)
" |  \| | ___  __\ \  / / _ _ __ ___
" | . ` |/ _ \/ _ \ \/ / | | '_ ` _ \
" | |\  |  __/ (_) \  /  | | | | | | |
" |_| \_|\___|\___/ \/   |_|_| |_| |_|
"
"=======================================
" File: init.vim
" Author: Alan Calazans <alancalazans@hotmail.com.br>
" Created: Sex 30 Abr 2021
" Installation: - As dotfile drop the file into your $HOME/.config/nvim/ folder.
" License: GNU General Public License v3
"          <http://www.gnu.org/licenses/gpl.html>
" Version: 1.0
" Notes: Based on the file:
"        .vimrc (1.0) made by Ivan Carlos da Silva Lopes
"        .vimrc made by Aurelio Marinho Jarga (verde)
"        .vimrc made by Sérgio Luiz Araújo Silva  (voyeg3r) and
"        .vimrc made by J. F. Mitre <jfmitre (at) gmail.com>
"=======================================
set termguicolors  " Ativar true colors no terminal
set noautochdir " Definir diretorio atual automaticamente
set nostartofline " Não resetar o cursor para o inicio da linha
set autoread " Ler arquivo automaticamente caso ele for modificado externalmente
set ai " Ao criar nova linha, usa indentação da linha anterior
set nocompatible
set ruler " show the cursor position all the time
set showmatch " Faz o highlight do parênteses, colechetes ou chave correspondente
"=======================================
" LIGTHLINE
" Configuration for landscape Theme
"=======================================
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified', ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'tagbar', 'fileformat', 'fileencoding', 'filetype'] ],
  \ },
  \ 'separator': { 'left': '【', 'right': '】' },
  \ 'component': {
  \   'lineinfo': '%l\%L [%p%%], %c, %n',
  \   'readonly': '%{&readonly?"\ue0a2":""}',
  \ }
  \ }
"=======================================
" Mudar cor da barra de status dependendo do modo
"=======================================
" Ao entrar em modo insert ele muda a cor da barra de status
" altera a cor da linha de status dependendo do modo
if version >= 700
 au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
 au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
"=======================================
" Permite que o mouse seja utilizado na edição
"=======================================
set mouse=a
"=======================================
" Alguns tipos de arquivos devem ser ignorados pelo Vim.
"=======================================
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.wmv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~
"source $VIMRUNTIME/mswin.vim
"behave mswin
"=======================================
" Define codificação, fonte, tema, nº de linha e colunas
"=======================================
"set nobomb
set encoding=utf-8
set fileencoding=utf-8
"set encoding=iso-8859-1
"set fileencoding=iso-8859-1
"=======================================
" Configuração de fonte (tamanho e nome) para o GVim
"=======================================
if has("gui_running")
  if has("gui_gtk2")
    " Para GTK2
    " Ajustando o tamanho da fonte de acordo com o tamanho da resolução
    " Adicionando no ~/.bashrc as linhas :
    " #
    " # Definindo variável de screen para o vim
    " #
    "  export SCREENSIZE=$(xdpyinfo  | grep 'dim'\
    "                     | sed -e 's/x.*//g' -e 's/^.*[a-z]: *//g')
    " #
    " A beleza dessas linhas é que elas observam o tamanho da resolução do
    " computador cliente, e não do host. Apenas o tamanho horizontal é
    " utilizado como referência, ou seja, 1280x1024, apenas 1280 é
    " verificado para determinar o tamanho da fonte. Isso não funciona bem
    " em monitores cujo o maior tamanho seja o vertical.
    if exists("$SCREENSIZE")
      " se existe a variável $SCREENSIZE
      if ($SCREENSIZE > 1300)
        " se $SCREENSIZE é maior que 1300
        set guifont=Monospace\ 14
      elseif ($SCREENSIZE < 850)
        " se $SCREENSIZE é menor que 850
        set guifont=Monospace\ 8
      else
        " se $SCREENSIZE é maior que 850 e menor que 1300
        set guifont=Monospace\ 11
      endif " Existe SCREENSIZE, e com base nele define-se guifont
      else
        " caso a variável $SCREENSIZE não exista, use...
        " set guifont=DejaVu\ Sans\ Mono\ Book\ 10
        set guifont=Monospace\ 11
    endif  " Define tamanho se existe ou não $SCREENSIZE
  elseif has("x11")
    " Para GTK
    "set guifont=DejaVu\ Sans\ Mono\ Book\ 11
    set guifont=Monospace\ 11
    "set guifont=Courier\ New\ 11
  elseif has("gui_win32")
    " Para Windows
    " set guifont=Consolas:h12:cANSI
    set guifont=Courier\ New:h12:cANSI
  else
    " Para todos as outras gui use ...
    set guifont=Monospace\ 11
  endif " Conclui a verificação do tipo de interface gráfica
endif " Conclui sobre a existência de uma interface gráfica
"=======================================
" Configura linhas, colunas
"=======================================
"set lines=42 columns=80
"set wildmenu
"=======================================
" Defina o ',' como tecla líder
"=======================================
let g:mapleader = ','
"=======================================
" Função para trocar o tema de cores
" A primeira linha refere-se ao esquema padrão
"=======================================
colorscheme OceanicNext 
function! ToggleColorscheme()
  if g:colors_name == 'OceanicNext'
    colorscheme ayu
  elseif g:colors_name == 'ayu'
    colorscheme nvcode
  elseif g:colors_name == 'nvcode'
    colorscheme aylin
  elseif g:colors_name == 'aylin'
    colorscheme midnight
  elseif g:colors_name == 'midnight'
    colorscheme borland
  elseif g:colors_name == 'borland'
    colorscheme OceanicNext
  endif
endfunction
nmap <silent><leader>/ :call ToggleColorscheme()<cr>:echo g:colors_name<cr>
"=======================================
" Suprime a mensagem inicial do GVim
"=======================================
set shortmess+=I
"=======================================
" Flag tab para 2<->4
"=======================================
let g:tab = 'tab2'
"=======================================
" Flag DrawIt
"=======================================
let g:di = 'stop'
"=======================================
" Ativa e Desativa DrawIt
"=======================================
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
"=======================================
" Tab 2<->4
"=======================================
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
nmap <silent><leader>t :call ToggleTab()<cr>:echo g:tab<cr>
"=======================================
" Multiple Cursors
" https://github.com/terryma/vim-multiple-cursors#installation
"=======================================
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
"=======================================
" Opções da linha de status
"=======================================
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
"=======================================
" Autocompletar html, css, javascript, php.
"=======================================
filetype on
if has('autocmd')
  filetype plugin indent on
  "           │     │    └──── Enable file type detection
  "           │     └───────── Enable loading of indent file
  "           └─────────────── Enable loading of plugin files
  autocmd FileType javascript set complete-=k/home/$USER/.vim/doc/js-list.txt complete+=k/home/$USER/.vim/doc/js-list.txt
  autocmd FileType php set complete-=k/home/$USER/.vim/doc/php-list.txt complete+=k/home/$USER/.vim/doc/php-list.txt
  autocmd FileType css set complete-=k/home/$USER/.vim/doc/css-list.txt complete+=k/home/$USER/.vim/doc/css-list.txt
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
nmap <leader>a <c-x> <c-o>
setlocal sm " Destaca Abertura e fechamento {} [] ()
"=======================================
" Definindo sintaxe para algumas extenções.
"=======================================
au BufRead,BufNewFile *.phtml set filetype=php
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.ep set filetype=html
au BufRead,BufNewFile *.pl6 set filetype=perl
au BufRead,BufNewFile *.ts set filetype=javascript
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.exs setf erlang
au BufRead,BufNewFile *.ex setf erlang
"=======================================
" Remover barra de menu, barra rolagem e etc do gVim
"=======================================
"set guioptions-=m
"set guioptions-=T
"set guioptions-=r
set guioptions+=b "Exibe barra de rolagem vertical
"=======================================
" Essa opção faz com que o <Backspace> se mova e delete nesses locais:
" indent - permite passar sobre autoindentação.
" eol - permite passar sobre o line-break, juntando duas linhas.
" start - permite passar sobre o ponto de inserção.
"=======================================
set backspace=indent,eol,start
"=======================================
" Numeração de linhas e busca de palavras
"=======================================
set nu "linhas numeradas
set is hls is scs "para busca
"=======================================
" Cor da numeração lateral
"=======================================
"hi LineNr     guifg=pink     ctermfg=lightMagenta
hi LineNr     guifg=green    ctermfg=lightGreen
"=======================================
" Ativa coloração de sintaxe
"=======================================
syntax on
"=======================================
" Backups
"=======================================
set nobackup "desabilita os bkps
set noswapfile "evita arquivos temporarios
set nowritebackup "evita arquivos tmp que começam com ~ ou termina com .swp
"=======================================
" Identação e quebra de linhas
"=======================================
set linebreak " Quebra a linha sem quebrar a palavra
set autoindent " Auto identação
set smartindent " Auto-indenta
set ci "recuo
set tabstop=2 " tab = 2 brancos
set shiftwidth=2 " Quando o autoindent faz um tab, ele é do tamanho de 2
set softtabstop=2 " Tecla Backspace volta 2 espaços quando estiver numa identação
set noexpandtab " set expandtab "cria espaços no lugar de tabulação
"set nowrap  " Sem wrap (quebra de linha)
"=======================================
" permite indentar bloco de texto selecionado usando 'tab'
" com guia e “des”indentar usando 'shift + tab'
"=======================================
imap <s-tab> <c-o><lt><lt>
nmap <tab> >>
nmap <s-tab> <lt><lt>
vmap <tab> >>
vmap <s-tab> <lt>
"=======================================
" Atalhos Abas
" 'Ctrl+t' abre uma nova aba
"=======================================
imap <c-t> <esc>:tabnew<cr>
nmap <c-t> :tabnew<cr>
"=======================================
" 'Ctrl+PageUp' pula para próxima aba
"=======================================
imap <c-pageup> <esc>:tabnext<cr>
"=======================================
" 'Ctrl+PageDown' volta para aba anterior
"=======================================
imap <c-pagedown> <esc>:tabprevious<cr>
"=======================================
" 'Ctrl+e' fecha a aba corrente
"=======================================
imap <c-e> <esc>:tabclose<cr>
"=======================================
" Atalhos comuns de teclado
" Permite selecionar com SHIFT + SETA como no Windows
"=======================================
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive
"=======================================
" Sidebar de navegação (NERDTree) em off na carga do GVim
"=======================================
let g:nerdtree_tabs_open_on_gui_startup=0
"=======================================
" Atalho p/ sidebar de navegação (plugin NERDTree)
"=======================================
nmap <leader>n :NERDTreeTabsToggle<cr>
"=======================================
" Mostra ou não a identacão
"=======================================
"set listchars=tab:¦·,trail:·,eol:$
"set listchars=tab:▸·,trail:·,eol:¬
set listchars=tab:¦\ ,trail:·,eol:¬
"set list
nmap <leader>i :set list!<cr>
"=======================================
" CTRL-A seleciona tudo
"=======================================
nmap <c-a> gggH<c-o>G
imap <c-a> <c-o>gg<c-o>gH<c-o>G
cmap <c-a> <c-c>gggH<c-o>G
omap <c-a> <c-c>gggH<c-o>G
smap <c-a> <c-c>gggH<c-o>G
xmap <c-a> <c-c>ggVG
map <c-a> <esc>ggvG
"=======================================
" Backspace no modo de visão apaga a seleção
"=======================================
vmap <bs> d
"=======================================
" CTRL-S salva
"=======================================
nmap <c-s> :update<cr>
vmap <c-s> <c-c>:update<cr>
imap <c-s> <c-o>:update<cr>
"=======================================
" CTRL-Z desfaz
"=======================================
nmap <c-z> u
vmap <c-z> <c-c>u
imap <c-z> <c-o>u
"=======================================
" CTRL-Y refaz
"=======================================
nmap <c-y> <c-r>
vmap <c-y> <c-c><c-r>
imap <c-y> <c-o><c-r>
"=======================================
" Fechar Editor
"=======================================
nmap <c-q> :q<cr>
vmap <c-q> <c-c>:q<cr>
imap <c-q> <c-o>:q<cr>
"=======================================
" CTRL-F4 fecha a janela
"=======================================
nmap <c-F4> <c-w>c
imap <c-F4> <c-o><c-w>c
cmap <c-F4> <c-c><c-w>c
omap <c-F4> <c-c><c-w>c
"=======================================
" Mova para o próximo buffer com <líder> + l
"=======================================
nmap <leader>l :bnext<cr>
vmap <leader>l <c-c>:bnext<cr>
"=======================================
" Mova para o buffer anterior com <líder> + j
"=======================================
nmap <leader>j :bprevious<cr>
vmap <leader>j <c-c>:bprevious<cr>
"=======================================
" Fechar o buffer atual com <líder> + q
"=======================================
nmap <leader>q :bdelete<cr>
vmap <leader>q <c-c>:bdelete<cr>
"=======================================
" Alinhamento de texto
"=======================================
nmap <leader>, :left<cr>
nmap <leader>. :right<cr>
nmap <leader>; :center<cr>
"=======================================
" Emmet
"=======================================
nmap <leader>e <c-y>,
"=======================================
" Retira os ^M que ficam no final de arquivos salvos pelo windows.
"=======================================
nmap <leader>m :%s/\r//g<cr>
"=======================================
" Remove espaços redundantes no fim das linhas com \s
"=======================================
nmap <leader>s mz:%s/\s\+$//g<cr>`z
"=======================================
" Limpa o buffer de buscas
"=======================================
nmap <leader>b :let @/=""<cr>
"=======================================
" Recarrega o arquivo de configuração
"=======================================
nmap <leader>v :source $MYVIMRC<cr>
"=======================================
" Convert <tab> em <spaces> e vice-versa
"=======================================
nmap <leader>[ :set expandtab<cr> :retab<cr>
nmap <leader>] :%s/\s\{2,}/\t/g<cr>
"=======================================
" Mapeia a tecla \c para compilar o programa em C
"=======================================
"au BufNewFile,BufRead *.c nmap \c :!gcc "%" -Wall -o "%<"<cr>
"au BufNewFile,BufRead *.c nmap \c :!gcc -Wall "%"<cr>
"=======================================
" Mapeia a tecla \x para executar o programa
"=======================================
"nmap \x :!./"%<"<cr>
"nmap \x :!./a.out<cr>
"=======================================
" mostra o inicio de um bloco recem fechado {}, [], ()
"=======================================
" set sn
"=======================================
" Outra forma de pular fora dos parênteses, colchetes e chaves, mover o cursor
" no modo insert
"=======================================
imap <c-l> <right>
imap <c-h> <left>
imap <m-[> <up>
imap <m-]> <down>
"=======================================
" Habilita auto-indentação
"=======================================
if has("autocmd")
  filetype plugin indent on
endif
"=======================================
" Movimentação de bloco de texto selecionado
"=======================================
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
"=======================================
" Fechamento automático de tags HTML
"=======================================
imap ><tab>> <esc>mt?<\w<cr>:let @/=""<cr>lyiw`ta</><esc>P`tli
"=======================================
" Entra no modo visual para tabular bloco
"=======================================
"imap <f11> <esc><s-v>
"=======================================
" Abreviações
"=======================================
iab http http://
iab https https://
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
"-------------------------------------------
" Habilitar área de transferência do sistema
"-------------------------------------------
"set clipboard=unnamed " No Windows
set clipboard+=unnamedplus " No Linux
"-------------------------------------------
" CTRL-C and CTRL-Insert are Copy
vmap <C-c> "+yi
vmap <C-Insert> "+yi
"-------------------------------------------
" CTRL-V and SHIFT-Insert are Paste
imap <C-v> <ESC>"+p
imap <S-Insert> <ESC>"+p
"-------------------------------------------
" CTRL-X and SHIFT-Del are Cut
vmap <C-x> "+c
vmap <S-Del> "+c
