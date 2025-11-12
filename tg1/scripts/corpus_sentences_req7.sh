#!/bin/bash

# Caminhos fixos
Ficheiro_Trabalho="/home/$USER/tg1/corpus_txt/paisa.raw.utf8"
Resultado="/home/$USER/tg1/sentences_dict/sentences.txt"

# Verificação do corpus
if [ ! -f "$Ficheiro_Trabalho" ]; then
    echo "Erro: Ficheiro $Ficheiro_Trabalho não encontrado!"
    echo "Por favor, execute primeiro o script do exercício 2 para criar o corpus."
    exit 1
fi

# Diretoria de saída
mkdir -p "/home/$USER/tg1/sentences_dict"

# Geração de sentences.txt
# 1) remove linhas vazias; 2) normaliza espaços internos e remove espaços nas pontas
# 3) troca espaços por '|'; 4) conta ocorrências; 5) imprime "frase contagem"
# 6) ordena alfabeticamente pela frase
grep -v '^[[:space:]]*$' "$Ficheiro_Trabalho" \
| sed -E 's/[[:space:]]+/ /g; s/^ //; s/ $//' \
| sed 's/ /|/g' \
| sort \
| uniq -c \
| sed 's/^ *//' \
| awk '{c=$1; $1=""; sub(/^ /,""); print $0, c}' \
| sort > "$Resultado"

echo "Ficheiro de frases criado: $Resultado"
echo "Total de frases únicas: $(wc -l < "$Resultado")"
