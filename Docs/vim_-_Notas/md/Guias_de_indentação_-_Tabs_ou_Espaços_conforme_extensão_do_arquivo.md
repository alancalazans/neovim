# Guias de indentação - Tabs ou Espaços conforme extensão do arquivo

Geralmente o comando `retab` e a opção `expandtab`  pode realizar esta troca sem plugins. Faça `:set expandtab` para que o vim preferira espaços a tabs, `:set noexpandtab` para que preferira tabs a espaços. Usar `:retab!` para alternar um arquivo inteiro para o que você definiu.

Exemplo:

```lisp
autocmd FileType nim :set expandtab
```

