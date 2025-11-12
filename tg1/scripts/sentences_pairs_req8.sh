#!/bin/bash

# Caminhos fixos
Ficheiro_Trabalho="/home/$USER/Sistemas-Operativos-TG1/tg1/corpus_txt/paisa.raw.utf8"
Resultado="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/sentences_pairs.txt"

# Verificação do corpus
if [ ! -f "$Ficheiro_Trabalho" ]; then
    echo "Erro: Ficheiro $Ficheiro_Trabalho não encontrado!"
    echo "Por favor, executa primeiro o script do requisito 2 para criar o sub-corpus (200.000 linhas)."
    exit 1
fi

# Diretoria de saída
mkdir -p "/home/$USER/tg1/sentences_dict"

# Geração de sentences_pairs.txt
# 1) remove linhas vazias; 2) normaliza espaços internos e remove espaços nas pontas
# 3) troca espaços por '|'; 4) cria pares de frases consecutivas; 5) conta ocorrências
# 6) imprime "frase1_com_pipes frase2_com_pipes contagem"; 7) ordena alfabeticamente
grep -v '^[[:space:]]*$' "$Ficheiro_Trabalho" \
| sed -E 's/[[:space:]]+/ /g; s/^ //; s/ $//' \
| sed 's/ /|/g' \
| awk '
    NR==1 { prev=$0; next }
    { pair = prev " " $0; count[pair]++; prev=$0 }
    END {
        for (p in count) print p, count[p]
    }
' \
| sort > "$Resultado"

echo "Ficheiro de pares de frases criado: $Resultado"
echo "Total de pares únicos: $(wc -l < "$Resultado")"
