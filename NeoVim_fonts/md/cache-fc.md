# cache-fc

## construir arquivos de cache de informações de fonte

## [Resumo](https://linuxcommandlibrary.com/man/fc-cache#tldr)

**Gerar arquivos de cache de fontes**

```nim
$ fc-cache
```

**Forçar uma reconstrução de todos os arquivos de cache de fontes, sem verificar se o cache está atualizado**

```nim
$ fc-cache -f
```

**Apagar arquivos de cache de fontes e, em seguida, gerar novos arquivos de cache de fontes**

```nim
$ fc-cache -r
```

## SINOPSE

**fc-cache** [ **-EfrsvVh** ] [ **--error-on-no-fonts** ] [ **--force** ] [ **--really-force** ] [ **-y** *dir* | **--sysroot** *dir* ] [ **--system-only** ] [ **--verbose** ] [ **--version** ] [ **--help** ] [ *dir ...* ]

## DESCRIÇÃO

**fc-cache** verifica os diretórios de fontes no sistema e cria arquivos de cache de informações de fontes para aplicativos que usam fontconfig para seu manuseio de fontes.

Se argumentos de diretório não forem fornecidos, **o fc-cache** usa cada diretório na configuração de fonte atual. Cada diretório é escaneado para arquivos de fonte legíveis pelo FreeType. Um cache é criado contendo propriedades de cada fonte e o nome de arquivo associado. Esse cache é usado para acelerar a inicialização do aplicativo ao usar a biblioteca fontconfig.

Observe que **o fc-cache** deve ser executado uma vez por arquitetura para gerar informações de fonte personalizadas para essa arquitetura.

## OPÇÕES

Este programa segue a sintaxe usual de linha de comando GNU, com opções longas começando com dois traços (`-'). Um resumo das opções está incluído abaixo.

- **-E --erro-em-nenhuma-fonte**

  Gera um erro se não houver fontes no *diretório* ou diretórios na configuração, caso não seja fornecido.

- **-f --força**

  Força a regeneração de arquivos de cache aparentemente atualizados, substituindo a verificação de registro de data e hora.

- **-r --realmente-força**

  Apague todos os arquivos de cache existentes e faça uma nova verificação.

- **-s --somente-sistema**

  Verifique apenas diretórios de todo o sistema, omitindo os locais localizados no diretório inicial do usuário.

- **-v --verboso**

  Exibir informações de status quando ocupado.

- **-y -sysroot** *diretório*

  Adicione *dir* a todos os caminhos para digitalização.

- **-h --ajuda**

  Mostrar resumo das opções.

- **-V --versão**

  Mostrar versão do programa e sair.

- *dir*

  Diretório para procurar fontes.

## CÓDIGOS DE RETORNO

**fc-cache** retorna zero se os caches forem gerados com sucesso. Caso contrário, retorna zero.

## ARQUIVOS

- *%cachedir%/\*-%arch%.cache-%version%*

  Esses arquivos são gerados pelo **fc-cache** e contêm mapas de nomes de arquivo para propriedades de fonte. Eles são lidos pela biblioteca fontconfig na inicialização do aplicativo para localizar fontes apropriadas.