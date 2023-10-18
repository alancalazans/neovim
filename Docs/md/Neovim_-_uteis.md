# Neovim - uteis

```
# << No modo insert >>
# Emmet:
	<ctrl> <y> <,>
# Duplica linha selecionada:
	<ctrl> <d>
# Movimenta linha selecionada:
	<ctrl> <shift> <up> ou <down>   (Movimenta respectivamente
	                                 p/ cima ou p/ baixo.)
```



```
# << No modo normal >>
# Marcas de identação, espaço e return habilitar/desabilitar:
	<space> <i>
# Apagar espaço final e de linha em todo arquivo:
	<space> <s>
# Desfazer seleção de itens pesquisados:
	<space> <b>
# Navegação lateral de arquivos e pastas:
	<space> <n>
# Mudar tema:
	<space> </>
# Busca no arquivo:
	:/alvo <enter> (p/ continuar a busca tecle <n>)
----------------------------------------
# Substituições:
	:{intervalo}s/alvo/a_substituir/gic
	
	Onde:
		g : Significa todas as ocorrências na linha;
		i : Ignorar maiúsculas e minúsculas (ignore case);
		c : Pede confirmação em cada alteração.
		
	Exemplos:
		:%s/^void/int/ic    (Substitui todos os `void` no início
                             de todas as linhas por `int`.
                             Ignora maiúsculas e minúsculas e 
                             pede confirmação.)
							 
		:4,8s/^/#    (Insere no início das linhas de 4 à 8
                      o caractere `#`.)
							 
		:4,8s/^#/    (Faz o inverso do anterior removendo do
                      início das linhas de 4 à 8 o caractere `#`.)
							 
		:6,10s/^/\/\/		(Insere no início das linhas de 6 à 10
							 os caracteres `//`.)
							 
		:%s/contador/acumulador/g    (Substitui todas as ocorrências
                                      de `contador` por `acumulador`
                                      na linha e em todo o arquivo.)
										 
		:7,$/var/let    (Substitui, no início de cada linha (observe
                         que não esta terminando com `/g`) a partir
                         da linha 7, até o fim do arquivo todas as
                         ocorrências de `var` por `let`.)
```

