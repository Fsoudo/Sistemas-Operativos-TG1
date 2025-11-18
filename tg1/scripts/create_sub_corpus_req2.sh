#!/bin/bash

# Variáveis
Ficheiro_Original="/home/$USER/tg1/corpus/paisa.raw.utf8"
Ficheiro_Trabalho="/home/$USER/tg1/corpus_txt/paisa_200k.txt"

# Criar diretoria se não existir
mkdir -p "/home/$USER/tg1/corpus_txt"

if [ -f "$Ficheiro_Original" ]
then
    echo "O ficheiro está na pasta"
    echo "A extrair as primeiras 200000 linhas"
    head -200000 $Ficheiro_Original > $Ficheiro_Trabalho

    contar_linhas=$(wc -l < $Ficheiro_Trabalho)

    if [ $contar_linhas -eq 200000 ]
    then
        echo "Linhas extraídas com sucesso"
    else
        echo "As linhas não foram extraídas com sucesso"
    fi
else
    echo "O ficheiro não está na pasta"
fi
