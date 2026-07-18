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
" Updated: sex 17 jul 2026
" Installation: Place this file in ~/.config/nvim/
" or
" Installation: Place this file in ~\AppData\Local\nvim\
" License: GNU General Public License v3
" <http://www.gnu.org/licenses/gpl.html>
"-----------------------
"--- Suporte a cores ---
"-----------------------
" {{{
	set termguicolors
	set background=dark
" }}}
"-------------------------------------
"--- Suporte ao itálico verdadeiro ---
"-------------------------------------
" {{{
	set noautochdir
	set nostartofline
	set autoread
	set ai
	set ruler
	set showmatch
	set updatetime=300
	set scrolloff=4
" }}}
"-----------------------------------------
"---             LUALINE               ---
"---   Statusline moderno (lualine)    ---
"-----------------------------------------
" {{{
	set laststatus=2
	set noshowmode
	set noruler
	set showtabline=2
	set fillchars+=eob:\ ,vert:│

	lua << EOF
	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,
		callback = function()
			local ok, lualine = pcall(require, "lualine")
			if ok then
				lualine.setup {
					options = {
						theme = "powerline",
						icons_enabled = true,
						component_separators = { left = "", right = "" },
						section_separators  = { left = "", right = "" },
					},
					sections = {
						lualine_a = { "mode" },
						lualine_b = { "branch", "diff" },
						lualine_c = { "filename" },
						lualine_x = { "diagnostics", "filetype" },
						lualine_y = { "progress" },
						lualine_z = { "location" },
					},
				}
			end
		end,
	})
EOF
" }}}
"---------------------------------
"--- Indent Blankline (guias)  ---
"---------------------------------
" {{{
	lua << EOF
	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,
		callback = function()
			local ok, ibl = pcall(require, "ibl")
			if ok then
				ibl.setup { scope = { enabled = false } }
			end
		end,
	})
EOF
" }}}
"-------------------------------------------------------
"--- Mudar cor da barra de status dependendo do modo ---
"-------------------------------------------------------
" {{{
	au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=none
	au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
" }}}
"----------------------------------------------------
"--- Permite que o mouse seja utilizado na edição ---
"----------------------------------------------------
" {{{
	set mouse=a
" }}}
"-------------------------------------------------------------
"--- Alguns tipos de arquivos devem ser ignorados pelo Vim ---
"-------------------------------------------------------------
" {{{
	set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.wmv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~
" }}}
"----------------
"--- Encoding ---
"----------------
" {{{
	set encoding=utf-8
	set fileencoding=utf-8
" }}}
"-----------------------------
"--- Configuração de fonte ---
"-----------------------------
" {{{
	"set guifont=MonoLisa\ Medium:h12
" }}}
"---------------------------------
"--- Configura linhas, colunas ---
"---------------------------------
" {{{
	set wildmenu
" }}}
"-----------------------------------------
"--- Defina o <space> como tecla líder ---
"-----------------------------------------
" {{{
	let g:mapleader = ' '
" }}}
"------------------------------------------------------
"--- Tempo de resposta mais rápido para mapeamentos ---
"------------------------------------------------------
" {{{
"	set timeoutlen=200
"	set ttimeoutlen=10
" }}}
"-------------------------------------------------------------
"--- Garante que backspace funcione corretamente no insert ---
"-------------------------------------------------------------
" {{{
	set backspace=indent,eol,start
" }}}
"--------------------------------------------
"--- Suprime a mensagem inicial do NeoVim ---
"--------------------------------------------
" {{{
	set shortmess+=I
" }}}
"---------------------------
"--- Flag tab para 2<->4 ---
"---------------------------
" {{{
	let g:tab = 'tab2'
" }}}
"-----------------
"--- Tab 2<->4 ---
"-----------------
" {{{
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
" }}}
"--------------------------------------------------------------------
"---                      Multiple Cursors                        ---
"--- https://github.com/terryma/vim-multiple-cursors#installation ---
"--------------------------------------------------------------------
" {{{
	"let g:multi_cursor_use_default_mapping=0
	"let g:multi_cursor_start_word_key      = '<C-n>'
	"let g:multi_cursor_select_all_word_key = '<A-n>'
	"let g:multi_cursor_start_key           = 'g<C-n>'
	"let g:multi_cursor_select_all_key      = 'g<A-n>'
	"let g:multi_cursor_next_key            = '<C-n>'
	"let g:multi_cursor_prev_key            = '<C-p>'
	"let g:multi_cursor_skip_key            = '<C-x>'
	"let g:multi_cursor_quit_key            = '<Esc>'
