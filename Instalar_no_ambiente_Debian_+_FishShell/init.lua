--  ---------------------------------------------
--  ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄
--  ▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌
--   ▐░▌           ▐░▌  ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌   ▐░▐░▌
--    ▐░▌         ▐░▌       ▐░▌     ▐░▌▐░▌ ▐░▌▐░▌
--     ▐░▌       ▐░▌        ▐░▌     ▐░▌ ▐░▐░▌ ▐░▌
--      ▐░▌     ▐░▌         ▐░▌     ▐░▌  ▐░▌  ▐░▌
--       ▐░▌   ▐░▌          ▐░▌     ▐░▌   ▀   ▐░▌
--        ▐░▌ ▐░▌           ▐░▌     ▐░▌       ▐░▌
--         ▐░▐░▌        ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌
--          ▐░▌        ▐░░░░░░░░░░░▌▐░▌       ▐░▌
--           ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀
--  ---------------------------------------------
--  File: init.lua
--  Author: Alan Calazans <alancalazans@hotmail.com.br>
--  Created: dom 02 mai 2021
--  Updated: sex 17 jul 2026
--  Installation: Place this file in ~/.config/nvim/
--  or
--  Installation: Place this file in ~\AppData\Local\nvim\
--  License: GNU General Public License v3
--  <http://www.gnu.org/licenses/gpl.html>

--  -----------------------
--  Suporte a cores
--  -----------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"

--  -------------------------------------
--  Suporte ao itálico verdadeiro
--  -------------------------------------
vim.opt.autochdir = false
vim.opt.startofline = false
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.updatetime = 300
vim.opt.scrolloff = 4

--  -----------------------------------------
--  LUALINE - Statusline moderno
--  -----------------------------------------
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showtabline = 2
vim.opt.fillchars:append({ eob = " ", vert = "│" })

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

--  ---------------------------------
--  Indent Blankline (guias)
--  ---------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local ok, ibl = pcall(require, "ibl")
        if ok then
            ibl.setup { scope = { enabled = false } }
        end
    end,
})

--  -------------------------------------------------------
--  Mudar cor da barra de status dependendo do modo
--  -------------------------------------------------------
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.api.nvim_set_hl(0, "StatusLine", { reverse = true, ctermbg = 5 })
    end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.api.nvim_set_hl(0, "StatusLine", { bold = true, reverse = true, ctermfg = 0, ctermbg = 2 })
    end,
})

--  ----------------------------------------------------
--  Permite que o mouse seja utilizado na edição
--  ----------------------------------------------------
vim.opt.mouse = "a"

--  -------------------------------------------------------------
--  Alguns tipos de arquivos devem ser ignorados pelo Vim
--  -------------------------------------------------------------
vim.opt.wildignore = "*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.wmv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~"

--  ----------------
--  Encoding
--  ----------------
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

--  -----------------------------
--  Configuração de fonte
--  -----------------------------
-- vim.opt.guifont = "MonoLisa Medium:h12"

--  ---------------------------------
--  Configura linhas, colunas
--  ---------------------------------
vim.opt.wildmenu = true

--  -----------------------------------------
--  Defina o <space> como tecla líder
--  -----------------------------------------
vim.g.mapleader = " "

--  ------------------------------------------------------
--  Tempo de resposta mais rápido para mapeamentos
--  ------------------------------------------------------
-- vim.opt.timeoutlen = 200
-- vim.opt.ttimeoutlen = 10

--  -------------------------------------------------------------
--  Garante que backspace funcione corretamente no insert
--  -------------------------------------------------------------
vim.opt.backspace = "indent,eol,start"

--  --------------------------------------------
--  Suprime a mensagem inicial do NeoVim
--  --------------------------------------------
vim.opt.shortmess:append("I")

--  ---------------------------
--  Flag tab para 2<->4
--  ---------------------------
vim.g.tab = "tab2"

--  -----------------
--  Tab 2<->4
--  -----------------
local function ToggleTab()
    if vim.g.tab == "tab2" then
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
        vim.g.tab = "tab4"
    else
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.g.tab = "tab2"
    end
end
vim.keymap.set("n", "<leader>g", function()
    ToggleTab()
    print(vim.g.tab)
end, { silent = true })

