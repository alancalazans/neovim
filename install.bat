@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

echo =========================================
echo   Instalador Automático do Neovim
echo =========================================
echo.

:: =========================================
:: 1. Baixar a última versão do Neovim
:: =========================================
echo [1/9] Obtendo a URL do último release do Neovim...

:: Usa PowerShell para obter a URL do nvim-win64.zip do último release (não prerelease)
for /f "delims=" %%A in ('powershell -NoProfile -Command "$releases = Invoke-RestMethod -Uri 'https://api.github.com/repos/neovim/neovim/releases'; $release = $releases | Where-Object { $_.prerelease -eq $false } | Select-Object -First 1; $asset = $release.assets | Where-Object { $_.name -eq 'nvim-win64.zip' }; Write-Output $asset.browser_download_url"') do set "NVIM_URL=%%A"

if "%NVIM_URL%"=="" (
    echo ERRO: Não foi possível obter a URL do nvim-win64.zip.
    echo Verifique sua conexão com a internet e tente novamente.
    pause
    exit /b 1
)

echo URL encontrada: %NVIM_URL%
echo.

:: =========================================
:: 2. Download do arquivo
:: =========================================
echo [2/9] Baixando nvim-win64.zip...
set "ZIP_FILE=%TEMP%\nvim-win64.zip"

powershell -NoProfile -Command "Invoke-WebRequest -Uri '%NVIM_URL%' -OutFile '%ZIP_FILE%' -UseBasicParsing"

if not exist "%ZIP_FILE%" (
    echo ERRO: Falha ao baixar o arquivo.
    pause
    exit /b 1
)

echo Download concluído: %ZIP_FILE%
echo.

:: =========================================
:: 3. Extrair para C:\nvim-win64
:: =========================================
echo [3/9] Extraindo para C:\nvim-win64...

if exist "C:\nvim-win64" (
    echo Pasta C:\nvim-win64 já existe. Removendo versão anterior...
    rmdir /s /q "C:\nvim-win64"
)

powershell -NoProfile -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath 'C:\' -Force"

:: O zip extrai como nvim-win64, mas vamos garantir o nome correto
if exist "C:\nvim-win64" (
    echo Extração concluída.
) else if exist "C:\nvim-win64" (
    echo Extração concluída.
) else (
    echo Tentando renomear pasta extraída...
    for /d %%D in (C:\nvim-*) do (
        if "%%~nxD" neq "nvim-win64" (
            move "%%D" "C:\nvim-win64" >nul 2>&1
        )
    )
)

if not exist "C:\nvim-win64" (
    echo ERRO: Falha ao extrair o arquivo.
    pause
    exit /b 1
)

echo Extração concluída em C:\nvim-win64
echo.

:: =========================================
:: 4. Abrir PowerShell
:: =========================================
echo [4/9] Abrindo PowerShell para configuração...
echo.

:: =========================================
:: 5. Copiar plug.vim
:: =========================================
echo [5/9] Baixando plug.vim...
powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -OutFile 'C:\nvim-win64\share\nvim\runtime\autoload\plug.vim' -UseBasicParsing"

if not exist "C:\nvim-win64\share\nvim\runtime\autoload\plug.vim" (
    echo AVISO: Não foi possível baixar o plug.vim automaticamente.
    echo Certifique-se de que o arquivo plug.vim esteja disponível.
) else (
    echo plug.vim copiado com sucesso.
)
echo.

:: =========================================
:: 6. Criar pasta de configuração
:: =========================================
echo [6/9] Criando pasta de configuração do Neovim...
powershell -NoProfile -Command "New-Item -ItemType Directory -Force -Path '$env:LOCALAPPDATA\nvim'"
echo Pasta criada: %LOCALAPPDATA%\nvim
echo.

:: =========================================
:: 7. Copiar init.vim
:: =========================================
echo [7/9] Copiando init.vim...
if exist "init.vim" (
    copy /Y "init.vim" "%LOCALAPPDATA%\nvim\" >nul
    echo init.vim copiado com sucesso.
) else (
    echo AVISO: Arquivo init.vim não encontrado no diretório atual.
    echo Certifique-se de que o arquivo init.vim esteja na mesma pasta que este install.bat
)
echo.

:: =========================================
:: 8. Copiar pasta snippets
:: =========================================
echo [8/9] Copiando pasta snippets...
if exist "snippets" (
    xcopy /E /I /Y "snippets" "%LOCALAPPDATA%\nvim\snippets\" >nul
    echo Pasta snippets copiada com sucesso.
) else (
    echo AVISO: Pasta snippets não encontrada no diretório atual.
    echo Certifique-se de que a pasta snippets esteja na mesma pasta que este install.bat
)
echo.

:: =========================================
:: 9. Adicionar ao PATH e abrir nvim
:: =========================================
echo [9/9] Adicionando Neovim ao PATH do sistema...

:: Adiciona C:\nvim-win64\bin ao PATH do usuário
powershell -NoProfile -Command "$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User'); if ($currentPath -notlike '*C:\nvim-win64\bin*') { [Environment]::SetEnvironmentVariable('Path', $currentPath + ';C:\nvim-win64\bin', 'User'); Write-Output 'Neovim adicionado ao PATH.' } else { Write-Output 'Neovim já está no PATH.' }"

echo.
echo =========================================
echo   Instalação concluida com sucesso!
echo =========================================
echo.
echo O Neovim sera aberto agora para instalar os plugins.
echo No Neovim, digite :PlugInstall e pressione ENTER
echo.
pause

:: Abre o nvim
start "" "C:\nvim-win64\bin\nvim.exe"

echo.
echo Pronto! No Neovim digite :PlugInstall + ENTER para instalar os plugins.
echo.
pause
