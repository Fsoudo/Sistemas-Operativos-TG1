#!/bin/bash

#Variáveis
Ficheiro_Trabalho='/home/$USER/Sistemas-Operativos-TG1/tg1/corpus_txt/paisa.raw.utf8'
Resultado='/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words.txt'

cat $Ficheiro_Trabalho | \
#tr -s | Remove espaços duplicados, deixando apenas um espaço entre as palavras.

    tr -s ' ' | \

#Sed |Substitui toda a pontuação por espaços.
    sed 's/[[:punct:]]/ /g' | \
#TR |Substitui espaços por quebras de linha.   
    tr 'A-Z' 'a-z' | \
    tr ' ' '\n' | \
#Grep remove linhas vazias, que podem surgir depois de substituir pontuação.
    grep -v '^$' | \
#Ordena todas as palavras alfabeticamente - passos essencial para o uniq agrupar repitições.
    sort | \
#Conta as ocorrências de cada palavras (a opção -c adiciona a contagem à esquerda).
    uniq -c | \
#Remove espaços iniciais que o uniq -c adiciona antes do número.
    sed 's/^ *//' | \
#Esta linha tenta ajustar o espaçamento entre número e palavra,
    sed 's/ / /' | \
#Ordena novamente alfabeticamente pela segunda coluna (a palavra).
    sort -k2 > $Resultado

echo "Ficheiro de palavras criado: $Resultado"
