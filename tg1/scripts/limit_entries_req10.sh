#!/bin/bash

# Variáveis
WORDS_FILE="/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words.txt"
WORDS_PAIRS_FILE="/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words_pairs.txt"
SENTENCES_FILE="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/sentences.txt"
SENTENCES_PAIRS_FILE="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/sentences_pairs.txt"
MAX_ENTRIES=250000

echo "A aplicar limite de $MAX_ENTRIES entradas..."

# Limitar palavras se necessário
total=$(wc -l < "$WORDS_FILE")
if [ $total -gt $MAX_ENTRIES ]
then
    head -n $MAX_ENTRIES "$WORDS_FILE" > "$WORDS_FILE.tmp"
    mv "$WORDS_FILE.tmp" "$WORDS_FILE"
    echo "Palavras limitadas a $MAX_ENTRIES"
fi

# Limitar pares de palavras se necessário
total=$(wc -l < "$WORDS_PAIRS_FILE")
if [ $total -gt $MAX_ENTRIES ]
then
    head -n $MAX_ENTRIES "$WORDS_PAIRS_FILE" > "$WORDS_PAIRS_FILE.tmp"
    mv "$WORDS_PAIRS_FILE.tmp" "$WORDS_PAIRS_FILE"
    echo "Pares de palavras limitados a $MAX_ENTRIES"
fi

# Limitar frases se necessário
total=$(wc -l < "$SENTENCES_FILE")
if [ $total -gt $MAX_ENTRIES ]
then
    head -n $MAX_ENTRIES "$SENTENCES_FILE" > "$SENTENCES_FILE.tmp"
    mv "$SENTENCES_FILE.tmp" "$SENTENCES_FILE"
    echo "Frases limitadas a $MAX_ENTRIES"
fi

# Limitar pares de frases se necessário
total=$(wc -l < "$SENTENCES_PAIRS_FILE")
if [ $total -gt $MAX_ENTRIES ]
then
    head -n $MAX_ENTRIES "$SENTENCES_PAIRS_FILE" > "$SENTENCES_PAIRS_FILE.tmp"
    mv "$SENTENCES_PAIRS_FILE.tmp" "$SENTENCES_PAIRS_FILE"
    echo "Pares de frases limitados a $MAX_ENTRIES"
fi

echo ""
echo "Resumo final:"
echo "  Palavras: $(wc -l < "$WORDS_FILE")"
echo "  Pares de palavras: $(wc -l < "$WORDS_PAIRS_FILE")"
echo "  Frases: $(wc -l < "$SENTENCES_FILE")"
echo "  Pares de frases: $(wc -l < "$SENTENCES_PAIRS_FILE")"
