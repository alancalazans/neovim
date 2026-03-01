# Adaptando vimrc para init.vim do NeoVim

Aqui está o arquivo adaptado para o NeoVim (`~/.config/nvim/init.vim`):

```vim
"---------------------------------------------
" ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄
"▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌
" ▐░▌           ▐░▌  ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌   ▐░▐░▌
"  ▐░▌         ▐░▌       ▐░▌     ▐░▌▐░▌ ▐░▌▐░▌
"   ▐░▌       ▐░▌        ▐░▌     ▐░▌ ▐░▐░▌ ▐░▌
"    ▐░▌     ▐░▌         ▐░▌     ▐░▌  ▐░▌  ▐░▌
"     ▐░▌   ▐░▌          ▐░▌     ▐░▌   ▀   ▐░▌
"      ▐░▌ ▐░▌           ▐░▌     ▐░▌       ▐░▌
"       ▐░▐░▌        ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌
"        ▐░▌        ▐░░░░░░░░░░░▌▐░▌       ▐░▌
"         ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀
"---------------------------------------------
" File: init.vim
" Author: Alan Calazans <alancalazans@hotmail.com.br>
" Created: dom 02 mai 2021
" Updated: sex 28 nov 2025
" Installation: Place this file in $HOME/.config/nvim/init.vim
" License: GNU General Public License v3
" <http://www.gnu.org/licenses/gpl.html>
" Version: 2.0 (NeoVim)
"-----------------------
"--- Suporte a cores ---
"-----------------------
" NeoVim já suporta termguicolors nativamente
set termguicolors
"-------------------------------------
"--- Suporte ao itálico verdadeiro ---
"-------------------------------------
" NeoVim não precisa de t_ZH/t_ZR, o suporte a itálico
" é nativo via termguicolors e emuladores modernos.
set noautochdir " Definir diretorio atual automaticamente
set nostartofline " Não resetar o cursor para o inicio da linha
set autoread " Ler arquivo automaticamente caso ele for modificado externamente
set ai " Ao criar nova linha, usa indentação da linha anterior
" set nocompatible - Removido: NeoVim é sempre 'nocompatible'
set ruler " show the cursor position all the time
set showmatch " Faz o highlight do parênteses, colechetes ou chave correspondente
"-----------------------------------------
"---            LIGTHLINE              ---
"--- Configuration for landscape Theme ---
"-----------------------------------------
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
"-------------------------------------------------------
"--- Mudar cor da barra de status dependendo do modo ---
"-------------------------------------------------------
" Ao entrar em modo insert ele muda a cor da barra de status
" altera a cor da linha de status dependendo do modo
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"----------------------------------------------------
"--- Permite que o mouse seja utilizado na edição ---
"----------------------------------------------------
set mouse=a
"-------------------------------------------------------------
"--- Alguns tipos de arquivos devem ser ignorados pelo Vim ---
"-------------------------------------------------------------
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.wmv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~
"--------------------------------------------------------------
"--- Define codificação, fonte, tema, nº de linha e colunas ---
"--------------------------------------------------------------
" NeoVim já usa UTF-8 por padrão, mas não faz mal declarar
set encoding=utf-8
set fileencoding=utf-8
"-----------------------------
"--- Configuração de fonte ---
"-----------------------------
" NeoVim em terminal não usa guifont (a fonte é do emulador de terminal).
" Se usar um frontend GUI como Neovide, descomente e ajuste:
"set guifont=MonoLisa\ Medium:h12
"---------------------------------
"--- Configura linhas, colunas ---
"---------------------------------
set wildmenu
"-----------------------------------------
"--- Defina o <space> como tecla líder ---
"-----------------------------------------
let g:mapleader = ' '
"----------------------------------------------------
"--- Função para trocar o tema de cores           ---
"--- A primeira linha refere-se ao esquema padrão ---
"----------------------------------------------------
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
"----------------------------------------------
"--- Suprime a mensagem inicial do NeoVim ---
"----------------------------------------------
set shortmess+=I
"---------------------------
"--- Flag tab para 2<->4 ---
"---------------------------
let g:tab = 'tab2'
"-----------------
"--- Tab 2<->4 ---
"-----------------
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
"--------------------------------------------------------------------
"---                      Multiple Cursors                        ---
"--- https://github.com/terryma/vim-multiple-cursors#installation ---
"--------------------------------------------------------------------
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
"---------------------------------
"--- Opções da linha de status ---
"---------------------------------
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
"------------------------------------------------
"--- Autocompletar html, css, javascript, php ---
"------------------------------------------------
filetype on
if has('autocmd')
    filetype plugin indent on
    autocmd FileType javascript set complete-=k~/.config/nvim/doc/js-list.txt complete+=k~/.config/nvim/doc/js-list.txt
    autocmd FileType php set complete-=k~/.config/nvim/doc/php-list.txt complete+=k~/.config/nvim/doc/php-list.txt
    autocmd FileType css set complete-=k~/.config/nvim/doc/css-list.txt complete+=k~/.config/nvim/doc/css-list.txt
    autocmd FileType nim setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType zig setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType ada setlocal tabstop=3 shiftwidth=3 softtabstop=3 expandtab
endif
set omnifunc=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete
au FileType zig set omnifunc=zigcomplete#Complete
" adiciona omnifunc para demais formatos
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif
setlocal sm " Destaca Abertura e fechamento {} [] ()
"------------------------------------------------
"--- Definindo sintaxe para algumas extenções ---
"------------------------------------------------
au BufRead,BufNewFile *.phtml set filetype=php
au BufRead,BufNewFile *.ejs setf html
au BufRead,BufNewFile *.ep setf html
au BufRead,BufNewFile *.pl6 setf perl
au BufRead,BufNewFile *.ts setf javascript
au BufRead,BufNewFile *.go setf go
au BufRead,BufNewFile *.exs setf erlang
au BufRead,BufNewFile *.ex setf erlang
au BufRead,BufNewFile *.zig setf zig
au BufRead,BufNewFile *.cob,*.cbl,*.cpy setf cobol
"----------------------------------------------------------
"--- Opções de GUI removidas (guioptions não existe     ---
"--- no NeoVim terminal). Se usar frontend GUI como     ---
"--- Neovide, configure conforme a documentação dele.   ---
"----------------------------------------------------------
"----------------------------------------------------------------------------
"--- Essa opção faz com que o <Backspace> se mova e delete nesses locais: ---
"--- indent - permite passar sobre autoindentação.                        ---
"--- eol - permite passar sobre o line-break, juntando duas linhas.       ---
"--- start - permite passar sobre o ponto de inserção.                    ---
"----------------------------------------------------------------------------
set backspace=indent,eol,start
"-----------------------------------------------
"--- Numeração de linhas e busca de palavras ---
"-----------------------------------------------
set nu "linhas numeradas
set is hls is scs "para busca
"----------------------------------
"--- Ativa coloração de sintaxe ---
"----------------------------------
syntax on
"---------------
"--- Backups ---
"---------------
set nobackup "desabilita os bkps
set noswapfile "evita arquivos temporarios
set nowritebackup "evita arquivos tmp que começam com ~ ou termina com .swp
"------------------------------------
"--- Identação e quebra de linhas ---
"------------------------------------
set linebreak " Quebra a linha sem quebrar a palavra
set ci "recuo
set tabstop=2 " tab = 2 brancos
set shiftwidth=2 " Quando o autoindent faz um tab, ele é do tamanho de 2
set softtabstop=2 " Tecla Backspace volta 2 espaços quando estiver numa identação
set noexpandtab " cria tabs no lugar de espaços
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
"----------------------------------------------------------------
"--- permite indentar bloco de texto selecionado usando 'tab' ---
"--- com guia e "des"indentar usando 'shift + tab'.           ---
"----------------------------------------------------------------
imap <s-tab> <c-o><lt><lt>
nmap <tab> >>
nmap <s-tab> <lt><lt>
vmap <tab> >>
vmap <s-tab> <lt>
"----------------------------------
"--- Atalhos p/ abas 'Ctrl + t' ---
"--- abre uma nova aba.         ---
"----------------------------------
imap <c-t> <esc>:tabnew<cr>
nmap <c-t> :tabnew<cr>
"-------------------------------------------
"--- 'Ctrl+PageUp' pula para próxima aba ---
"-------------------------------------------
imap <c-pageup> <esc>:tabnext<cr>
"-----------------------------------------------
"--- 'Ctrl+PageDown' volta para aba anterior ---
"-----------------------------------------------
imap <c-pagedown> <esc>:tabprevious<cr>
"-------------------------------------
"--- 'Ctrl+e' fecha a aba corrente ---
"-------------------------------------
imap <c-e> <esc>:tabclose<cr>
"-----------------------------------------------------------
"--- Atalhos comuns de teclado                           ---
"--- Permite selecionar com SHIFT + SETA como no Windows ---
"-----------------------------------------------------------
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive
"---------------------------------
"--- Mostra ou não a identacão ---
"---------------------------------
set listchars=tab:¦\ ,trail:·,eol:¬
set list
nmap <leader>i :set list!<cr>
"--------------------------------------------------
"--- Backspace no modo de visão apaga a seleção ---
"--------------------------------------------------
vmap <bs> d
"--------------------
"--- CTRL-S salva ---
"--------------------
nmap <c-s> :update<cr>
vmap <c-s> <c-c>:update<cr>
imap <c-s> <c-o>:update<cr>
"---------------------------------
"--- Ao salvar remover espaços ---
"--- e tabs de fim de linha.   ---
"---------------------------------
autocmd BufWritePre * :%s/\s\+$//e
"---------------------
"--- CTRL-Z desfaz ---
"---------------------
nmap <c-z> u
vmap <c-z> <c-c>u
imap <c-z> <c-o>u
"--------------------
"--- CTRL-Y refaz ---
"--------------------
nmap <c-y> <c-r>
vmap <c-y> <c-c><c-r>
imap <c-y> <c-o><c-r>
"---------------------
"--- Fechar Editor ---
"---------------------
nmap <c-q> :qall<cr>
vmap <c-q> <c-c>:q<cr>
imap <c-q> <c-o>:q<cr>
"------------------------------
"--- CTRL-F4 fecha a janela ---
"------------------------------
nmap <c-F4> <c-w>c
imap <c-F4> <c-o><c-w>c
cmap <c-F4> <c-c><c-w>c
omap <c-F4> <c-c><c-w>c
"--------------------------------------------------
"--- Mova para o próximo buffer com <líder> + l ---
"--------------------------------------------------
nmap <leader>l :bnext<cr>
vmap <leader>l <c-c>:bnext<cr>
"---------------------------------------------------
"--- Mova para o buffer anterior com <líder> + j ---
"---------------------------------------------------
nmap <leader>j :bprevious<cr>
vmap <leader>j <c-c>:bprevious<cr>
"---------------------------------------------
"--- Fechar o buffer atual com <líder> + q ---
"---------------------------------------------
nmap <leader>q :bdelete<cr>
vmap <leader>q <c-c>:bdelete<cr>
"----------------------------
"--- Alinhamento de texto ---
"----------------------------
nmap <leader>, :left<cr>
nmap <leader>. :right<cr>
nmap <leader>; :center<cr>
"-------------
"--- Emmet ---
"-------------
nmap <leader>e <c-y>,
"-----------------------------------------------------------------------
"--- Retira os ^M que ficam no final de arquivos salvos pelo windows ---
"-----------------------------------------------------------------------
nmap <leader>m :%s/\r//g<cr>
"-----------------------------------------------------------
"--- Remove espaços redundantes no fim das linhas com \s ---
"-----------------------------------------------------------
nmap <leader>s mz:%s/\s\+$//g<cr>`z
"--------------------------------
"--- Limpa o buffer de buscas ---
"--------------------------------
nmap <leader>b :let @/=""<cr>
"-------------------------------------------
"--- Recarrega o arquivo de configuração ---
"-------------------------------------------
nmap <leader>v :source $MYVIMRC<cr>
"----------------------------------------------
"--- Convert <tab> em <spaces> e vice-versa ---
"----------------------------------------------
nmap <leader>[ :set expandtab<cr> :retab<cr>
nmap <leader>] :%s/\s\{2,}/\t/g<cr>
"-----------------------------
"--- Movimentando o cursor ---
"-----------------------------
imap <m-h> <left>
imap <m-j> <down>
imap <m-k> <up>
imap <m-l> <right>
"--------------------------------
"--- Habilita auto-indentação ---
"--------------------------------
if has("autocmd")
    filetype plugin indent on
