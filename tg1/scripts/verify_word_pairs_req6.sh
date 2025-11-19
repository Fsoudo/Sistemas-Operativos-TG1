#!/bin/bash

# Variáveis
Palavras="/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words.txt"
Pares="/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words_pairs.txt"

echo "A verificar pares de palavras..."

# Extrair palavras dos pares (primeira e segunda coluna)
# awk: imprime primeira e segunda palavra de cada par, uma por linha
# sort -u: ordena e remove duplicados
awk '{print $1"\n"$2}' $Pares | sort -u > /tmp/palavras_dos_pares.txt

# Extrair palavras do dicionário (primeira coluna)
# awk: imprime apenas a primeira coluna (a palavra)
# sort -u: ordena e remove duplicados
awk '{print $1}' $Palavras | sort -u > /tmp/palavras_dicionario.txt

# Verificar se todas as palavras dos pares existem no dicionário
# comm -23: mostra linhas que estão no primeiro ficheiro mas não no segundo
palavras_faltam=$(comm -23 /tmp/palavras_dos_pares.txt /tmp/palavras_dicionario.txt | wc -l)

if [ $palavras_faltam -eq 0 ]
then
    echo "✓ Todas as palavras dos pares existem no dicionário"
else
    echo "✗ Faltam $palavras_faltam palavras no dicionário"
fi

# Limpar ficheiros temporários
rm /tmp/palavras_dos_pares.txt /tmp/palavras_dicionario.txt
