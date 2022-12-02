# Use `Ctrl-c`, `Ctrl-v` e `Ctrl-x`

Para obter o método mais 'usual' e intuitivo de copiar e colar com `Ctrl-c`, `Ctrl-x` e `Ctrl-v`, copie o seguinte para o seu .vimrc:

```lisp
"-------------------------------------------
" Paste system clipboard with Ctrl + v
inoremap <C-v> <ESC>"+gPi    
"nnoremap <C-v> "+gP<ESC>
vnoremap <C-v> d"+gP<ESC>
cnoremap <C-v> <C-r>+
"-------------------------------------------
" Cut to system clipboard with Ctrl + x
vnoremap <C-x> "+d
"nnoremap <C-x> "+dd
inoremap <C-x> <ESC>"+ddi
"-------------------------------------------
" Copy to system clipboard with Ctr + c
vnoremap <C-c> "+y
nnoremap <C-c> "+yy
inoremap <C-c> <ESC>"+yyi
```

O que acontece aqui é:

1. Cole a área de transferência do sistema com `Ctrl-v`:
   A) inoremap <C-v> <ESC>"+gPi - modo de inserção: colar após o cursor, colocar o cursor no final da colagem, permanecer no modo de inserção
   B) nnoremap <C-v> "+gP<ESC> - modo normal: igual ao modo de inserção, permanece no modo normal.
   Observação: isso substitui o atalho padrão para o modo Bloqueio visual, portanto, esteja ciente disso se ativá-lo.
   C) vnoremap <C-v> d"+gP<ESC> - modo visual: substitui a seleção pelo conteúdo da área de transferência
   D) cnoremap <C-v> <C-r>+ - modo de comando (quando você pressiona:): cola o conteúdo da área de transferência

2. Corte para a área de transferência do sistema com `Ctrl-x`:
   A) vnoremap <C-x> "+d - modo visual: corte a seleção para a área de transferência do sistema
   B) nnoremap <C-x> "+dd - modo normal: corta a linha atual para a área de transferência.
   Nota: Isso substitui o atalho para o modo Conclusão, portanto, novamente, fique atento.
   C) inoremap <C-x> <ESC>"+ddi - modo de inserção: igual ao modo normal, mas permanece no modo de inserção

3. Copie para a área de transferência do sistema com `Ctrl-c`:
   Nota: <C-c> é comumente usado como quase equivalente a <Esc>, que é o comportamento padrão. Esteja ciente disso. (Eu pessoalmente uso <CapsLock> como <Esc> em todo o sistema.)
   A) vnoremap <C-c> "+y - modo visual: copiar a seleção para a área de transferência do sistema
   B) nnoremap <C-c> "+yy - modo normal: copia a linha atual para a área de transferência
   C) inoremap <C-c> <ESC>"+yyi - modo de inserção: igual ao modo normal, mas permanece no modo de inserção