endif
"--------------------------------------------------
"--- Movimentação de bloco de texto selecionado ---
"--------------------------------------------------
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
"--------------------------------------------------
"--- Move bloco de texto selecionado para baixo ---
"--------------------------------------------------
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
"---------------------------------
"--- Duplica um bloco de texto ---
"---------------------------------
function! Duplicate()
    let end=line("'>")
    let start=line("'<")
    let dif=end - start
    exec "'<,'>y"
    exec "normal " . end . "G"
    exec "normal p"
    exec "normal " . (start+dif+1) . "GV" . (end+dif+1) . "G"
endfunction
"------------------------------------------------
"--- Move bloco de texto selecionado pra cima ---
"------------------------------------------------
vmap <c-s-up> :<c-u> call MoveUp()<cr>
"-------------------------------------------------
"--- Move bloco de texto selecionado pra baixo ---
"-------------------------------------------------
vmap <c-s-down> :<c-u>call MoveDown()<cr>
"--------------------------------------------
"--- Duplica o bloco de texto selecionado ---
"--------------------------------------------
vmap <c-d> :<c-u>call Duplicate()<cr>
"------------------------------------------
"--- Fechamento automático de tags HTML ---
"------------------------------------------
imap ><tab>> <esc>mt?<\w<cr>:let @/=""<cr>lyiw`ta</><esc>P`tli
"-------------------
"--- Abreviações ---
"-------------------
iab a. ª
iab o. º
iab no. nº
iab No. Nº
"--------------------------------------------------
"--- Habilitar área de transferência do sistema ---
"--------------------------------------------------
set clipboard=unnamedplus
"-------------------------------------------
"--- Modifica o comportamento do menu de ---
"--- auto-completar para se comportar    ---
"--- mais como uma IDE.                  ---
"-------------------------------------------
set completeopt=noinsert,menuone,noselect
"---------------------------------------
"--- Destaca a linha atual no editor ---
"---------------------------------------
set cursorline
"-----------------------------------
"--- Esconde buffers não usados ---
"-----------------------------------
set hidden
"---------------------------------------------------
"--- configura o comportamento da divisão da     ---
"--- tela com o comando :split (dividir a tela   ---
"--- horizontalmente) e :vsplit (verticalmente). ---
"--- Neste caso, as telas sempre se dividirão    ---
"--- abaixo da tela atual e à direita.           ---
"---------------------------------------------------
set splitbelow splitright
"----------------------------------
"--- Mostra o título do arquivo ---
"----------------------------------
set title
"----------------------------------------------------
"--- Tempo e milissegundos para aceitar comandos. ---
"----------------------------------------------------
set ttimeoutlen=0
"-------------------------------------------------
"--- <Ctrl-X> - cut (goto visual mode and cut) ---
"-------------------------------------------------
imap <C-X> <C-O>vgG
vmap <C-X> "*x<Esc>i
nmap <C-X> <c-x> <c-o>
"---------------------------------------------------
"--- <Ctrl-C> - copy (goto visual mode and copy) ---
"---------------------------------------------------
imap <C-C> <C-O>vgG
vmap <C-C> "*y<Esc>i
"---------------------------
"--- <Ctrl-A> - copy all ---
"---------------------------
vmap <C-A> <Esc>gggH<C-O>G<Esc>i
"------------------------
"--- <Ctrl-V> - paste ---
"------------------------
nm \\paste\\ "=@*.'xy'<CR>gPFx"_2x:echo<CR>
imap <C-V> x<Esc>\\paste\\"_s
vmap <C-V> "-cx<Esc>\\paste\\"_x
"---------------------------
"--- <Ctrl-A> - copy all ---
"---------------------------
nmap <c-a> gggH<c-o>G
imap <c-a> <c-o>gg<c-o>gH<c-o>G
cmap <c-a> <c-c>gggH<c-o>G
omap <c-a> <c-c>gggH<c-o>G
smap <c-a> <c-c>gggH<c-o>G
xmap <c-a> <c-c>ggVG
map <c-a> <esc>ggvG
"-------------------------------------------------------
"--- VIM-PLUG (https://github.com/junegunn/vim-plug) ---
"-------------------------------------------------------
" Instale o vim-plug para NeoVim:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin('~/.local/share/nvim/plugged')
    "-------------------
    "--- Appearance ---
    "------------------
    Plug 'vim-airline/vim-airline'
    Plug 'gko/vim-coloresque'
    Plug 'ryanoasis/vim-devicons'
    "-----------------
    "--- Utilities ---
    "-----------------
    Plug 'mattn/emmet-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ap/vim-css-color'
    Plug 'thaerkh/vim-indentguides'
    Plug 'vim-scripts/DrawIt'
    "-----------------------------------------
    "--- Completion / linters / formatters ---
    "-----------------------------------------
    Plug 'dense-analysis/ale'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'alaviss/nim.nvim'
    Plug 'neovim/nvim-lspconfig'
    "Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()
