# O caractere `^M` no final das linhas

O caractere `^M` no final das linhas em arquivos salvos pelo Windows é causado pela presença de caracteres de fim de linha no formato Windows (`CRLF`, ou seja, `\r\n`), enquanto o Linux utiliza somente `LF` (`\n`). Esse caractere aparece no `neovim` como `^M` porque o editor está interpretando o `\r` (carriage return) como um caractere literal.

Para remover esses caracteres no `neovim`, você pode fazer o seguinte:

---

### Método 1: Substituição direta no `neovim`
1. Abra o arquivo no `neovim`:
   ```bash
   nvim arquivo.txt
   ```

2. Entre no modo de comando pressionando `:` e use o seguinte comando de substituição:
   ```vim
   :%s/\r//g
   ```
   Explicação:
   - `:%s` significa "substituir em todo o arquivo".
   - `\r` corresponde ao caractere `CR` (carriage return, ou `^M`).
   - `//g` significa "substituir por nada" (remover) em todas as ocorrências.

3. Salve o arquivo e saia:
   ```vim
   :wq
   ```

---

### Método 2: Converter usando um comando externo no Linux
Se você tem muitos arquivos ou prefere usar uma ferramenta externa, pode converter o arquivo usando o comando `dos2unix` ou `sed`.

#### Usando `dos2unix`:
1. Instale o `dos2unix` (caso ainda não esteja instalado):
   ```bash
   sudo apt install dos2unix   # Debian/Ubuntu
   sudo dnf install dos2unix   # Fedora
   sudo pacman -S dos2unix     # Arch
   ```

2. Converta o arquivo:
   ```bash
   dos2unix arquivo.txt
   ```

#### Usando `sed`:
Se não quiser instalar nada extra, você pode usar o comando `sed` para remover os caracteres:
```bash
sed -i 's/\r//' arquivo.txt
```

Explicação:
- `-i`: Edita o arquivo diretamente (in-place).
- `'s/\r//'`: Remove os caracteres `\r`.

---

### Método 3: Configurar o `neovim` para lidar automaticamente com `CRLF`
Você pode configurar o `neovim` para reconhecer automaticamente o formato de fim de linha e convertê-lo para o formato Unix (`LF`) ao salvar.

1. Adicione a seguinte configuração no arquivo do `neovim` (geralmente `~/.config/nvim/init.vim` ou `~/.config/nvim/init.lua`):

   **Se estiver usando `init.vim`:**
   ```vim
   set fileformats=unix,dos
   ```

   **Se estiver usando `init.lua`:**
   ```lua
   vim.opt.fileformats = { "unix", "dos" }
   ```

   Isso permite que o `neovim` detecte automaticamente o formato de fim de linha.

2. Ao abrir o arquivo, use o comando `:set ff=unix` para forçar o formato Unix antes de salvar:
   ```vim
   :set ff=unix
   :w
   ```

---

Com esses métodos, você pode resolver o problema do caractere `^M` no final das linhas.