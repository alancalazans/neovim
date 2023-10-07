# Como instalar, atualizar e desinstalar fontes manualmente no Linux

[fonte](https://medium.com/source-words/how-to-manually-install-update-and-uninstall-fonts-on-linux-a8d09a3853b0)

O gerenciamento de fontes que não são empacotadas em distribuições Linux pode ser realizado com algumas tarefas de linha de comando. Embora isso exija um pouco mais de esforço do que o gerenciamento de fontes com um gerenciador de fontes GUI ou aplicativo gerenciador de pacotes, as etapas são simples e entendê-las permitirá que você instale e use as muitas fontes não empacotadas disponíveis no mercado.

Este artigo demonstra uma abordagem de linha de comando para instalar fontes de desktop (ou seja, as variedades de compilação *.otf e *.ttf), limpar e regenerar o cache de fontes e verificar a instalação de fontes. Eu forneço um exemplo de script de shell que reúne todas as etapas em um único comando para aqueles que desejam usá-lo como base para um script personalizado de instalação + atualização. Na seção final, demonstro como localizar e desinstalar fontes desnecessárias.

Usaremos nossas [fontes Hack](https://github.com/source-foundry/Hack) conforme lançadas em formato binário de fontes por meio de um repositório Github para demonstrar todo o processo. Essas etapas pressupõem que os arquivos de fonte são acessíveis por meio de solicitações HTTP GET e vêm empacotados em um arquivo tar compactado em gzip. Sinta-se à vontade para modificar os caminhos em cada etapa para instalar qualquer conjunto de fontes que atenda a esses critérios.

## Instale fontes no Linux

### Etapa 1: Extraia as fontes para o seu sistema

Para extrair um arquivo de fontes de um servidor acessível publicamente com uma solicitação HTTP GET, navegue até um diretório de sua escolha e use [cURL](https://curl.haxx.se/) :

```sh
$ curl -L -O https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz
```

### Passo 2: Descompacte o arquivo de fontes

Descompacte o arquivo tar compactado com `tar`:

```sh
$ tar -xzvf Hack-v3.003-ttf.tar.gz
```

Para as fontes Hack, isso resulta em um caminho de diretório descompactado, `ttf`. As fontes estão contidas na raiz do diretório. Arquivos de outros projetos de fontes podem resultar em uma estrutura de caminho descompactada diferente. Se você estiver instalando um conjunto diferente de fontes, revise os caminhos das fontes antes de passar para a próxima etapa.

### Passo 3: Instale as fontes

Em sistemas Linux, os binários de fontes geralmente são instalados no diretório de fontes do sistema no caminho `/usr/share/fonts/`ou em um diretório de fontes do usuário que geralmente está em um dos seguintes caminhos: `~/.local/share/fonts/`ou `/usr/local/share/fonts`. Usaremos o `~/.local/share/fonts/`caminho neste exemplo. Se o diretório não existir, crie-o com o seguinte comando:

```sh
$ mkdir ~/.local/share/fonts
```

Mova seus binários de fontes para o diretório de destino com `mv`:

```sh
$ mv ttf/Hack-Regular.ttf ~/.local/share/fonts/Hack-Regular.ttf 
$ mv ttf/Hack-Italic.ttf ~/.local/share/fonts/Hack-Italic.ttf 
$ mv ttf/ Hack-Bold.ttf ~/.local/share/fonts/Hack-Bold.ttf 
$ mv ttf/Hack-BoldItalic.ttf ~/.local/share/fonts/Hack-BoldItalic.ttf
```

### Passo 4: Limpe e regenere seu cache de fontes

Em seguida, limpe e gere novamente o cache de fontes com o seguinte comando:

```sh
$ fc-cache -f -v
```

Você verá um fluxo de texto conforme o cache de fontes é criado. Este pode ser um texto extenso se você tiver um grande número de fontes instaladas em seu sistema. Se você examinar o texto com atenção, verá que suas novas instalações de fontes foram identificadas durante esse processo.

### Passo 5: Verifique a instalação

Confirme se as fontes estão instaladas exibindo os caminhos e definições de estilo com o `fc-list`executável filtrado no nome da família de fontes com `grep`:

```sh
$ lista fc | grep "Hackear"
```

No meu sistema, o seguinte texto é exibido:

```sh
/home/chris/.local/share/fonts/Hack-BoldItalic.ttf: Hack:style=Bold Italic 
/home/chris/.local/share/fonts/Hack-Italic.ttf: Hack:style=Italic 
/home/ chris/.local/share/fonts/Hack-Bold.ttf: Hack:style=Bold 
/home/chris/.local/share/fonts/Hack-Regular.ttf: Hack:style=Regular
```

As fontes agora estão instaladas e prontas para uso.

### Etapa 6: Limpeza

O arquivo compactado e o diretório descompactado não são mais necessários. Vamos removê-los:

```sh
$ rm -rf ttf && rm Hack-v3.003-ttf.tar.gz
```

## Todos juntos agora

Fornecemos [um script de shell para instalações de fontes Hack](https://github.com/source-foundry/hack-linux-installer) que reúne essas etapas em um único comando para nossos usuários Linux.

O comando para instalar manualmente a versão 3.003 de nossas fontes é assim:

```sh
$ ./hack-linux-installer.sh v3.003
```

Para atualizar as fontes, os usuários incrementam o número da versão no comando à medida que novas versões são enviadas para o repositório Github.

Segue uma visão geral do Github da fonte do script. Se você seguiu o procedimento acima, notará que os comandos são idênticos aos exemplos das etapas que acabamos de revisar.

- O passo 1 está na linha 42
- A etapa 2 está na linha 47
- A etapa 3 está nas linhas 61–71
- A etapa 4 está na linha 81
- A etapa 5 está na linha 85
- A etapa 6 está nas linhas 58 e 75

```bash
#!/bin/sh

# /////////////////////////////////////////////////////////////////
#
# hack-linux-installer.sh
#  A shell script that installs the Hack fonts from repository
#  releases by release version number
#
#  Copyright 2018 Christopher Simpkins
#  MIT License
#
#  Usage: ./hack-linux-installer.sh [VERSION]
#         Format the version number as vX.XXX
#
# /////////////////////////////////////////////////////////////////

HACK_INSTALL_PATH="$HOME/.local/share/fonts"

if [ $# -ne 1 ]; then
    echo "Please include a version number argument formatted as vX.XXX"
    exit 1
fi

if [ "$1" = "--help" ]; then
    echo "Usage: ./hack-linux-installer [VERSION]"
    echo "Format [VERSION] as vX.XXX for the desired release version of the fonts."
    exit 0
fi

if [ ! -d "$HACK_INSTALL_PATH" ]; then
    echo "Unable to detect the install directory path '$HACK_INSTALL_PATH'.  Please create this path and execute the script again."
    exit 1
fi

HACK_VERSION="$1"
HACK_DL_URL="https://github.com/source-foundry/Hack/releases/download/$HACK_VERSION/Hack-$HACK_VERSION-ttf.tar.gz"
HACK_ARCHIVE_PATH="Hack-$HACK_VERSION-ttf.tar.gz"

# pull user requested fonts from the Hack repository releases & unpack
echo " "
echo "Pulling Hack $HACK_VERSION fonts from the Github repository release..."
curl -L -O "$HACK_DL_URL"

echo " "
echo "Unpacking the font files..."
if [ -f "$HACK_ARCHIVE_PATH" ]; then
    tar -xzvf "$HACK_ARCHIVE_PATH"
else
    echo "Unable to find the pulled archive file.  Install failed."
    exit 1
fi

# install
if [ -d "ttf" ]; then
    echo " "
    echo "Installing the Hack fonts..."
    # clean up archive file
    rm "$HACK_ARCHIVE_PATH"

    # move fonts to install directory
    echo "Installing Hack-Regular.ttf on path $HACK_INSTALL_PATH/Hack-Regular.ttf"
    mv ttf/Hack-Regular.ttf "$HACK_INSTALL_PATH/Hack-Regular.ttf"

    echo "Installing Hack-Italic.ttf on path $HACK_INSTALL_PATH/Hack-Italic.ttf"
    mv ttf/Hack-Italic.ttf "$HACK_INSTALL_PATH/Hack-Italic.ttf"

    echo "Installing Hack-Bold.ttf on path $HACK_INSTALL_PATH/Hack-Bold.ttf"
    mv ttf/Hack-Bold.ttf "$HACK_INSTALL_PATH/Hack-Bold.ttf"

    echo "Installing Hack-BoldItalic.ttf on path $HACK_INSTALL_PATH/Hack-BoldItalic.ttf"
    mv ttf/Hack-BoldItalic.ttf "$HACK_INSTALL_PATH/Hack-BoldItalic.ttf"

    echo " "
    echo "Cleaning up..."
    rm -rf ttf

    # clear and regenerate font cache
    echo " "
    echo "Clearing and regenerating the font cache.  You will see a stream of text as this occurs..."
    echo " "
    fc-cache -f -v

    echo " "
    echo "Testing. You should see the expected install filepaths in the output below..."
    fc-list | grep "Hack"

    echo " "
    echo "Install of Hack $HACK_VERSION complete."
    exit 0
else
    echo "Unable to identify the unpacked font directory. Install failed."
    exit 1
fi
```

## Desinstalar fontes no Linux

O processo de desinstalação de fontes requer identificação dos caminhos de instalação, remoção dos binários de fontes e regeneração do cache de fontes. A etapa de remoção de fonte é a única tarefa nova que você precisa aprender se executou as etapas de instalação na seção acima. *Esteja ciente de que a remoção de binários de fontes com* `*rm*`*etapa elimina os arquivos permanentemente. Considere fazer backups se eles não estiverem facilmente acessíveis no futuro e você precisar deles novamente!*

### Etapa 1: Identifique os caminhos binários da fonte

Use o `fc-list`executável com `grep`para identificar os caminhos para as fontes instaladas por nome de família:

```sh
$ lista fc | grep "Hackear"
```

Modifique o termo de pesquisa grep para identificar outras famílias de fontes.

### Etapa 2: remover os binários de fontes

Use o `rm`executável para remover os binários de fontes instalados nos caminhos identificados com o comando na Etapa 1. *Isso exclui permanentemente os arquivos. Tenha cuidado (e faça backup em algum lugar!) Se os arquivos não estiverem facilmente acessíveis caso você precise deles novamente.*

Se você usou as etapas de instalação acima para instalar as fontes Hack, o seguinte comando removerá as fontes:

```sh
$ rm "$HOME/.local/share/fonts/Hack-*.ttf"
```

### Etapa 3: limpar e regenerar o cache de fontes

Em seguida, gere novamente seu cache de fontes:

```sh
$ fc-cache
```

E isso é uma viagem de ida e volta de gerenciamento manual de fontes na linha de comando do Linux. Aproveite as muitas novas opções de fontes disponíveis em sua caixa Linux!

Gostaria de agradecer [a Paride Legovini](https://github.com/paride) por sua revisão técnica e feedback sobre este artigo. Sua contribuição foi muito útil e melhorou o tutorial.

Seu feedback é extremamente útil para nós. Se você identificar algum erro ou tiver sugestões de melhorias na abordagem usada neste artigo, [envie um novo relatório de problema em nosso repositório no Github](https://github.com/source-foundry/hack-linux-installer/issues).