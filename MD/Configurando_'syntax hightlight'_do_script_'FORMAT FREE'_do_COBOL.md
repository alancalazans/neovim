# Configurando 'syntax hightlight' do script 'FORMAT FREE' do COBOL

O problema é que o NeoVim está reconhecendo o arquivo como COBOL no formato fixo (colunas 1-6 reservadas), mas você está usando **FORMAT FREE**. No formato fixo, o syntax highlight espera que o código comece na coluna 7+, por isso as cores ficam erradas.

### Solução:

Adicione estas linhas no seu `init.vim`:

```vim
"-------------------------------
"--- COBOL FORMAT FREE {{{ ---
"-------------------------------
let g:cobol_legacy_code = 0  " 0 = Formato Livre, 1 = Formato Fixo

" Detecta automaticamente FORMAT FREE no arquivo
autocmd BufRead,BufNewFile *.cob,*.cbl,*.cpy call DetectCobolFormat()

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
"--- }}}
```

### Se o highlight continuar errado:

O plugin de syntax padrão do COBOL pode não suportar bem o formato livre. Nesse caso, crie um arquivo de syntax customizado:

**1. Crie o diretório:**

```powershell
mkdir $env:LOCALAPPDATA\nvim\after\syntax -Force
```

**2. Crie o arquivo** `$env:LOCALAPPDATA\nvim\after\syntax\cobol.vim`:

```vim
" Limpa syntax anterior se formato livre
if exists("g:cobol_legacy_code") && g:cobol_legacy_code == 0
    syntax clear

    " Palavras-chave principais
    syntax keyword cobolDivision IDENTIFICATION ENVIRONMENT DATA PROCEDURE DIVISION
    syntax keyword cobolSection SECTION WORKING-STORAGE LINKAGE FILE LOCAL-STORAGE
    syntax keyword cobolParagraph PROGRAM-ID AUTHOR DATE-WRITTEN

    " Verbos
    syntax keyword cobolVerb ACCEPT ADD ALTER CALL CANCEL CLOSE COMPUTE
    syntax keyword cobolVerb CONTINUE DELETE DISPLAY DIVIDE EVALUATE
    syntax keyword cobolVerb EXIT GO GOBACK IF ELSE END-IF
    syntax keyword cobolVerb INITIALIZE INSPECT MOVE MULTIPLY OPEN
    syntax keyword cobolVerb PERFORM READ RELEASE RETURN REWRITE
    syntax keyword cobolVerb SEARCH SET SORT START STOP STRING
    syntax keyword cobolVerb SUBTRACT UNSTRING WRITE STOP RUN

    " Diretivas do compilador
    syntax keyword cobolDirective SOURCE FORMAT FREE FIXED
    syntax match cobolDirective />>.\+/

    " Tipos e níveis
    syntax keyword cobolLevel 01 02 03 04 05 10 15 20 25 30 35 40 45 50 55 60 65 70 75 77 88
    syntax keyword cobolType PIC PICTURE VALUE VALUES OCCURS REDEFINES
    syntax keyword cobolType BINARY-LONG BINARY-SHORT BINARY-DOUBLE
    syntax keyword cobolType COMP COMP-1 COMP-2 COMP-3 COMP-5

    " Strings
    syntax region cobolString start=/"/ end=/"/
    syntax region cobolString start=/'/ end=/'/

    " Comentários (formato livre: começa com *>)
    syntax match cobolComment /\*>.*$/

    " Literais numéricos
    syntax match cobolNumber /\<[0-9]\+\>/
    syntax match cobolNumber /\<[0-9]\+\.[0-9]\+\>/

    " Pontuação COBOL
    syntax match cobolPeriod /\.\s*$/

    " Cores
    highlight link cobolDivision Keyword
    highlight link cobolSection Type
    highlight link cobolParagraph Identifier
    highlight link cobolVerb Statement
    highlight link cobolDirective PreProc
    highlight link cobolLevel Number
    highlight link cobolType Type
    highlight link cobolString String
    highlight link cobolComment Comment
    highlight link cobolNumber Number
    highlight link cobolPeriod Delimiter
endif
```

**3. Reinicie o NeoVim.**

O resultado deve mostrar o highlight correto com as palavras-chave, verbos, strings e comentários coloridos adequadamente no formato livre.

### Alternativa com Treesitter:

Se você tiver o Treesitter configurado, pode tentar instalar o parser de COBOL:

```vim
:TSInstall cobol
```

O Treesitter faz o parsing real do código e tende a funcionar melhor com formato livre.
