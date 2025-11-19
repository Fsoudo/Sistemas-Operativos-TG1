#!/bin/bash

# Variáveis
Ficheiro_Trabalho="/home/$USER/Sistemas-Operativos-TG1/tg1/corpus_txt/paisa_200k.txt"
Resultado="/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words_pairs.txt"

# Verificação do corpus
if [ ! -f "$Ficheiro_Trabalho" ]
then
    echo "Erro: Ficheiro $Ficheiro_Trabalho não encontrado!"
    exit 1
fi

# Processar pares de palavras
# cat: lê o ficheiro completo
# tr -s: remove espaços duplicados
# sed: substitui pontuação por espaços
# tr: converte para minúsculas
# tr -s: converte espaços para quebras de linha
# grep: remove linhas vazias
# awk: cria pares de palavras consecutivas (guarda palavra anterior e imprime par)
# sort: ordena os pares
# uniq -c: conta ocorrências de cada par
# sed: remove espaços iniciais
# awk: reordena para formato "palavra1 palavra2 contagem"
# sort: ordena alfabeticamente pelos dois primeiros campos
cat $Ficheiro_Trabalho | \
    tr -s ' ' | \
    sed 's/[[:punct:]]/ /g' | \
    tr 'A-Z' 'a-z' | \
    tr -s ' ' '\n' | \
    grep -v '^$' | \
    awk 'NR>1 {print prev, $0} {prev=$0}' | \
    sort | \
    uniq -c | \
    sed 's/^ *//' | \
    awk '{print $2, $3, $1}' | \
    sort -k1,2 > $Resultado

echo "Ficheiro de pares de palavras criado: $Resultado"
echo "Total de pares: $(wc -l < $Resultado)"
