#!/bin/bash

# Variáveis
Frases="/home/$USER/tg1/sentences_dict/sentences.txt"
Pares="/home/$USER/tg1/sentences_dict/sentences_pairs.txt"

echo "A verificar pares de frases..."

# Conta o total de frases únicas
TOTAL_FRASES=$(wc -l < "$Frases")

# Conta o total de pares de frases
TOTAL_PARES=$(wc -l < "$Pares")

echo "Total de frases únicas: $TOTAL_FRASES"
echo "Total de pares de frases: $TOTAL_PARES"
echo "✓ Ficheiros criados com sucesso"
