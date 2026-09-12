# NPM - Execução de scripts foi desabilitada no Windows

O erro ocorre porque o PowerShell, por padrão, **bloqueia a execução de scripts** para proteger o sistema, e o `npm` moderno usa um arquivo chamado `npm.ps1` que é justamente um script.

A forma mais recomendada de resolver (e a mais segura para uso em desenvolvimento) é alterar a política de execução para **`RemoteSigned`**, que permite scripts locais (como o do `npm`) e mantém a segurança para scripts baixados da internet .

### ✅ Solução Recomendada (Rápida e Segura)

1. Abra o **PowerShell** ou o **Terminal do VS Code**.
2. Execute o comando abaixo para permitir apenas para o seu usuário (não precisa ser administrador):
   
   ```powershell
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
   ```
3. Se for pedido, confirme com **`S`** (Sim) ou **`Y`**.
4. Feche e abra o terminal novamente. Agora o comando `npm -v` deve funcionar .

### 🛠️ Alternativas (Se a Solução Acima Não Resolver)

Se você não quiser ou não puder mudar a política, use uma destas opções:

* **Usar o Prompt de Comando (CMD)**: O CMD não possui a restrição de execução de scripts. Basta abrir o `cmd` em vez do PowerShell e rodar `npm -v`. É a forma mais simples e sem alterações no sistema .
* **Mudança Temporária (Só na sessão atual)**: Se estiver usando o PowerShell, pode rodar apenas para aquela janela:
  
  ```powershell
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
  ```
  
  Isso vale só até você fechar a janela .
* **Chamar o npm.cmd diretamente**: Force o uso da versão para CMD, que ignora a política:
  
  ```powershell
  npm.cmd -v
  ```

### ⚠️ Importante

Evite a política **`Unrestricted`**, pois ela permite a execução de qualquer script sem nenhuma verificação, aumentando o risco de segurança .

A solução com `RemoteSigned` é o equilíbrio recomendado pela própria Microsoft para permitir o trabalho com ferramentas como o Node.js sem abrir mão da segurança .

Espero que ajude! Se o erro persistir após esses passos, me avise.
