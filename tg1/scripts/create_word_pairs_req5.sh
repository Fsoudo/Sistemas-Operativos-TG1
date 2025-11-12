#!/bin/bash

# Caminhos fixos
Ficheiro_Trabalho="/home/$USER/tg1/corpus_txt/paisa.raw.utf8"
Resultado="/home/$USER/tg1/words_dict/words_pairs.txt"

# Verificação do corpus
if [ ! -f "$Ficheiro_Trabalho" ]; then
    echo "Erro: Ficheiro $Ficheiro_Trabalho não encontrado!"
    echo "Por favor, executa primeiro o script do requisito 2 para criar o sub-corpus (200.000 linhas)."
    exit 1
fi

# Diretoria de saída
mkdir -p "/home/$USER/tg1/words_dict"

# Geração de words_pairs.txt
# 1) remove linhas vazias; 2) converte para minúsculas; 3) troca pontuação por espaço
# 4) comprime espaços e remove espaços nas pontas; 5) cria bigramas (pares consecutivos por linha)
# 6) conta ocorrências; 7) imprime "palavra1 palavra2 contagem"
# 8) ordena alfabeticamente por (palavra1, palavra2)
grep -v '^[[:space:]]*$' "$Ficheiro_Trabalho" \
| tr 'A-Z' 'a-z' \
| sed 's/[[:punct:]]/ /g' \
| tr -s ' ' \
| sed -E 's/^ //; s/ $//' \
| awk '{ for (i=1; i<NF; i++) print $i, $(i+1) }' \
| sort \
| uniq -c \
| sed 's/^ *//' \
| awk '{c=$1; w1=$2; w2=$3; print w1, w2, c}' \
| sort -k1,1 -k2,2 > "$Resultado"

echo "Ficheiro de pares de palavras criado: $Resultado"
echo "Total de pares únicos: $(wc -l < "$Resultado")"
