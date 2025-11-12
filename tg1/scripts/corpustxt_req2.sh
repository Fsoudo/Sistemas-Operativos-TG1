#!/bin/bash

#Variáveis
Ficheiro_Original="/home/$USER/Downloads/paisa.raw.utf8"
Ficheiro_Trabalho="/home/$USER/Sistemas-Operativos-TG1/tg1/corpus_txt/paisa.raw.utf8"

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
