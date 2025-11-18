#!/bin/bash

# Variáveis
Ficheiro_Trabalho="/home/$USER/tg1/corpus_txt/paisa_200k.txt"
Resultado="/home/$USER/tg1/words_dict/words.txt"

# Criar diretoria se não existir
mkdir -p "/home/$USER/tg1/words_dict"

# Processar palavras do corpus
# cat: lê o ficheiro completo
# tr -s: remove espaços duplicados, deixando apenas um espaço entre palavras
# sed: substitui toda a pontuação por espaços
# tr: converte maiúsculas para minúsculas
# tr: substitui espaços por quebras de linha
# grep: remove linhas vazias que podem surgir depois de substituir pontuação
# sort: ordena todas as palavras alfabeticamente - passo essencial para o uniq agrupar repetições
# uniq -c: conta as ocorrências de cada palavra (a opção -c adiciona a contagem à esquerda)
# sed: remove espaços iniciais que o uniq -c adiciona antes do número
# awk: reordena para formato "palavra contagem"
# sort: ordena novamente alfabeticamente pela primeira coluna (a palavra)
cat $Ficheiro_Trabalho | \
    tr -s ' ' | \
    sed 's/[[:punct:]]/ /g' | \
    tr 'A-Z' 'a-z' | \
    tr ' ' '\n' | \
    grep -v '^$' | \
    sort | \
    uniq -c | \
    sed 's/^ *//' | \
    awk '{print $2, $1}' | \
    sort -k1 > $Resultado

echo "Ficheiro de palavras criado: $Resultado"
echo "Total de palavras: $(wc -l < $Resultado)"
