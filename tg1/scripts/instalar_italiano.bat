@echo off
REM ============================================================
REM  Instala dicionários Italianos no Eugénio 3.0
REM  Copia os ficheiros já prontos da pasta C:\Eugenio_IT
REM  para:
REM    - pasta de instalação (Program Files)
REM    - pasta do utilizador (AppData\Roaming)
REM ============================================================

chcp 65001 >NUL

REM Pasta onde estão os ficheiros já prontos
set "SOURCE_DIR=C:\Eugenio_IT"

REM -------------------------------
REM Detectar diretoria do Eugénio
REM -------------------------------
if exist "C:\Program Files\Eugénio" (
    set "TARGET_DIR=C:\Program Files\Eugénio"
) else if exist "C:\Program Files (x86)\Eugénio" (
    set "TARGET_DIR=C:\Program Files (x86)\Eugénio"
) else (
    echo ERRO: O Eugénio nao foi encontrado.
    pause
    exit /b
)

REM Diretoria AppData do utilizador
set "USER_DIR=%AppData%\LabSI2-INESC-ID\Eugénio 3.0"

echo.
echo A copiar ficheiros...
echo.

REM Copiar para Program Files
copy /Y "%SOURCE_DIR%\*" "%TARGET_DIR%"

REM Criar pasta AppData caso não exista
if not exist "%USER_DIR%" mkdir "%USER_DIR%"

REM Copiar para AppData
copy /Y "%SOURCE_DIR%\*" "%USER_DIR%"

echo.
echo Ficheiros copiados:
echo      -> %TARGET_DIR%
echo      -> %USER_DIR%
echo.
pause