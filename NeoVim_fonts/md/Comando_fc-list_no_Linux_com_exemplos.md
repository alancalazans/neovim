# Comando fc-list no Linux com exemplos

[fonte](https://www.geeksforgeeks.org/fc-list-command-in-linux-with-examples/)

**O comando fc-list** faz parte do sistema *fontconfig* . É usado para listar as fontes e estilos de fonte disponíveis. Usando a opção de formato, a lista de todas as fontes pode ser filtrada e classificada. Além disso, vários parâmetros podem ser passados para ele após um símbolo de dois pontos ( **:** ) para restringir as informações que estão sendo exibidas na tela.

**Sintaxe:**

> fc-list [-vqVh] [-f FORMAT] [–verbose] [–format=FORMAT] [–quiet] [–version] [–help] [pattern] {element …} Listar fontes correspondentes a [pattern]

**Exemplo:** Irá imprimir todas as localizações dos arquivos de fontes presentes no sistema, com seu nome de fonte, espaçamento e tipo de estilo.

```sh
fc-list
```

![img](https://media.geeksforgeeks.org/wp-content/uploads/20190308224906/moose.png)

**Opções:**

- **-v, –verbose:** É usado para mostrar todo o padrão de fonte detalhadamente.
- **-f, –format=FORMAT:** Para usar o formato de saída fornecido.
- **-q, –quiet:** Suprimirá toda a saída normal, sairá 1 se nenhuma fonte corresponder.
- **-V, –version: Mostrará** a versão de configuração da fonte e sairá.
- **-h, –help:** Usado para mostrar a mensagem de ajuda e sair.

**Mais alguns exemplos:**

- fc-list com font-family:

   Imprime apenas os nomes das famílias de fontes, sem exibir os outros detalhes mencionados.

  ```sh
  fc-list : family
  ```

  ![img](https://media.geeksforgeeks.org/wp-content/uploads/20190308225532/moose2.png)

- fc-list com font family + selector de idioma:

   imprimirá apenas os nomes das famílias de fontes que suportam o código de idioma selecionado, sem exibir os outros detalhes mencionados.

  **Nota:** O código do idioma usado aqui é **“ta”** , que significa o idioma **Tamil** .

  ```sh
  fc-list : family lang=ta
  ```

  ![img](https://media.geeksforgeeks.org/wp-content/uploads/20190308230745/moose3.1.png)

  **Nota:** O código do idioma usado aqui é **“hi”** , que significa o idioma **hindi** .

  ```sh
  fc-list : family lang=hi
  ```

  ![img](https://media.geeksforgeeks.org/wp-content/uploads/20190308230931/moose3.2.png)

- fc-list com outros seletores:

   Semelhante ao seletor de família, também podemos selecionar a localização do arquivo, espaçamento e/ou estilo das fontes necessárias a serem exibidas na tela.

  ```sh
  fc-list : family style
  ```

  ![img](https://media.geeksforgeeks.org/wp-content/uploads/20190308232606/moose4.1.png)

  **Nota:** Sorting e unique também podem ser incorporados com este comando

  ```sh
  fc-list : family spacing | sort | uniq
  ```

  ![img](https://media.geeksforgeeks.org/wp-content/uploads/20190308233055/moose4.2.png)

- fc-list com opção de formato:

   Esta opção é usada para formatar o texto de saída para o padrão necessário fornecido pelo usuário. Neste exemplo, a opção de formato é usada para obter os nomes de família de todas as fontes, classificadas e exclusivas.

  ```sh
  fc-list --format="%{family[0]}\n" | sort | uniq
  ```

  ![img](https://media.geeksforgeeks.org/wp-content/uploads/20190308233818/moose5.png)