"---------------------------
"--- Nvim-Treesitter {{{ ---
"---------------------------
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"    ensure_installed = { "nim" },
"    highlight = {
"        enable = true,
"    },
"}
"EOF
"--- }}}
"------------------
"--- DrawIt {{{ ---
"------------------
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
"--- }}}
"--------------------
"--- NERDTree {{{ ---
"--------------------
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
"--- }}}
"---------------
"--- ALE {{{ ---
"---------------
let g:ale_completion_enabled = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
"--- }}}
"--------------------
"--- SnipMate {{{ ---
"--------------------
"let g:snipMate = { 'snippet_version': 1 }
"imap <c-j> <Plug>snipMateNextOrTrigger
"--- }}}
"---------------------
"--- Lspconfig {{{ ---
"---------------------
"lua <<EOF
"require'lspconfig'.nim_langserver.setup{
"  settings = {
"    nim = {
"      nimsuggestPath = "~/.nimble/bin"
"    }
"  }
"}
"require'lspconfig'.nimls.setup{
"  cmd = { "nimlangserver" },
"  filetypes = { "nim" },
"  root_dir = require'lspconfig'.util.root_pattern(".git", "nim.cfg", "config.nims"),
"  settings = {
"    nimls = {
"      suggest = { useNimsuggest = true }
"    }
"  }
"}
"EOF
"--- }}}
"-------------------------------
"--- Folding / Unfolding {{{ ---
"-------------------------------
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
"--- }}}
"------------------------------------
"--- Cor da numeração lateral {{{ ---
"------------------------------------
hi LineNr guifg=#ffffff ctermfg=lightCyan
"--- }}}
"-------------------------------
"--- Configuração COBOL {{{ ---
"-------------------------------
let g:cobol_legacy_code = 1
let cobol_error_lines = 1
"--- }}}
```

## Resumo das alterações feitas

As mudanças foram pontuais, pois o NeoVim mantém alta compatibilidade com VimScript. Aqui está o que foi alterado:

**Removido `set nocompatible`** — O NeoVim já opera sempre no modo "nocompatible"; essa opção nem existe nele.

**Removidas as variáveis de terminal `t_ZH` e `t_ZR`** — O NeoVim não usa variáveis `t_*` do Vim clássico. O suporte a itálico é tratado nativamente pelo emulador de terminal quando `termguicolors` está ativo.

**Simplificado o bloco `termguicolors`** — Removida a checagem `if has("termguicolors")`, pois o NeoVim sempre suporta essa opção.

**Removida a checagem `if version >= 700`** — O NeoVim está muito além da versão 700; a condicional era desnecessária.

**Removidos os blocos `guioptions`** — A opção `guioptions` não existe no NeoVim terminal. Se estiver usando um frontend GUI como Neovide, a configuração seria diferente. Deixei um comentário orientando.

**Adaptada a configuração de `guifont`** — Toda a lógica com `has('gui_running')` foi removida, já que no NeoVim terminal a fonte é definida pelo emulador. Deixei uma linha comentada para frontends GUI.

**Alterados os caminhos de `~/.vim/` para `~/.config/nvim/`** — Os arquivos de autocompletar (`js-list.txt`, `php-list.txt`, `css-list.txt`) agora apontam para `~/.config/nvim/doc/`.

**Alterado o diretório do vim-plug** — De `~/.vim/plugged` para `~/.local/share/nvim/plugged`, que é o caminho padrão do NeoVim. Incluí também um comentário com o comando de instalação do vim-plug para NeoVim.

**Cabeçalho atualizado** — Nome do arquivo alterado para `init.vim`, instruções de instalação atualizadas para o caminho `$HOME/.config/nvim/init.vim`, e versão marcada como 2.0 (NeoVim).

---

# Instalando pacotes (no Linux)

## Instalação dos pacotes

### 1. Instalar o vim-plug (gerenciador de plugins)

Execute no terminal:

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### 2. Criar a estrutura de diretórios

```bash
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/undo
```

### 3. Salvar o arquivo de configuração

Copie o conteúdo do script adaptado e salve como:

```bash
~/.config/nvim/init.vim
```

### 4. Instalar os plugins

Abra o NeoVim e execute:

```vim
:PlugInstall
```

Isso vai baixar e instalar todos os plugins listados entre `plug#begin()` e `plug#end()`. Você verá uma janela com o progresso de cada plugin.