" }}}
"------------------------------------------------
"--- Autocompletar html, css, javascript, php ---
"------------------------------------------------
" {{{
	filetype on
	if has('autocmd')
		filetype plugin on
		autocmd FileType * setlocal indentexpr= smartindent
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
	if has("autocmd") && exists("+omnifunc")
		autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
	endif
	setlocal sm
" }}}
"------------------------------------------------
"--- Definindo sintaxe para algumas extenções ---
"------------------------------------------------
" {{{
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
	au BufRead,BufNewFile *.config setfiletype xml
" }}}
"-----------------------------------------------
"--- Numeração de linhas e busca de palavras ---
"-----------------------------------------------
" {{{
	set nu
	set is hls is scs
" }}}
"----------------------------------
"--- Ativa coloração de sintaxe ---
"----------------------------------
" {{{
	syntax on
" }}}
"---------------
"--- Backups ---
"---------------
" {{{
	set nobackup
	set noswapfile
	set nowritebackup
" }}}
"------------------------------------
"--- Identação e quebra de linhas ---
"------------------------------------
" {{{
	set linebreak
	set ci
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set noexpandtab
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
" }}}
"----------------------------------------------------------------
"--- permite indentar bloco de texto selecionado usando 'tab' ---
"--- com guia e "des"indentar usando 'shift + tab'.           ---
"----------------------------------------------------------------
" {{{
	imap <s-tab> <c-o><lt><lt>
	nmap <tab> >>
	nmap <s-tab> <lt><lt>
	vmap <tab> >>
	vmap <s-tab> <lt>
" }}}
"----------------------------------
"--- Atalhos p/ abas 'Ctrl + t' ---
"--- abre uma nova aba.         ---
"----------------------------------
" {{{
	imap <c-t> <esc>:tabnew<cr>
	nmap <c-t> :tabnew<cr>
" }}}
"-------------------------------------------
"--- 'Ctrl+PageUp' pula para próxima aba ---
"-------------------------------------------
" {{{
	imap <c-pageup> <esc>:tabnext<cr>
" }}}
"-----------------------------------------------
"--- 'Ctrl+PageDown' volta para aba anterior ---
"-----------------------------------------------
" {{{
	imap <c-pagedown> <esc>:tabprevious<cr>
" }}}
"-------------------------------------
"--- 'Ctrl+e' fecha a aba corrente ---
"-------------------------------------
" {{{
	imap <c-e> <esc>:tabclose<cr>
" }}}
"-----------------------------------------------------------
"--- Atalhos comuns de teclado                           ---
"--- Permite selecionar com SHIFT + SETA como no Windows ---
"-----------------------------------------------------------
" {{{
	set selectmode=mouse,key
	set mousemodel=popup
	set keymodel=startsel,stopsel
	set selection=exclusive
" }}}
"---------------------------------
"--- Mostra ou não a identacão ---
"---------------------------------
" {{{
	set listchars=tab:¦\ ,trail:·,eol:¬
	set list
	nmap <leader>i :set list!<cr>
" }}}
"--------------------------------------------------
"--- Backspace no modo de visão apaga a seleção ---
"--------------------------------------------------
" {{{
	vmap <bs> d
" }}}
"--------------------
"--- CTRL-S salva ---
"--------------------
" {{{
	nmap <c-s> :update<cr>
	vmap <c-s> <c-c>:update<cr>
	imap <c-s> <c-o>:update<cr>
" }}}
"---------------------------------
"--- Ao salvar remover espaços ---
"--- e tabs de fim de linha.   ---
"---------------------------------
" {{{
	autocmd BufWritePre * :%s/\s\+$//e
" }}}
"---------------------
"--- CTRL-Z desfaz ---
"---------------------
" {{{
	nmap <c-z> u
	vmap <c-z> <c-c>u
	imap <c-z> <c-o>u
" }}}
"--------------------
"--- CTRL-Y refaz ---
"--------------------
" {{{
	nmap <c-y> <c-r>
	vmap <c-y> <c-c><c-r>
	imap <c-y> <c-o><c-r>
" }}}
"---------------------
"--- Fechar Editor ---
"---------------------
" {{{
	nmap <A-q> :qall<cr>
	vmap <A-q> <c-c>:q<cr>
	imap <A-q> <c-o>:q<cr>
" }}}
"------------------------------
"--- CTRL-F4 fecha a janela ---
"------------------------------
" {{{
	nmap <c-F4> <c-w>c
	imap <c-F4> <c-o><c-w>c
	cmap <c-F4> <c-c><c-w>c
	omap <c-F4> <c-c><c-w>c
