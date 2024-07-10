# Instalar fontes do repositório Debian

O Debian inclui algumas fontes de programação populares em seus repositórios. Você pode instalá-las usando o comando `apt`:

```bash
sudo apt update
sudo apt install font-manager # opcional, para gerenciar fontes graficamente
sudo apt install <nome-do-pacote-da-fonte>
```

- Substitua `<nome-do-pacote-da-fonte>` pelo nome do pacote da fonte desejada.
- Alguns exemplos de pacotes de fontes populares:
  - `fonts-firacode` (Fira Code)
  - `fonts-hack` (Hack)
  - `fonts-inconsolata` (Inconsolata)
  - `fonts-liberation` (Liberation Mono)
  - `fonts-roboto` (Roboto Mono)
- Use `apt search font` para procurar por outros pacotes de fontes disponíveis.

- **Adicionar PPAs (Personal Package Archives) para fontes adicionais:**

  Alguns desenvolvedores de fontes mantêm seus próprios PPAs, que podem conter versões mais recentes ou fontes não disponíveis nos repositórios oficiais do Debian.

  - **Exemplo com o PPA do Nerd Fonts:**

    ```bash
    sudo apt update
    sudo apt install -y curl software-properties-common
    curl -fsSL https://repo.rachpt.com/rachpt.key | sudo gpg --dearmor -o /usr/share/keyrings/rachpt-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/rachpt-archive-keyring.gpg] https://repo.rachpt.com/ bullseye main" | sudo tee /etc/apt/sources.list.d/rachpt.list
    sudo apt update
    sudo apt install fonts-cascadia-code-nerd # Instala a fonte Cascadia Code Nerd Font
    ```

    - Substitua `fonts-cascadia-code-nerd` pelo nome do pacote da fonte desejada no PPA.

**2. Instalando fontes manualmente:**

- **Baixar arquivos de fontes:**

  - Baixe os arquivos de fontes desejados de um site confiável (geralmente no formato `.ttf`, `.otf` ou `.zip`).

- **Mover arquivos para o diretório de fontes:**

  - Mova os arquivos de fontes baixados para o diretório `~/.local/share/fonts/` (para uso pessoal) ou `/usr/local/share/fonts/` (para uso do sistema).

  ```bash
  mkdir -p ~/.local/share/fonts/
  mv ~/Downloads/NomeDaFonte.ttf ~/.local/share/fonts/
  ```

- **Atualizar cache de fontes:**

  ```bash
  fc-cache -fv
  ```

**3. Usando um gerenciador de fontes gráfico:**

- **Instalar um gerenciador de fontes:**

  ```bash
  sudo apt install font-manager
  ```

- **Usar o gerenciador de fontes para instalar novas fontes:**

  - Abra o gerenciador de fontes (geralmente chamado "Fontes").
  - Importe as fontes baixadas ou procure por novas fontes online.

**Lembre-se:**

- Após instalar novas fontes, pode ser necessário reiniciar os aplicativos ou o sistema para que as mudanças tenham efeito.
- Certifique-se de ter os direitos de administrador (sudo) para instalar fontes para todo o sistema.
- Baixe fontes apenas de fontes confiáveis para evitar problemas de segurança.