### 5. Instalar os servidores LSP

Após o `:PlugInstall`, ainda dentro do NeoVim, execute:

```vim
:MasonInstall pyright typescript-language-server html-lsp css-lsp lua-language-server
```

Ou abra a interface gráfica do Mason com `:Mason` e escolha os servidores que deseja instalar navegando pela lista.

### 6. Instalar o Treesitter (parsers de linguagens)

O Treesitter vai tentar instalar automaticamente os parsers definidos no `ensure_installed`. Caso não instale, force manualmente:

```vim
:TSInstall vim lua python javascript typescript html css nim zig
```

### 7. Dependências externas no sistema

Algumas ferramentas precisam estar instaladas no sistema operacional:

```bash
# Node.js (necessário para vários LSPs)
sudo apt install nodejs npm

# Python (para pyright)
sudo apt install python3 python3-pip

# Compilador C (necessário para Treesitter compilar os parsers)
sudo apt install gcc build-essential

# Clipboard (para o clipboard=unnamedplus funcionar no terminal)
sudo apt install xclip
# ou
sudo apt install xsel

# Nerd Fonts (para os ícones do devicons funcionarem)
# Baixe de: https://www.nerdfonts.com/
# Exemplo com MonoLisa ou outra font patched
```

### Comandos úteis de manutenção

