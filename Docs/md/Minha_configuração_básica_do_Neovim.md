## Minha configuração básica do Neovim

[fonte](https://blog.elvessousa.com.br/en/post/vim-part-3)

Nos últimos artigos, comentei [porque](https://blog.elvessousa.com.br/en/post/vim-part-1) Adotei Neovim como meu editor principal e passei pelo [básico](https://blog.elvessousa.com.br/en/post/vim-part-2) para usar o programa. No entanto, ele não vem com plugins ou boa aparência por padrão. Aqui, eu mostro como montei meu Neovim.

As linguagens de programação que uso no meu dia a dia são JavaScript ( JSX e TypeScript ), CSS, Sass e ultimamente também estou estudando Python. Portanto, minha configuração suporta essas tecnologias.

![Neovim](https://i.imgur.com/9VeS1of.png)*Neovim como está no primeiro lançamento*

### Sobre minhas escolhas para a configuração

Como você pode imaginar, o Neovim é configurado por arquivos de texto.

Existem duas maneiras de configurá-lo: usando o idioma Lua, ou VimScript, criado para o Vim. Aqui vou usar o último, pois funciona para Vim e Neovim. Então eu mato dois coelhos com uma cajadada só.

Não tenho experiência com Lua e, no momento, não tenho planos de aprender o idioma apenas para configurar o aplicativo. Estou ciente de que existem maneiras mais modernas de fazer isso, mas prefiro manter minhas configurações concisas.

No final deste guia, você não terá um emaranhado de arquivos e diretórios, como pode ter visto em outros lugares, mas um único arquivo, apenas o suficiente para uso confortável.

### Definindo opções

Como na maioria dos softwares, existe uma maneira de editar opções e preferências. Estes podem ser testados com o comando `:set <option-name>`. Tente abrir uma instância de Vim / Neovim agora e digite `:set number`, você notará que os números das linhas aparecerão ao lado. O problema é que esses comandos terão que ser repetidos sempre que você reabrir o programa.

### Salvando configurações

Para manter essas configurações salvas, basta gravar esses comandos em um arquivo na pasta do usuário. O nome e o local variam dependendo de você usar Vim ou Neovim:

- **Vim**: `<username>/.vimrc`
- **Neovim**: `<username>/.config/nvim/init.vim`

Se esses arquivos / diretórios não existirem na sua pasta pessoal, basta criá-los manualmente. Lembre-se de que os arquivos começam com "." estão ocultos por padrão nos sistemas Unix ( Linux, BSDs e macOS ). Verifique se você está mostrando arquivos ocultos no seu gerenciador de arquivos ou terminal.

### Opções básicas no arquivo de configuração

Antes de entrarmos em coisas mais complexas, como extensões e suas configurações, vamos nos ater ao básico. Existem muitas opções para mexer, no entanto, as que eu coloco abaixo são as que atualmente uso. Observe que no arquivo haverá os comandos que deverão ser digitados toda vez que o editor for aberto.

```vim
" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2
```

Aqui está a explicação de cada comando acima:

- `background=dark`: aplique o conjunto de cores para telas escuras. Não apenas o plano de fundo da tela, como pode parecer.
- `clipboard=unnamedplus`: permite a área de transferência entre Vim / Neovim e outros aplicativos.
- `cursorline`: destaca a linha atual no editor.
- `completeopt`: modifica o menu de preenchimento automático para se comportar mais como um IDE.
- `hidden`: ocultar buffers não utilizados[1](https://blog.elvessousa.com.br/en/post/vim-part-3#fn-1).
- `inccommand=split`: mostre substituições em uma tela dividida, antes de aplicar ao arquivo.
- `mouse=a`: permite o uso do mouse no editor.
- `number`: mostra números de linha.
- `relativenumber`: mostre os números das linhas a partir do atual. Útil para usar comandos multilines.
- `splitbelow splitright`: altera o comportamento da tela dividida com o comando `:split` ( divida horizontalmente ) e `:vsplit` ( verticalmente ). Nesse caso, as telas sempre se dividirão abaixo da tela atual e à direita.
- `title`: mostrar o título do arquivo
- `ttimeoutlen=0`: tempo em milissegundos para executar comandos.
- `wildmenu`: mostra um menu mais avançado para sugestões de preenchimento automático.
- `expandtab`: transforma guias em espaços.
- `shiftwidth=2`: número de espaços para recuo.
- `tabstop=2`: número de espaços para guias.

### Sintaxe

Para adicionar suporte automático à sintaxe para arquivos abertos:

```vim
filetype plugin indent on
syntax on
```

### Suporte a cores

Para ativar 256 cores no terminal:

```vim
set t_Co=256
```

Abaixo está uma lógica que fiz para o Vim detectar se o sistema suporta um número maior de cores. Observe que eu condicionei a detecção se o emulador de terminal é da Apple. Por alguma razão, as cores se comportam de maneira diferente nas versões que usei.

```vim
" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
	set termguicolors
else
	if $TERM !=? 'xterm-256color'
		set termguicolors
	endif
endif
```

Se você não usar o terminal da Apple, ignore essa parte e adicione o código dentro do `else`.

### Suporte para verdadeiros itálicos

Se você é como eu e gosta de fontes com suporte itálico verdadeiro, adicione estas linhas:

```vim
" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
```

Não me pergunte o que esses códigos significam. Tudo o que sei é que um terminal com suporte itálico os reconhecerá como itálico.

------

### NetRW: gerenciador de arquivos padrão do Vim

*Aviso: Se você já sabe um pouco sobre o Vim e não está interessado no NetRW, pule esta parte.*

![NetRW](https://i.imgur.com/QCh5fZ5.png)*NetRW como é*

Se você já usou um IDE em sua vida, deve ter notado que sempre há uma árvore ao lado dos arquivos do projeto. Vim / Neovim usa NetRW por padrão, o que traz essa mesma função.

Ao abrir Vim ou Neovim usando o `[n]vim .` comando para abrir o diretório do projeto, a listagem de arquivos aparecerá dentro dele. Também pode ser aberto usando o `:Ex` ,`:Vex` ou `:Sex` comandos.

Você pode usá-lo com as configurações padrão, mas pessoalmente, algumas coisas me incomodam, então usei as seguintes configurações:

```vim
" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
```

Aqui está a explicação:

- `g:netrw_banner=0`: oculta o banner superior que aparece por padrão.

- ```text
  g:netrw_liststyle=0
  ```

  : altere a exibição dos arquivos.

  - `0`mostra apenas um diretório de cada vez.
  - `1`mostra dados do arquivo.
  - `2`mostra arquivos em colunas.
  - `3`mostra como uma árvore onde os diretórios abertos são expandidos.

- ```text
  g:netrw_browse_split=4
  ```

  : altera a forma como os arquivos são abertos.

  - `1`abre arquivos em uma divisão horizontal.
  - `2`abre em uma divisão vertical.
  - `3`abre em uma nova guia.
  - `4`abre em uma janela anterior, evitando a criação de mais divisões.

- `g:netrw_altv=1`: alterna a tela NetRW para a esquerda.

- `g:netrw_winsize=25`: limita o tamanho da janela a 25% do espaço disponível na tela.

- `g:netrw_keepdir=0`: mantém o diretório que você acessou anteriormente.

- `g:netrw_localcopydircmd`: modifica o comando usado para copiar arquivos. Por padrão, o NetRW apenas copia pastas vazias. Para alterar isso, defino o comando padrão como `cp -r` para que a cópia ocorra recursivamente.

Para facilitar a criação de arquivos, adicionei mais configurações:

```vim
" Create file without opening buffer
function! CreateInPreview()
  let l:filename = input('please enter filename: ')
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
  redraw!
endfunction

" Netrw: create file using touch instead of opening a buffer
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

augroup auto_commands
	autocmd filetype netrw call Netrw_mappings()
augroup END
```

Isso impede que o NetRW abra uma tela vazia apenas para criar um arquivo.

Se você deseja usar o NetRW, acredito que este é o mínimo necessário para usá-lo confortavelmente.

### NetRW e seus problemas

Existem várias críticas ao NetRW pela maneira como ele causa uma bagunça no buffer. Pelo que pesquisei, parece que usando `g:netrw_liststyle=3` o modo de árvore tende a piorar esse comportamento. Os erros são aleatórios, tornando a correção um processo difícil, e atualizar apenas o NetRW é mais complexo do que deveria.

É por isso que existem várias alternativas ao NetRW, e a mais famosa é o NERDTree, que eu uso na minha configuração principal.

------

## Plugins

![NetRW](https://i.imgur.com/YpJyJnt.png)*Neovim usando os ajustes que fizemos até agora*

### Configuração do gerenciador de plug-ins

Finalmente, é hora de configurar os plugins. Ao contrário do VS Code ou de outros editores, existem várias opções para instaladores de extensão: Neobundle, Vundle, Vim-Plug, etc. Aqui vou usar o último, que parece ser o mais usado hoje em dia. Para instalá-lo, abra um terminal e execute o seguinte comando:

Para Vim:

```bash
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Para Neovim:

```bash
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Esses comandos acima fazem todo o necessário para que o Vim-Plug esteja disponível no seu editor.

### Instalação de plugins

O Vim-Plug lê uma parte do seu arquivo de configuração para encontrar a extensão no Github e instalá-la no editor. Esta parte é delimitada pela seguinte estrutura:

```lisp
call plug#begin()
	Plug '<github-user>/<repo-name>'
call plug#end()
```

Você pode adicionar várias extensões de uma só vez, basta adicionar várias `Plug` como desejado. Existe um site que cataloga esses plugins para facilitar a descoberta, se você quiser visitar. Chama-se Vim Awesome. O link está no final do artigo.

### Plugins que eu uso

Aqui está o que eu uso no meu Vim / Neovim:

```vim
call plug#begin()
	" Appearance
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'

	" Utilities
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'ap/vim-css-color'
	Plug 'preservim/nerdtree'

	" Completion / linters / formatters
	Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
	Plug 'plasticboy/vim-markdown'

	" Git
	Plug 'airblade/vim-gitgutter'
call plug#end()
```

- **Vim Airline**: modifica a barra de status para torná-la mais agradável que a padrão.
- **Vim Devicons**: mostra ícones na interface, com base em fontes de ícones[2](https://blog.elvessousa.com.br/en/post/vim-part-3#fn-2).
- **Vim Polyglot**: destaque da sintaxe para várias linguagens de programação.
- **Pares Automáticos**: fecha automaticamente parênteses, colchetes e suspensórios ao digitar.
- **Vim CSS Color**: mostra cores ( hex, RGB, HSL ) diretamente no código.
- **NERDTree**: barra lateral para acessar os arquivos do projeto. Substitui o NetRW que mencionei anteriormente.
- **CoC ( Conquista de conclusão )**: fornece preenchimento automático, muito semelhante ao disponível no código VS. Vou entrar em detalhes sobre isso mais tarde.
- **Vim Markdown**: melhor suporte para a sintaxe do arquivo Markdown.
- **Vim GitGutter**: Mostra alterações no Git em arquivos abertos.

Escrever essas linhas com endereços não é suficiente para instalar extensões. Primeiro, você deve salvar o arquivo de configuração e reiniciar o Vim para que o editor cumpra as configurações recém-adicionadas. Depois disso, execute o `:PlugInstall` comando.

![Vim Plug](https://i.imgur.com/a3ZXjUJ.png)*Vim Plug*

Uma janela será aberta e mostrará o processo de instalação para cada extensão. Após a instalação, você precisará reiniciar o Vim mais uma vez para usar as novas extensões.

Para desinstalar, remova a linha do plug-in do qual deseja se livrar do arquivo de configuração e, após reiniciar o editor, execute o comando `:PlugClean`.

------

## Esquemas de cores

Se há algo crítico para uma boa experiência de desenvolvimento, é um bom esquema de cores. Eles são instalados da mesma maneira que extensões.

Primeiro, adicione a linha ao caminho do repositório Github do tema:

```vim
call plug#begin()
	Plug 'morhetz/gruvbox'
call plug#end()
```

Para usar o tema, adicione o comando `colorscheme gruvbox` no arquivo de configuração. Isso será suficiente para se livrar da tela preta e das cores fortes que vêm por padrão.

### Esquema de cores que eu uso

![Sobrio e NetRW](https://i.imgur.com/57T9ab6.png)*Sobrio: o tema que uso na minha vida cotidiana*

Apesar de dar o exemplo com o tema GruvBox, este não é o tema que eu uso. Os esquemas de cores são coisas muito subjetivas e, como usei esse tema, acabei ficando um pouco entediado. O mesmo aconteceu com os outros. Como não consegui encontrar um que gostei, fiz o meu. Chama-se Sobrio. Se você quiser testá-lo, basta seguir a mesma receita acima, alterando apenas o repositório:

```vim
call plug#begin()
	Plug 'elvessousa/sobrio'
call plug#end()
```

Então basta adicionar `colorscheme sobrio` e reinicie o editor. Por favor, sinta-se à vontade para deixar seu comentário e sugestão sobre isso. Eu gostaria de saber sua opinião. Se você quiser saber mais sobre isso, o link para o site está no final do artigo.

------

## Configuração de plugins

### Devicons

Devicons é uma extensão que adiciona ícones à interface do Vim. Para funcionar, é necessário ter fontes com suporte a ícones instaladas no sistema.

Procure "Fontes NERD" na internet e você encontrará muitas delas. A maneira de instalar fontes no sistema varia muito, dependendo do sistema operacional, e não entrarei em detalhes aqui. Faça o download, instale e aplique a fonte no seu emulador de terminal. Fora isso, nenhuma outra configuração é necessária.

### Companhia aérea

![Companhia aérea](https://i.imgur.com/8CcRTC2.jpg)

Pouco para montar aqui. Basicamente, está dizendo qual tema usar e se você deseja usar o modo "Linha de força", que são essas linhas com formas de seta.

```vim
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
```

A última opção acima mostra permite a companhia aérea para a barra de guias.

### NERDTree

NERDTree é o substituto do NetRW. Por padrão, funciona bem. Acabei de adicionar uma linha para mostrar arquivos ocultos por padrão.

```vim
" File browser
let NERDTreeShowHidden=1
```

Você sabe, eu gosto de ver `.env` ou `.gitignore` arquivos sem precisar digitar `I` primeiro.

![Sobrio para Vim](https://i.imgur.com/pWiMQB0.png)*Neovim com as configurações que aplicamos até agora*

### CTRLP

Este plug-in permite a pesquisa de arquivos na pasta do seu projeto. É ativado pelo mesmo atalho de teclado que dá seu nome. Se você já usou o VS Code, se acostumará muito rapidamente. A única configuração que fiz foi esta:

```vim
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
```

Colocando a linha acima em inglês simples: o CTRLP ignorará todos os arquivos ou diretórios mencionados dentro do seu projeto `.gitignore` Arquivo.

### Vim Markdown

Se você não usar o Markdown, pule esta parte.

Como uso muito o formato Markdown para escrever no meu blog, instalei esta extensão para melhorar a exibição desse tipo de arquivo no meu Neovim.

```vim
" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']
```

Uso cabeçalhos YAML ( Frontmatter ) na parte superior para que Gatsby faça sua mágica. Sem esse plug-in, a sintaxe do frontmatter e dos blocos de código não é reconhecida.

### Coc: Conquista de Conclusão

Este é o plug-in que requer mais configuração. O Conquer of Completion funciona como um servidor que fornece ferramentas de preenchimento automático e correção de código, funcionando de maneira semelhante ao VS Code. Ele também suporta extensões e elas são responsáveis por adicionar suporte às linguagens de programação desejadas.

A fraqueza do CoC é que ele é baseado no NodeJS, portanto as dependências dos pacotes instalados ocupam uma certa quantidade de espaço em disco, como todos os projetos do Node. Dos que testei até agora, ele atendeu mais às minhas expectativas, com a menor configuração.

Instalar extensões é simples: basta executar o comando `:CocInstall <extension-name>` e os recursos estarão disponíveis para você usar.

Aqui estão as extensões que uso:

- **servidor de coco**: suporte para JavaScript, TypeScript e React.
- **coc-css**: suporte para CSS, Sass e SCSS.
- **coco-estriado**: imprime arquivos JavaScript e TypeScript.
- **coco**: adiciona atalhos para gravar menos em arquivos HTML, CSS, Sass, SCSS e JavaScript estendido ( JSX, TSX )
- **direitos autorais de coco**: Suporte Python.
- **prettier de coco**: formata o código de acordo com padrões bem aceitos na comunidade.

Para instalá-los todos de uma vez, basta executar o comando:

```vim
:CocInstall coc-tsserver coc-css coc-eslint coc-emmet coc-pyright coc-prettier
```

### Mais bonita com mais bonita

```vim
" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
```

O comando acima executará Prettier e formatará o arquivo sempre que você salvar o arquivo. Isso ajuda muito, pois passo menos tempo pressionando `Tab` para o código de recuo.

### Configurações de coco no JSON

Além do `init.vim` ou `.vimrc` usamos até agora, também uso um arquivo separado chamado `coc-settings.json`. Com isso, é possível modificar o comportamento de suas extensões.

```json
{
  "coc.preferences.formatOnSaveFiletypes": [
    "css",
    "sass",
    "scss",
    "markdown",
    "html",
    "json",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "python"
  ],
  "python.formatting.provider": "black",
  "python.formatting.blackPath": "~/.local/bin/black",
  "prettier.singleQuote": true,
  "javascript.autoClosingTags": true,
  "typescript.autoClosingTags": true,
  "emmet.includeLanguages": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html"
  ],
  "codeLens.enable": false
}
```

Aqui está a explicação das configurações acima:

1. Configure o CoC para formatar alguns tipos de arquivo ao salvar.
2. Configure Prettier para preferir aspas simples na formatação.
3. Informe qual código de formato para python, "preto" neste caso, e passou o caminho para o preto no meu sistema.
4. Habilite o fechamento automático de tags JavaScript estendidas ( JSX )
5. Ative o Emmet para mais formatos de arquivo.
6. Desative a lente de código, pois ela travava ocasionalmente.

Observe que, se você não usar o Python, ignore as configurações. Para que o formatador Python funcione, ele deve estar instalado no sistema:

```shell
$ pip install black
```

------

## Atalhos do teclado

Como em outros programas, existe uma maneira de configurar atalhos de teclado. Isso pode ser feito para cada modo de editor. As possibilidades são muitas. Para adicionar um atalho de teclado no Vim, basta adicionar a expressão:

```vim
[first-letter-of-target-mode]noremap <key-or-letters> :Command
```

A palavra estranha `noremap` vem de *"**Não**n **Re**cursivo **Mapa**ping"*, "Mapeamento não recursivo". Isso significa que o atalho criado não substituirá outro atalho semelhante, evitando conflitos.

Como sou um pouco minimalista, não adicionei muitos atalhos.

```vim
" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>
```

Aqui está a explicação dos mapeamentos acima:

- `Ctrl+q`: fecha a tela aberta.
- `F4`: fecha o arquivo aberto.
- `F5`: mostra ou oculta o NERDTree.
- `F6`: abre um terminal em uma janela dividida inferior.
- `Shift+Tab`: mude para a guia anterior.
- `Shift+t`: cria uma guia.
- `Tab`: mude para a próxima guia aberta.

Observe que existem vários `<CR>`. Eles representam todas as vezes que você teria que pressionar `Enter` no modo de comando. **CR** é a abreviação de *"Retorno de carro"*: um termo a partir do momento em que as máquinas de escrever foram usadas. Hoje, entendemos isso como o `Enter` ou `Return` chave.

Todos os atalhos que usei são para o modo normal, portanto `nnoremap` está em todas as linhas. Se fosse para o modo de inserção, seria `inoremap`, `vnoremap` para o modo visual e assim por diante.

### Comandos automáticos

Para automatizar algumas coisas, o Vim permite definir o que chama `autocmd`: comandos automáticos executados em determinados eventos.

```vim
" Auto Commands
augroup auto_commands
	autocmd BufWrite *.py call CocAction('format')
	autocmd FileType scss setlocal iskeyword+=@-@
augroup END
```

Acima, defini duas ações: uma para formatar o código Python ao salvar o arquivo e outra para resolver uma inconsistência que tive com os arquivos SCSS.

------

## Envolver-se

Sem dúvida, este foi o artigo mais longo que eu fiz até agora, mas se você seguiu as instruções, agora tem um editor muito funcional. Existem outros plugins, mas à medida que você se acostuma e cria confiança, você testará outros mais adequados às suas necessidades.

Idealmente, tente manter o arquivo init simples. Muitas extensões podem afetar o desempenho. Uso outras configurações que não detalhei neste artigo, pois elas não são importantes para a maioria dos casos. Estou fornecendo o link para o meu **arquivos de pontos** repositório para você verificar no final deste artigo, se quiser.

Vejo você no próximo artigo!

### Links

- [Meus arquivos pontilhados](https://github.com/elvessousa/.dotfiles)
- [Tema Sobrio](https://sobrio.elvessousa.com.br/)
- [Vim Awesome](https://vimawesome.com/)

------

1. **Buffer:** Um buffer é uma área da memória do Vim usada para armazenar texto lido em um arquivo.[↩](https://blog.elvessousa.com.br/en/post/vim-part-3#fnref-1)
2. **Fontes de ícones:** Uma coleção de ícones vetoriais disponíveis como fonte.[↩](https://blog.elvessousa.com.br/en/post/vim-part-3#fnref-2)