--  ----------------------------------------------------------------
--  Multiple Cursors
--  ----------------------------------------------------------------
-- vim.g.multi_cursor_use_default_mapping = 0
-- vim.g.multi_cursor_start_word_key      = "<C-n>"
-- vim.g.multi_cursor_select_all_word_key = "<A-n>"
-- vim.g.multi_cursor_start_key           = "g<C-n>"
-- vim.g.multi_cursor_select_all_key      = "g<A-n>"
-- vim.g.multi_cursor_next_key            = "<C-n>"
-- vim.g.multi_cursor_prev_key            = "<C-p>"
-- vim.g.multi_cursor_skip_key            = "<C-x>"
-- vim.g.multi_cursor_quit_key            = "<Esc>"

--  ------------------------------------------------
--  Autocompletar html, css, javascript, php
--  ------------------------------------------------
vim.cmd("filetype on")
vim.cmd("filetype plugin on")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.bo.indentexpr = ""
        vim.bo.smartindent = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    command = "set complete-=k~/.config/nvim/doc/js-list.txt | set complete+=k~/.config/nvim/doc/js-list.txt",
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    command = "set complete-=k~/.config/nvim/doc/php-list.txt | set complete+=k~/.config/nvim/doc/php-list.txt",
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "css",
    command = "set complete-=k~/.config/nvim/doc/css-list.txt | set complete+=k~/.config/nvim/doc/css-list.txt",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "nim",
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zig",
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.softtabstop = 4
        vim.bo.expandtab = true
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "ada",
    callback = function()
        vim.bo.tabstop = 3
        vim.bo.shiftwidth = 3
        vim.bo.softtabstop = 3
        vim.bo.expandtab = true
    end,
})

vim.opt.omnifunc = "syntaxcomplete#Complete"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function() vim.bo.omnifunc = "pythoncomplete#Complete" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function() vim.bo.omnifunc = "javascriptcomplete#CompleteJS" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "xhtml" },
    callback = function() vim.bo.omnifunc = "htmlcomplete#CompleteTags" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "css",
    callback = function() vim.bo.omnifunc = "csscomplete#CompleteCSS" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "xml",
    callback = function() vim.bo.omnifunc = "xmlcomplete#CompleteTags" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function() vim.bo.omnifunc = "phpcomplete#CompletePHP" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function() vim.bo.omnifunc = "ccomplete#Complete" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zig",
    callback = function() vim.bo.omnifunc = "zigcomplete#Complete" end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        if vim.bo.omnifunc == "" then
            vim.bo.omnifunc = "syntaxcomplete#Complete"
        end
    end,
})

vim.opt.showmatch = true

--  ------------------------------------------------
--  Definindo sintaxe para algumas extensões
--  ------------------------------------------------
local filetype_map = {
    phtml = "php",
    ejs = "html",
    ep = "html",
    pl6 = "perl",
    ts = "javascript",
    go = "go",
    exs = "erlang",
    ex = "erlang",
    zig = "zig",
}
for ext, ft in pairs(filetype_map) do
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*." .. ext,
        callback = function() vim.bo.filetype = ft end,
    })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cob", "*.cbl", "*.cpy" },
    callback = function() vim.bo.filetype = "cobol" end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.config",
    callback = function() vim.bo.filetype = "xml" end,
})

--  -----------------------------------------------
--  Numeração de linhas e busca de palavras
--  -----------------------------------------------
vim.opt.number = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true

--  ----------------------------------
--  Ativa coloração de sintaxe
--  ----------------------------------
vim.cmd("syntax on")

--  ---------------
--  Backups
--  ---------------
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

--  ------------------------------------
--  Identação e quebra de linhas
--  ------------------------------------
vim.opt.linebreak = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false

vim.g.status_tab = "tab"
local function ToggleStatusTab()
    if vim.g.status_tab == "tab" then
        vim.opt.expandtab = true
        vim.g.status_tab = "space"
    else
        vim.opt.expandtab = false
        vim.g.status_tab = "tab"
    end
end
vim.keymap.set("n", "<leader>t", function()
    ToggleStatusTab()
    print(vim.g.status_tab)
end, { silent = true })

--  ----------------------------------------------------------------
--  Permite indentar bloco de texto selecionado usando 'tab'
--  ----------------------------------------------------------------
vim.keymap.set("i", "<s-tab>", "<c-o><<")
vim.keymap.set("n", "<tab>", ">>")
vim.keymap.set("n", "<s-tab>", "<<")
vim.keymap.set("v", "<tab>", ">gv")
vim.keymap.set("v", "<s-tab>", "<gv")