```vim
" Atualizar todos os plugins
:PlugUpdate

" Remover plugins não listados no init.vim
:PlugClean

" Atualizar o próprio vim-plug
:PlugUpgrade

" Atualizar parsers do Treesitter
:TSUpdate

" Atualizar servidores LSP
:MasonUpdate

" Verificar saúde geral do NeoVim
:checkhealth
```

O `:checkhealth` é particularmente útil — ele mostra um relatório completo indicando o que está funcionando e o que está faltando no seu ambiente.

---

# Instalando pacotes (no Windows)

## Instalação no Windows

### 1. Instalar o NeoVim

Escolha uma das opções:

```powershell
# Via Winget (Windows Package Manager)
winget install Neovim.Neovim

# Via Chocolatey
choco install neovim

# Via Scoop
scoop install neovim
```

Ou baixe o instalador direto de: https://github.com/neovim/neovim/releases

### 2. Instalar dependências essenciais

```powershell
# Node.js (necessário para vários LSPs)
winget install OpenJS.NodeJS

# Python
winget install Python.Python.3

# Git (necessário para o vim-plug baixar plugins)
winget install Git.Git

# Compilador C (necessário para Treesitter)
# Opção 1: MinGW via Scoop
scoop install mingw

# Opção 2: Build Tools do Visual Studio
winget install Microsoft.VisualStudio.2022.BuildTools
```

