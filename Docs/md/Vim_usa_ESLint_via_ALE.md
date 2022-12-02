# Vim usa ESLint via ALE

[fonte](https://rderik.com/blog/vim-use-eslint-via-ale/)

Por que [ALE](https://github.com/w0rp/ale) e não [Syntastic](https://github.com/vim-syntastic/syntastic) ? apenas preferência pessoal, o ALE parece tirar proveito do assíncrono no Vim 8, exatamente isso.

O que precisaríamos:

- Instalar - ESLint
- Tenha um gerenciador de plugins Vim, eu prefiro e uso [Plug](https://github.com/junegunn/vim-plug)
- Instalar - ALE

Etapa 1.

A instalação do ESLint é muito direta usando [NPM ](https://www.npmjs.com/) em geral, apenas ( isso o instalará no diretório atual, se você quiser usar o sinalizador -g global, você deve ter inicializado seu npm no projeto atual `npm init` antes de executar este comando ):

```shell
$ npm install eslint --save-dev
```

Inicialize sua instalação do ESLint:

```shell
$ ./node_modules/.bin/eslint --init 
```

Responda às perguntas e você estará pronto para usar o ESLint em seus arquivos. por exemplo:

```shell
$ ./node_modules/.bin/eslint map.js 
```

Etapa 2. Configure suas regras de Lint, um simples eslintrc: ficaria assim ( salve este arquivo como .eslintrc.js ):

```js
module.exports = {
  "env": {
    "es6": true
  },
  "rules": {
    "quotes": ["error","double"]
  }
};
```

Isso define o env para usar es6 e define apenas uma regra para marcar como um erro se as aspas não forem aspas duplas no código.

Para mais regras e configurações para ESLint, verifique suas [documentação](http://eslint.org/docs/user-guide/configuring)

Etapa 3. Instalando o plug-in ALE, adicione ao seu vimrc:

```sh
Plug 'w0rp/ale'
```

Salve seu vimrc e execute:

```lisp
:source %
:PlugInstall
```

Agora, para configurar os revestimentos que você deseja que o plug-in seja executado, adicione as seguintes linhas ao seu vimrc, apenas adicionarei JavaScript:

```lisp
" Linter configuration
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1
```

Faça a sua fonte para aplicar as alterações na instância atual da vim ( ou saia e reabra a vim ).

```lisp
:source %
```

E agora você está pronto para executar o lint em seus arquivos do vim.

Aproveitar.

PS. O objetivo principal do uso do ALE era usar a parte assíncrona do acrônimo ( ALE-Asynchronous Lint Engine ), mas se você deseja apenas executar o fiapo sob demanda, pode definir o ALE para executar apenas sob demanda. Adicione isso ao seu vimrc:

```lisp
" This flag can be set to 0 to disable linting when the buffer is entered.
let g:ale_lint_on_enter = 0
```

E então você pode alternar para ativar / desativar Ale

```lisp
 :ALEToggle
```

** Se você quiser verificar o que mais estou fazendo no momento, siga-me no twitter [@rderik](https://twitter.com/rderik) ou assine o boletim. Se você quiser me enviar uma mensagem direta, pode enviá-la para [derik@rderik.com](mailto:derik@rderik.com).