" }}}
"--------------------------------------------------
"--- Mova para o próximo buffer com <líder> + l ---
"--------------------------------------------------
" {{{
	nmap <leader>l :bnext<cr>
	vmap <leader>l <c-c>:bnext<cr>
" }}}
"---------------------------------------------------
"--- Mova para o buffer anterior com <líder> + j ---
"---------------------------------------------------
" {{{
	nmap <leader>j :bprevious<cr>
	vmap <leader>j <c-c>:bprevious<cr>
" }}}
"---------------------------------------------
"--- Fechar o buffer atual com <líder> + q ---
"---------------------------------------------
" {{{
	nmap <leader>q :bdelete<cr>
	vmap <leader>q <c-c>:bdelete<cr>
" }}}
"----------------------------
"--- Alinhamento de texto ---
"----------------------------
" {{{
	nmap <leader>, :left<cr>
	nmap <leader>. :right<cr>
	nmap <leader>; :center<cr>
" }}}
"-------------
"--- Emmet ---
"-------------
" {{{
	nmap <leader>e <c-y>,
" }}}
"-----------------------------------------------------------------------
"--- Retira os ^M que ficam no final de arquivos salvos pelo windows ---
"-----------------------------------------------------------------------
" {{{
	nmap <leader>m :%s/\r//g<cr>
" }}}
"-----------------------------------------------------------
"--- Remove espaços redundantes no fim das linhas com \s ---
"-----------------------------------------------------------
" {{{
	nmap <leader>s mz:%s/\s\+$//g<cr>`z
" }}}
"--------------------------------
"--- Limpa o buffer de buscas ---
"--------------------------------
" {{{
	nmap <leader>b :let @/=""<cr>
" }}}
"-------------------------------------------
"--- Recarrega o arquivo de configuração ---
"-------------------------------------------
" {{{
	nmap <leader>v :source $MYVIMRC<cr>
" }}}
"----------------------------------------------
"--- Convert <tab> em <spaces> e vice-versa ---
"----------------------------------------------
" {{{
	nmap <leader>[ :set expandtab<cr> :retab<cr>
	nmap <leader>] :%s/\s\{2,}/\t/g<cr>
" }}}
"-----------------------------
"--- Movimentando o cursor ---
"-----------------------------
" {{{
	imap <A-h> <left>
	imap <A-l> <right>
	imap <A-j> <down>
	imap <A-k> <up>
" }}}
"--------------------------------
"--- Habilita auto-indentação ---
"--------------------------------
" {{{
	if has("autocmd")
		filetype plugin on
		autocmd FileType * setlocal indentexpr= smartindent
	endif
" }}}
"--------------------------------------------------
"--- Movimentação de bloco de texto selecionado ---
"--------------------------------------------------
" {{{
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
" }}}
"--------------------------------------------------
"--- Move bloco de texto selecionado para baixo ---
"--------------------------------------------------
" {{{
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
" }}}
"---------------------------------
"--- Duplica um bloco de texto ---
"---------------------------------
" {{{
	function! Duplicate()
		let end=line("'>")
		let start=line("'<")
		let dif=end - start
		exec "'<,'>y"
		exec "normal " . end . "G"
		exec "normal p"
		exec "normal " . (start+dif+1) . "GV" . (end+dif+1) . "G"
	endfunction
" }}}
"------------------------------------------------
"--- Move bloco de texto selecionado pra cima ---
"------------------------------------------------
" {{{
	vmap <c-s-up> :<c-u> call MoveUp()<cr>
" }}}
"-------------------------------------------------
"--- Move bloco de texto selecionado pra baixo ---
"-------------------------------------------------
" {{{
	vmap <c-s-down> :<c-u>call MoveDown()<cr>
" }}}
"--------------------------------------------
"--- Duplica o bloco de texto selecionado ---
"--------------------------------------------
" {{{
	vmap <c-d> :<c-u>call Duplicate()<cr>
" }}}
"-------------------
"--- Abreviações ---
"-------------------
" {{{
	iab a. ª
	iab o. º
	iab no. nº
	iab No. Nº
" }}}
"--------------------------------------------------
"--- Habilitar área de transferência do sistema ---
"--------------------------------------------------
" {{{
	set clipboard=unnamedplus
" }}}
"-------------------------------------------
"--- Modifica o comportamento do menu de ---
"--- auto-completar para se comportar    ---
"--- mais como uma IDE.                  ---
"-------------------------------------------
" {{{
	set completeopt=noinsert,menuone,noselect