### 3. Instalar o vim-plug

Abra o **PowerShell** e execute:

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

### 4. Criar a estrutura de diretórios

```powershell
# Diretório de configuração
mkdir ~\AppData\Local\nvim -Force

# Diretório para undo persistente
mkdir ~\AppData\Local\nvim\undo -Force
```

### 5. Adaptar os caminhos no init.vim

Antes de salvar, ajuste estas linhas no script:

```vim
" ANTES (Linux):
call plug#begin('~/.config/nvim/plugged')
set undodir=~/.config/nvim/undo//

" DEPOIS (Windows):
call plug#begin('~/AppData/Local/nvim/plugged')
set undodir=~/AppData/Local/nvim/undo//
```

### 6. Salvar o arquivo de configuração

Salve o `init.vim` no caminho:

```
C:\Users\SEU_USUARIO\AppData\Local\nvim\init.vim
```

Ou pelo PowerShell:

```powershell
# Abrir o diretório no Explorer
explorer $env:LOCALAPPDATA\nvim

# Ou criar/editar direto com o NeoVim
nvim $env:LOCALAPPDATA\nvim\init.vim
```

### 7. Instalar os plugins

Abra o NeoVim e execute:

```vim
:PlugInstall
```

### 8. Instalar servidores LSP

Dentro do NeoVim:

