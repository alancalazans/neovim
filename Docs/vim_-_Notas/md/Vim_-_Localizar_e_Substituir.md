# Vim - Localizar e Substituir

**Comando:**

***:{range}s/\<alvo\>/\<a substituir\>/gic***

***Onde:***

- **{range}** : É o intervalo que pode ser:
  - **1,5** - Linhas de 1 à 5;
  - **1,$** - Da linha **1** ao fim do arquivo ou simplesmente **%**.
- **s** : Abreviação do comando `substitute`;
- **/** : Separa os elementos ***\<alvo\>***, ***\<a substituir\>*** e as ***flags***;
- As **flags** :
  - **g** : Significa todas as ocorrências na linha;
  - **i** : Ignorar maiúsculas e minúsculas (*ignore case*);
  - **c** : Pede confirmação em cada alteração.

**Exemplo**:  Substituir em cada linha de um script, somente no inicio, toda ocorrência da palavra *"void"* por *"int"*:

***:%s/^void/int/ic*** 

***Obs:*** Neste exemplo o circunflexo (^) antes da palavra *"void"* força a substituição apenas no inicio de cada linha e, portanto, neste caso, não usaremos a *flag* **g**.