" }}}
"---------------------------------------
"--- Destaca a linha atual no editor ---
"---------------------------------------
" {{{
	"set cursorline
" }}}
"----------------------------------
"--- Esconde buffers não usados ---
"----------------------------------
" {{{
	set hidden
" }}}
"---------------------------------------------------
"--- configura o comportamento da divisão da     ---
"--- tela com o comando :split (dividir a tela   ---
"--- horizontalmente) e :vsplit (verticalmente). ---
"--- Neste caso, as telas sempre se dividirão    ---
"--- abaixo da tela atual e à direita.           ---
"---------------------------------------------------
" {{{
	set splitbelow splitright
" }}}
"----------------------------------
"--- Mostra o título do arquivo ---
"----------------------------------
" {{{
	set title
" }}}
"---------------------------------------------------
"--- Tempo e milissegundos para aceitar comandos ---
"---------------------------------------------------
" {{{
	set ttimeoutlen=0
" }}}
"-------------------------------------------------
"--- <Ctrl-X> - cut (goto visual mode and cut) ---
"-------------------------------------------------
" {{{
	imap <C-X> <C-O>vgG
	vmap <C-X> "*x<Esc>i
	nmap <C-X> <c-x> <c-o>
" }}}
"---------------------------------------------------
"--- <Ctrl-C> - copy (goto visual mode and copy) ---
"---------------------------------------------------
" {{{
	imap <C-C> <C-O>vgG
	vmap <C-C> "*y<Esc>i
" }}}
"---------------------------
"--- <Ctrl-A> - copy all ---
"---------------------------
" {{{
	vmap <C-A> <Esc>gggH<C-O>G<Esc>i
" }}}
"------------------------
"--- <Ctrl-V> - paste ---
"------------------------
" {{{
	nm \\paste\\ "=@*.'xy'<CR>gPFx"_2x:echo<CR>
	imap <C-V> x<Esc>\\paste\\"_s
	vmap <C-V> "-cx<Esc>\\paste\\"_x
" }}}
"---------------------------
"--- <Ctrl-A> - copy all ---
"---------------------------
" {{{
	nmap <c-a> gggH<c-o>G
	imap <c-a> <c-o>gg<c-o>gH<c-o>G
	cmap <c-a> <c-c>gggH<c-o>G
	omap <c-a> <c-c>gggH<c-o>G
	smap <c-a> <c-c>gggH<c-o>G
	xmap <c-a> <c-c>ggVG
	map <c-a> <esc>ggvG