--  ----------------------------------
--  Atalhos p/ abas 'Ctrl + t'
--  ----------------------------------
vim.keymap.set("i", "<c-t>", "<esc>:tabnew<cr>")
vim.keymap.set("n", "<c-t>", ":tabnew<cr>")

--  -------------------------------------------
--  'Ctrl+PageUp' pula para próxima aba
--  -------------------------------------------
vim.keymap.set("i", "<c-pageup>", "<esc>:tabnext<cr>")

--  -----------------------------------------------
--  'Ctrl+PageDown' volta para aba anterior
--  -----------------------------------------------
vim.keymap.set("i", "<c-pagedown>", "<esc>:tabprevious<cr>")

--  -------------------------------------
--  'Ctrl+e' fecha a aba corrente
--  -------------------------------------
vim.keymap.set("i", "<c-e>", "<esc>:tabclose<cr>")

--  -----------------------------------------------------------
--  Atalhos comuns de teclado
--  -----------------------------------------------------------
vim.opt.selectmode = "mouse,key"
vim.opt.mousemodel = "popup"
vim.opt.keymodel = "startsel,stopsel"
vim.opt.selection = "exclusive"

--  ---------------------------------
--  Mostra ou não a identação
--  ---------------------------------
-- vim.opt.listchars = "tab:¦ ,trail:·,eol:¬"
-- vim.opt.list = true
-- vim.keymap.set("n", "<leader>i", function() vim.opt.list = not vim.opt.list:get() end)

--  --------------------------------------------------
--  Backspace no modo de visão apaga a seleção
--  --------------------------------------------------
vim.keymap.set("v", "<bs>", "d")

--  --------------------
--  CTRL-S salva
--  --------------------
vim.keymap.set("n", "<c-s>", ":update<cr>")
vim.keymap.set("v", "<c-s>", "<c-c>:update<cr>")
vim.keymap.set("i", "<c-s>", "<c-o>:update<cr>")

--  ---------------------------------
--  Ao salvar remover espaços
--  ---------------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

--  ---------------------
--  CTRL-Z desfaz
--  ---------------------
vim.keymap.set("n", "<c-z>", "u")
vim.keymap.set("v", "<c-z>", "<c-c>u")
vim.keymap.set("i", "<c-z>", "<c-o>u")

--  --------------------
--  CTRL-Y refaz
--  --------------------
vim.keymap.set("n", "<c-y>", "<c-r>")
vim.keymap.set("v", "<c-y>", "<c-c><c-r>")
vim.keymap.set("i", "<c-y>", "<c-o><c-r>")

--  ---------------------
--  Fechar Editor
--  ---------------------
vim.keymap.set("n", "<A-q>", ":qall<cr>")
vim.keymap.set("v", "<A-q>", "<c-c>:q<cr>")
vim.keymap.set("i", "<A-q>", "<c-o>:q<cr>")

--  ------------------------------
--  CTRL-F4 fecha a janela
--  ------------------------------
vim.keymap.set("n", "<c-F4>", "<c-w>c")
vim.keymap.set("i", "<c-F4>", "<c-o><c-w>c")
vim.keymap.set("c", "<c-F4>", "<c-c><c-w>c")
vim.keymap.set("o", "<c-F4>", "<c-c><c-w>c")

--  --------------------------------------------------
--  Mova para o próximo buffer com <líder> + l
--  --------------------------------------------------
vim.keymap.set("n", "<leader>l", ":bnext<cr>")
vim.keymap.set("v", "<leader>l", "<c-c>:bnext<cr>")

--  ---------------------------------------------------
--  Mova para o buffer anterior com <líder> + j
--  ---------------------------------------------------
vim.keymap.set("n", "<leader>j", ":bprevious<cr>")
vim.keymap.set("v", "<leader>j", "<c-c>:bprevious<cr>")

--  ---------------------------------------------
--  Fechar o buffer atual com <líder> + q
--  ---------------------------------------------
vim.keymap.set("n", "<leader>q", ":bdelete<cr>")
vim.keymap.set("v", "<leader>q", "<c-c>:bdelete<cr>")

--  ----------------------------
--  Alinhamento de texto
--  ----------------------------
vim.keymap.set("n", "<leader>,", ":left<cr>")
vim.keymap.set("n", "<leader>.", ":right<cr>")
vim.keymap.set("n", "<leader>;", ":center<cr>")