```vim
:MasonInstall pyright typescript-language-server html-lsp css-lsp lua-language-server
```

Ou navegue pela interface com:

```vim
:Mason
```

### 9. Instalar parsers do Treesitter

```vim
:TSInstall vim lua python javascript typescript html css nim zig
```

### 10. Instalar uma Nerd Font

Os ícones do `vim-devicons` exigem uma Nerd Font:

```powershell
# Via Scoop
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Ou baixe manualmente de:
# https://www.nerdfonts.com/font-downloads
```

Após instalar, configure a fonte no seu terminal (Windows Terminal, por exemplo): vá em **Configurações → Perfil → Aparência → Tipo de fonte** e selecione a Nerd Font instalada.

### 11. Configurar o clipboard

No Windows, o clipboard já funciona nativamente com `set clipboard=unnamedplus`. Não precisa instalar nada adicional.

### Verificar a instalação

Dentro do NeoVim, execute:

```vim
:checkhealth
```

Esse comando mostra um relatório detalhado indicando o que está funcionando e o que precisa de atenção. Corrija os itens marcados com **ERROR** ou **WARNING**.

### Comandos de manutenção

```vim
:PlugUpdate       " Atualizar plugins
:PlugClean        " Remover plugins não usados
:PlugUpgrade      " Atualizar o vim-plug
:TSUpdate         " Atualizar parsers Treesitter
:MasonUpdate      " Atualizar servidores LSP
:checkhealth      " Diagnóstico geral
```