" }}}
"-------------------------------------------------------
"--- VIM-PLUG (https://github.com/junegunn/vim-plug) ---
"-------------------------------------------------------
" {{{
	let s:plug_url  = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	let s:plug_dir  = stdpath('data') . '\site\autoload'
	let s:plug_path = s:plug_dir . '\plug.vim'
	if empty(glob(s:plug_path))
		call mkdir(s:plug_dir, 'p')
		execute 'silent !powershell -NoProfile -Command "iwr -useb ' . s:plug_url . ' -OutFile ''' . s:plug_path . '''"'
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
" }}}
"---------------
"--- PLUGINS ---
"---------------
" {{{
	call plug#begin(stdpath('data') . '\plugged')
		Plug 'sheerun/vim-polyglot'
		Plug 'nvim-lualine/lualine.nvim'
		Plug 'nvim-tree/nvim-web-devicons'
		Plug 'lukas-reineke/indent-blankline.nvim'
		Plug 'talha-akram/noctis.nvim'
		Plug 'neovim/nvim-lspconfig'
		Plug 'williamboman/mason.nvim'
		Plug 'williamboman/mason-lspconfig.nvim'
		Plug 'stevearc/conform.nvim'
		Plug 'nvim-tree/nvim-tree.lua'
		Plug 'L3MON4D3/LuaSnip'
		Plug 'rafamadriz/friendly-snippets'
		Plug 'hrsh7th/nvim-cmp'
		Plug 'hrsh7th/cmp-nvim-lsp'
		Plug 'saadparwaiz1/cmp_luasnip'
		Plug 'mattn/emmet-vim'
		Plug 'ap/vim-css-color'
		Plug 'vim-scripts/DrawIt'
	call plug#end()
" }}}
"----------------------------------
"--- Otimizações de performance ---
"----------------------------------
" {{{
	set lazyredraw
	set synmaxcol=200
" }}}
"----------------------------------------------------
"--- Função para trocar o tema de cores           ---
"----------------------------------------------------
" {{{
	silent! colorscheme noctis
	function! ToggleColorscheme()
		if g:colors_name == 'noctis'
			colorscheme noctis_minimus
		elseif g:colors_name == 'noctis_minimus'
			colorscheme noctis_lux
		elseif g:colors_name == 'noctis_lux'
			colorscheme noctis
		endif
		hi LineNr guifg=#ffffff ctermfg=lightCyan
	endfunction
	nmap <silent><leader>/ :call ToggleColorscheme()<cr>:echo g:colors_name<cr>
" }}}
"-----------------------
"--- Nvim-Treesitter ---
"-----------------------
" {{{
	"lua <<EOF
	"require'nvim-treesitter.configs'.setup {
	"    ensure_installed = { "nim" },
	"    highlight = {
	"        enable = true,
	"    },
	"}
	"EOF
" }}}
"--------------
"--- DrawIt ---
"--------------
" {{{
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
"----------------
"--- NVIM-TREE ---
"----------------
" {{{
	lua << EOF
	local ok, nvim_tree = pcall(require, "nvim-tree")
	if ok then
		nvim_tree.setup()
		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
	end
EOF
" }}}
"-----------------
"--- MASON + LSP ---
"-----------------
" {{{
	lua << EOF
	local ok_mason, mason = pcall(require, "mason")
	local ok_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
	if ok_mason then mason.setup() end
	vim.diagnostic.config({ virtual_text = true })
	local on_lsp = function(client, bufnr)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr })
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = bufnr })
	end
	if ok_lspconfig then
		mason_lspconfig.setup({
			ensure_installed = { "ts_ls", "lua_ls", "ruff" },
			automatic_installation = true,
			handlers = {
				function(server_name)
					vim.lsp.config[server_name] = { on_attach = on_lsp }
					vim.lsp.enable(server_name)
				end,
			},
		})
	end
	vim.lsp.config.html = { on_attach = on_lsp }
	vim.lsp.config.cssls = { on_attach = on_lsp }
	pcall(function() vim.lsp.enable("html") end)
	pcall(function() vim.lsp.enable("cssls") end)
EOF
" }}}
"------------------
"--- NVIM-CMP ---
"------------------
" {{{
	lua << EOF
	local ok, cmp = pcall(require, "cmp")
	if ok then
		cmp.setup({
			snippet = {
				expand = function(args)
					local ok_ls, luasnip = pcall(require, "luasnip")
					if ok_ls then luasnip.lsp_expand(args.body) end
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
			mapping = {
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
		})
	end
EOF
" }}}
"------------------
"--- CONFORM ---
"------------------
" {{{
	lua << EOF
	local ok, conform = pcall(require, "conform")
	if ok then
		conform.setup({
			formatters_by_ft = {
				python = { "ruff_format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 3000,
			},
		})
	end
EOF
" }}}
"------------------
"--- LUASNIP ---
"------------------
" {{{
	lua << EOF
	local ok, ls = pcall(require, "luasnip")
	if ok then
		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})
		local ok_vscode, loader = pcall(require, "luasnip.loaders.from_vscode")
		if ok_vscode then loader.lazy_load() end
		vim.keymap.set({"i", "s"}, "<C-l>", function()
			if ls.expand_or_jumpable() then ls.expand_or_jump() end
		end, { silent = true })
		vim.keymap.set({"i", "s"}, "<C-h>", function()
			if ls.jumpable(-1) then ls.jump(-1) end
		end, { silent = true })
	end
EOF
" }}}
"---------------------------
"--- Folding / Unfolding ---
"---------------------------
" {{{
	setlocal foldmethod=indent
	set nofoldenable
	set foldlevel=99
	set fillchars=fold:\ "
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
"--------------------------------
"--- Cor da numeração lateral ---
"--------------------------------
" {{{
	hi LineNr guifg=#ffffff ctermfg=lightCyan
" }}}
"--------------------------
"--- Configuração COBOL ---
"--------------------------
" {{{
	let g:cobol_legacy_code = 0
	function! DetectCobolFormat()
	    let l:first_lines = getline(1, 10)
	    for l:line in l:first_lines
	        if l:line =~? 'FORMAT\s\+FREE'
	            let g:cobol_legacy_code = 0
	            setlocal filetype=cobol
	            return
	        endif
	    endfor
	    let g:cobol_legacy_code = 1
	    setlocal filetype=cobol
	endfunction
	autocmd BufRead,BufNewFile *.cob,*.cbl,*.cpy call DetectCobolFormat()
" }}}
