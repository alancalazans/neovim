# Como desenhar diagramas ASCII com Vim DrawIt

## 1. Desenho

Em essência, **DrawIt nos permite deixar um rastro de linhas enquanto navegamos no texto** . Depois de criado, não há uma maneira fácil de realocar os componentes do diagrama em um ambiente baseado em texto. Por isso, é melhor começar a desenhar com um rascunho preparado com antecedência.

Em particular, **após ativar o DrawIt, navegamos no texto como normalmente faríamos no Vim** . Ao fazer isso, desenhamos uma linha ao longo do caminho do cursor. A área de texto se expandirá automaticamente nas direções superior, direita e inferior, criando mais espaço para desenho.

**Os pontos onde uma linha muda de direção ou cruza outra linha são automaticamente marcados com um símbolo especial** , facilitando o desenho de caixas claramente marcadas. Usando as teclas *>* , *<* , *^* , *v* no final de uma linha podemos desenhar uma seta:

![Demonstração de desenho DrawIt](https://www.baeldung.com/wp-content/uploads/sites/2/2023/08/drawit-drawing.gif)

Para desenhar linhas diagonais, podemos usar várias teclas:

- *PageUp* para mover para cima e para a direita
- *PageDown* para mover para baixo à direita
- *Início* para mover para cima e para a esquerda
- *Fim* para mover para baixo à esquerda

**As linhas diagonais também são marcadas ao cruzar** . No entanto, não há marcação automática para pontos onde uma linha diagonal muda de direção ou cruza uma linha vertical ou horizontal. Então, podemos querer adicionar um símbolo manualmente para uma aparência mais organizada:

![Diagrama DrawIt](https://www.baeldung.com/wp-content/uploads/sites/2/2023/08/drawit-diagram-1.png)

Em geral, além do desenho básico, alterar o conjunto de caracteres utilizado para o desenho é uma das principais funções do DrawIt.

## 2. Mudando os personagens

Como isso desempenha um grande papel no estilo final, **os caracteres do diagrama que vemos ao desenhar são configuráveis** . Para alterá-los, usamos a chamada da função *SetDrawIt() no modo Comando:*

```bash
:call SetDrawIt('|','-','+','\','/','X','*')
cópia de
```

Na ordem dada, os argumentos definem diferentes componentes do diagrama:

- Linha vertical
- linha horizontal
- cruzamento vertical-horizontal
- linha diagonal inferior direita
- linha diagonal superior esquerda
- cruzamento diagonal
- borda elipse

Os caracteres no trecho de código são os valores padrão.

## 3. Edição de texto e correção de erros

DrawIt funciona no modo substituir-inserir. Isso significa que substituímos os caracteres à medida que os passamos. Por isso, para manter o texto intacto durante o desenho, devemos navegar com cuidado.

O inverso também é verdadeiro: **editar o texto pode arruinar os diagramas, por isso é melhor usar o modo substituir-inserir em vez do modo inserir** . Podemos ativar o primeiro no modo Comando usando a tecla *R.*

Para corrigir erros ou remover texto indesejado durante o desenho, podemos usar o modo apagar. **Usamos a tecla \*Espaço\* para alternar o modo de apagamento. Quando estiver ativo, qualquer caractere que o cursor passar será removido** . Além disso, ao desenhar, podemos usar o modo apagar para navegar pelo texto sem deixar rastros.

## 4. Modo Visual

DrawIt suporta o modo visual Vim com algumas opções. Primeiro, **precisamos ter certeza de que DrawIt está ativo e o modo de apagamento desativado antes de entrar no modo Visual com a combinação de teclas \*Ctrl+v\*** . Nele, após selecionar uma área, podemos inserir uma caixa, uma elipse, uma linha ou uma seta **:**

![Demonstração do modo visual DrawIt](https://www.baeldung.com/wp-content/uploads/sites/2/2023/08/drawit-visual-mode.gif)

Caixa e elipse são diretas. *\b* adiciona uma caixa e *\e* adiciona uma elipse cobrindo a área selecionada.

As linhas, no entanto, são desenhadas diagonalmente:

- início da linha: início da seleção
- fim da linha: fim da seleção

O comando *\l* desenha uma linha, enquanto *\a* adiciona uma linha semelhante com uma seta no final. Se a área selecionada não for um quadrado, teremos uma linha estranha e ondulada.

## 5. Conclusão

Neste artigo, nos familiarizamos com o plugin DrawIt Vim. Aprendemos como configurar a ferramenta, desenhar diagramas simples, personalizar os personagens e fazer correções. Além disso, vimos como evitar erros comuns durante a edição.

No geral, pode ser um pouco complicado desenhar com o DrawIt no início, mas depois de um pouco de prática, deve se tornar mais intuitivo.