### Resumo dos caminhos no Windows

| Item         | Caminho                                           |
| ------------ | ------------------------------------------------- |
| Configuração | `%LOCALAPPDATA%\nvim\init.vim`                    |
| Plugins      | `%LOCALAPPDATA%\nvim\plugged\`                    |
| Undo         | `%LOCALAPPDATA%\nvim\undo\`                       |
| vim-plug     | `%LOCALAPPDATA%\nvim-data\site\autoload\plug.vim` |

---

# Resolvendo o erro do colorscheme

O erro ocorre porque o tema `molokai` não está instalado. Você tem duas opções:

### Opção 1: Adicionar o tema como plugin

Edite o `init.vim` e adicione os temas na seção de plugins:

```vim
call plug#begin('~/AppData/Local/nvim/plugged')

    " Temas (adicione estas linhas)
    Plug 'tomasr/molokai'
    Plug 'jaredgorski/spacecamp'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'

    " ... restante dos plugins ...

call plug#end()
```

Depois salve o arquivo e execute dentro do NeoVim:

```vim
:PlugInstall
```

Após a instalação, reinicie o NeoVim e o erro deve desaparecer.

### Opção 2: Usar um tema já incluído no NeoVim

Se quiser algo imediato sem instalar nada, troque a linha do colorscheme por um tema nativo:

```vim
" Substitua:
colorscheme molokai

" Por qualquer um destes (já vêm com o NeoVim):
colorscheme habamax
colorscheme slate
colorscheme industry
colorscheme desert
colorscheme lunaperche
```

E ajuste também a função `ToggleColorscheme()` para usar apenas os temas que você tiver instalados.

### Recomendação

A **Opção 1** é a melhor, pois mantém todos os temas que estavam no seu script original. Basta adicionar as quatro linhas de `Plug` e rodar `:PlugInstall`.

---

# Persistência do erro do ColorScheme

O problema é que o caminho dos plugins no `init.vim` está usando `$HOME\AppData\Local\nvim-data\plugged`, mas o NeoVim está procurando os temas em `C:\Users\Admin\AppData\Local\nvim\plugged`. Há um conflito de caminhos.

### Solução:

**1. Verifique onde os plugins foram instalados**

Abra o PowerShell e execute:

```powershell
# Verificar se existe no nvim-data
ls $env:LOCALAPPDATA\nvim-data\plugged\

# Verificar se existe no nvim
ls $env:LOCALAPPDATA\nvim\plugged\
```

**2. Corrija o caminho no init.vim**

Altere a linha do `plug#begin` para usar o caminho correto:

```vim
" ANTES (com problema):
call plug#begin('$HOME\AppData\Local\nvim-data\plugged')

" DEPOIS (corrija para):
call plug#begin('~/AppData/Local/nvim/plugged')
```

**3. Reinstale os plugins**

Abra o NeoVim (ignore o erro por enquanto pressionando ENTER) e execute:

```vim
:PlugInstall
```

**4. Confirme que o arquivo existe**

Após o `:PlugInstall`, verifique no PowerShell:

```powershell
ls $env:LOCALAPPDATA\nvim\plugged\molokai\colors\
```

Deve aparecer o arquivo `molokai.vim`.

**5. Reinicie o NeoVim**

Se ainda não funcionar, tente uma abordagem alternativa — adicione o caminho manualmente no `init.vim`, **antes** da linha `colorscheme molokai`:

```vim
set runtimepath+=~/AppData/Local/nvim/plugged/molokai
colorscheme molokai
```

### Se nada funcionar — instalação manual:

```powershell
# Criar diretório de cores
mkdir $env:LOCALAPPDATA\nvim\colors -Force

# Baixar o molokai.vim direto
curl -o $env:LOCALAPPDATA\nvim\colors\molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
```

Isso coloca o tema diretamente na pasta `colors` do NeoVim, onde ele sempre será encontrado independente do vim-plug.
