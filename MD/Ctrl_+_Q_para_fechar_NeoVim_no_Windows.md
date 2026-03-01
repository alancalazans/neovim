# Ctrl + Q para fechar NeoVim no Windows

No Windows, o `Ctrl+Q` é interceptado pelo terminal antes de chegar ao NeoVim. O Windows Terminal e o CMD usam `Ctrl+Q` como controle de fluxo (XON/XOFF), então o NeoVim nunca recebe essa combinação.

### Soluções:

**1. Use uma combinação alternativa:**

Substitua no `init.vim`:

```vim
" ANTES (não funciona no Windows):
nmap <c-q> :qall<cr>
vmap <c-q> <c-c>:q<cr>
imap <c-q> <c-o>:q<cr>

" DEPOIS (alternativas que funcionam):
" Opção A: usar <leader>+q (Espaço + q)
nmap <leader>q :qall<cr>
vmap <leader>q <c-c>:qall<cr>
imap <leader>q <c-o>:qall<cr>

" Opção B: usar Alt+q
nmap <A-q> :qall<cr>
vmap <A-q> <c-c>:qall<cr>
imap <A-q> <c-o>:qall<cr>
```

**2. Se quiser forçar o Ctrl+Q a funcionar:**

No **Windows Terminal**, vá em **Configurações → Ações** e remova ou desative qualquer ação vinculada ao `Ctrl+Q`. Depois adicione no `init.vim`:

```vim
" Desbloqueia Ctrl+Q no NeoVim
silent! !stty -ixon
nmap <c-q> :qall<cr>
vmap <c-q> <c-c>:qall<cr>
imap <c-q> <c-o>:qall<cr>
```

**3. No PowerShell**, execute antes de abrir o NeoVim:

```powershell
# Desativa controle de fluxo XON/XOFF
[Console]::TreatControlCAsInput = $false
```

A opção mais prática é a **Opção A** com `<leader>q`, que já existe no seu script original e funciona em qualquer sistema operacional.