--  -------------
--  Emmet
--  -------------
vim.keymap.set("n", "<leader>e", "<c-y>,")

--  ---------------------------------------------------------------
--  Retira os ^M que ficam no final de arquivos salvos pelo windows
--  ---------------------------------------------------------------
vim.keymap.set("n", "<leader>m", [[:%s/\r//g<cr>]])

--  -----------------------------------------------------------
--  Remove espaços redundantes no fim das linhas com \s
--  -----------------------------------------------------------
vim.keymap.set("n", "<leader>s", [[mz:%s/\s\+$//g<cr>`z]])

--  --------------------------------
--  Limpa o buffer de buscas
--  --------------------------------
vim.keymap.set("n", "<leader>b", function()
    vim.v.hlsearch = false
    vim.fn.setreg("/", "")
end)

--  -------------------------------------------
--  Recarrega o arquivo de configuração
--  -------------------------------------------
vim.keymap.set("n", "<leader>v", ":source $MYVIMRC<cr>")

--  ----------------------------------------------
--  Convert <tab> em <spaces> e vice-versa
--  ----------------------------------------------
vim.keymap.set("n", "<leader>[", ":set expandtab<cr>:retab<cr>")
vim.keymap.set("n", "<leader>]", [[:%s/\s\{2,}/\t/g<cr>]])

--  -----------------------------
--  Movimentando o cursor
--  -----------------------------
vim.keymap.set("i", "<A-h>", "<left>")
vim.keymap.set("i", "<A-l>", "<right>")
vim.keymap.set("i", "<A-j>", "<down>")
vim.keymap.set("i", "<A-k>", "<up>")

--  --------------------------------
--  Habilita auto-indentação
--  --------------------------------
vim.cmd("filetype plugin on")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.bo.indentexpr = ""
        vim.bo.smartindent = true
    end,
})

--  --------------------------------------------------
--  Movimentação de bloco de texto selecionado
--  --------------------------------------------------
local function MoveUp()
    local start = vim.fn.line("'<")
    local end_ = vim.fn.line("'>")
    if start > 1 then
        vim.cmd("'<,'>d")
        vim.cmd("normal kP" .. (start - 1) .. "GV" .. (end_ - 1) .. "G")
    else
        vim.cmd("normal " .. start .. "GV" .. end_ .. "G")
    end
end

local function MoveDown()
    local start = vim.fn.line("'<")
    local end_ = vim.fn.line("'>")
    if end_ < vim.fn.line("$") - 1 then
        vim.cmd("'<,'>d")
        vim.cmd("normal p" .. (start + 1) .. "GV" .. (end_ + 1) .. "G")
    else
        vim.cmd("normal " .. start .. "GV" .. end_ .. "G")
    end
end

local function Duplicate()
    local start = vim.fn.line("'<")
    local end_ = vim.fn.line("'>")
    local dif = end_ - start
    vim.cmd("'<,'>y")
    vim.cmd("normal " .. end_ .. "Gp" .. (start + dif + 1) .. "GV" .. (end_ + dif + 1) .. "G")
end

vim.keymap.set("v", "<c-s-up>", MoveUp)
vim.keymap.set("v", "<c-s-down>", MoveDown)
vim.keymap.set("v", "<c-d>", Duplicate)

--  -------------------
--  Abreviações
--  -------------------
vim.cmd("iab a. ª")
vim.cmd("iab o. º")
vim.cmd("iab no. nº")
vim.cmd("iab No. Nº")

--  --------------------------------------------------
--  Habilitar área de transferência do sistema
--  --------------------------------------------------
vim.opt.clipboard = "unnamedplus"

--  -------------------------------------------
--  Modifica o comportamento do menu de auto-completar
--  -------------------------------------------
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }

--  ---------------------------------------
--  Destaca a linha atual no editor
--  ---------------------------------------
vim.opt.cursorline = true

--  ----------------------------------
--  Esconde buffers não usados
--  ----------------------------------
vim.opt.hidden = true

--  ---------------------------------------------------
--  Configura o comportamento da divisão da tela
--  ---------------------------------------------------
vim.opt.splitbelow = true
vim.opt.splitright = true

--  ----------------------------------
--  Mostra o título do arquivo
--  ----------------------------------
vim.opt.title = true

--  ---------------------------------------------------
--  Tempo e milissegundos para aceitar comandos
--  ---------------------------------------------------
vim.opt.ttimeoutlen = 0

--  -------------------------------------------------
--  <Ctrl-X> - cut
--  -------------------------------------------------
vim.keymap.set("i", "<C-X>", "<C-O>vgG")
vim.keymap.set("v", "<C-X>", [["*x<Esc>i]])
vim.keymap.set("n", "<C-X>", "<c-x><c-o>")

--  ---------------------------------------------------
--  <Ctrl-C> - copy
--  ---------------------------------------------------
vim.keymap.set("i", "<C-C>", "<C-O>vgG")
vim.keymap.set("v", "<C-C>", [["*y<Esc>i]])

--  ---------------------------
--  <Ctrl-A> - copy all
--  ---------------------------
vim.keymap.set("v", "<C-A>", "<Esc>gggH<C-O>G<Esc>i")

--  --------------------------------------------------
--  <Ctrl-V> - paste
--  --------------------------------------------------
vim.keymap.set("n", "\\paste\\", [["=@*.'xy'<CR>gPFx"_2x:echo<CR>]])
vim.keymap.set("i", "<C-V>", [[x<Esc>\\paste\\"_s]])
vim.keymap.set("v", "<C-V>", [["-cx<Esc>\\paste\\"_x]])

--  -------------------------------------------------------
--  <Ctrl-A> select all (all modes)
--  -------------------------------------------------------
vim.keymap.set("n", "<c-a>", "gggH<c-o>G")
vim.keymap.set("i", "<c-a>", "<c-o>gg<c-o>gH<c-o>G")
vim.keymap.set("c", "<c-a>", "<c-c>gggH<c-o>G")
vim.keymap.set("o", "<c-a>", "<c-c>gggH<c-o>G")
vim.keymap.set("s", "<c-a>", "<c-c>gggH<c-o>G")
vim.keymap.set("x", "<c-a>", "<c-c>ggVG")
vim.keymap.set("", "<c-a>", "<esc>ggvG")

--  -------------------------------------------------------
--  VIM-PLUG
--  -------------------------------------------------------
local plug_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
local plug_dir = vim.fn.stdpath("data") .. "\\site\\autoload"
local plug_path = plug_dir .. "\\plug.vim"
if vim.fn.empty(vim.fn.glob(plug_path)) == 1 then
    vim.fn.mkdir(plug_dir, "p")
    vim.fn.system({ "powershell", "-NoProfile", "-Command", "iwr", "-useb", plug_url, "-OutFile", plug_path })
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            vim.cmd("PlugInstall --sync | source $MYVIMRC")
        end,
    })
end

--  ---------------
--  PLUGINS
--  ---------------
vim.cmd([[call plug#begin(stdpath('data') . '\plugged')]])
vim.cmd([[Plug 'sheerun/vim-polyglot']])
vim.cmd([[Plug 'nvim-lualine/lualine.nvim']])
vim.cmd([[Plug 'nvim-tree/nvim-web-devicons']])
vim.cmd([[Plug 'lukas-reineke/indent-blankline.nvim']])
vim.cmd([[Plug 'talha-akram/noctis.nvim']])
vim.cmd([[Plug 'neovim/nvim-lspconfig']])
vim.cmd([[Plug 'williamboman/mason.nvim']])
vim.cmd([[Plug 'williamboman/mason-lspconfig.nvim']])
vim.cmd([[Plug 'stevearc/conform.nvim']])
vim.cmd([[Plug 'nvim-tree/nvim-tree.lua']])
vim.cmd([[Plug 'L3MON4D3/LuaSnip']])
vim.cmd([[Plug 'rafamadriz/friendly-snippets']])
vim.cmd([[Plug 'hrsh7th/nvim-cmp']])
vim.cmd([[Plug 'hrsh7th/cmp-nvim-lsp']])
vim.cmd([[Plug 'saadparwaiz1/cmp_luasnip']])
vim.cmd([[Plug 'mattn/emmet-vim']])
vim.cmd([[Plug 'ap/vim-css-color']])
vim.cmd([[Plug 'vim-scripts/DrawIt']])
vim.cmd([[call plug#end()]])

--  ----------------------------------
--  Otimizações de performance
--  ----------------------------------
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 200

--  ------------------------------------------
--  Função para trocar o tema de cores
--  ------------------------------------------
local colorscheme_file = vim.fn.stdpath("data") .. "\\nvim-colorscheme.txt"
if vim.fn.filereadable(colorscheme_file) == 1 then
    local last_scheme = vim.fn.readfile(colorscheme_file)[1]
    pcall(vim.cmd, "colorscheme " .. last_scheme)
else
    pcall(vim.cmd, "colorscheme noctis")
end

local function PersistColorscheme()
    vim.fn.writefile({ vim.g.colors_name }, colorscheme_file)
end

local function ToggleColorscheme()
    local name = vim.g.colors_name
    if name == "noctis" then
        vim.cmd("colorscheme noctis_azureus")
    elseif name == "noctis_azureus" then
        vim.cmd("colorscheme noctis_bordo")
    elseif name == "noctis_bordo" then
        vim.cmd("colorscheme noctis_minimus")
    elseif name == "noctis_minimus" then
        vim.cmd("colorscheme noctis_uva")
    elseif name == "noctis_uva" then
        vim.cmd("colorscheme noctis_viola")
    elseif name == "noctis_viola" then
        vim.cmd("colorscheme noctis_lux")
    elseif name == "noctis_lux" then
        vim.cmd("colorscheme noctis_lilac")
    elseif name == "noctis_lilac" then
        vim.cmd("colorscheme noctis_hibernus")
    elseif name == "noctis_hibernus" then
        vim.cmd("colorscheme noctis")
    end
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", ctermfg = "lightCyan" })
    PersistColorscheme()
end
vim.keymap.set("n", "<leader>/", function()
    ToggleColorscheme()
    print(vim.g.colors_name)
end, { silent = true })

--  -----------------------
--  Nvim-Treesitter
--  -----------------------
-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = { "nim" },
--     highlight = { enable = true },
-- }

--  --------------
--  DrawIt
--  --------------
vim.g.di = "stop"
local function ToggleDrawIt()
    if vim.g.di == "stop" then
        vim.cmd("DIstart")
        vim.g.di = "start"
    else
        vim.cmd("DIstop")
        vim.g.di = "stop"
    end
end
vim.keymap.set("n", "<leader>u", function()
    ToggleDrawIt()
    print(vim.g.di)
end, { silent = true })

--  ----------------
--  NVIM-TREE
--  ----------------
pcall(function()
    local ok, nvim_tree = pcall(require, "nvim-tree")
    if ok then
        nvim_tree.setup()
        vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
    end
end)

--  -----------------
--  MASON + LSP
--  -----------------
pcall(function()
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
end)

--  ------------------
--  NVIM-CMP
--  ------------------
pcall(function()
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
end)

--  ------------------
--  CONFORM
--  ------------------
pcall(function()
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
end)

--  ------------------
--  LUASNIP
--  ------------------
pcall(function()
    local ok, ls = pcall(require, "luasnip")
    if ok then
        ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })
        local ok_vscode, loader = pcall(require, "luasnip.loaders.from_vscode")
        if ok_vscode then loader.lazy_load() end
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.expand_or_jumpable() then ls.expand_or_jump() end
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-h>", function()
            if ls.jumpable(-1) then ls.jump(-1) end
        end, { silent = true })
    end
end)

--  ---------------------------
--  Folding / Unfolding
--  ---------------------------
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.fillchars:append({ fold = " " })

function _G.CustomFoldText()
    local indentation = vim.fn.indent(vim.v.foldstart - 1)
    local foldSize = 1 + vim.v.foldend - vim.v.foldstart
    local foldSizeStr = " " .. foldSize .. " lines "
    local foldLevelStr = string.rep("+--", vim.v.foldlevel)
    local expansionString = string.rep(" ", indentation)
    return expansionString .. foldLevelStr .. foldSizeStr
end
vim.o.foldtext = "v:lua.CustomFoldText()"

--  --------------------------------
--  Cor da numeração lateral
--  --------------------------------
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", ctermfg = "lightCyan" })

--  --------------------------
--  Configuração COBOL
--  --------------------------
vim.g.cobol_legacy_code = 0
local function DetectCobolFormat()
    local first_lines = vim.fn.getline(1, 10)
    for _, line in ipairs(first_lines) do
        if line:lower():find("format%s+free") then
            vim.g.cobol_legacy_code = 0
            vim.bo.filetype = "cobol"
            return
        end
    end
    vim.g.cobol_legacy_code = 1
    vim.bo.filetype = "cobol"
end
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cob", "*.cbl", "*.cpy" },
    callback = DetectCobolFormat,
})
