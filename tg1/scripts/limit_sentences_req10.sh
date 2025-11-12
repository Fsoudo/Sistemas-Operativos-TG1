#!/bin/bash

# Caminhos fixos
SentFile="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/sentences.txt"
TmpSel="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/.sentences.top250k.tmp"
Backup="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/sentences.txt.bak"

# Verificações
if [ ! -f "$SentFile" ]; then
    echo "Erro: Ficheiro $SentFile não encontrado! Corre primeiro o Req7."
    exit 1
fi

# Conta linhas atuais
total=$(wc -l < "$SentFile")
echo "Entradas atuais em sentences.txt: $total"

if [ "$total" -le 250000 ]; then
    echo "Nothing to do: já tem <= 250000 entradas."
    exit 0
fi

# Seleciona top 250k por frequência (desc), volta a ordenar alfabeticamente pela frase
# Formato de entrada: "frase_com_| contagem" (contagem é o último campo)
# Passos:
# 1) separa frase e contagem em TAB
# 2) ordena por contagem desc
# 3) head 250k
# 4) ordena alfabeticamente pela frase
# 5) volta a "frase contagem"
awk '{c=$NF; $NF=""; sub(/[[:space:]]+$/, ""); print $0 "\t" c}' "$SentFile" \
| sort -k2,2nr -k1,1 \
| head -250000 \
| sort -k1,1 \
| awk -F'\t' '{print $1, $2}' > "$TmpSel"

if [ $? -ne 0 ] || [ ! -s "$TmpSel" ]; then
    echo "Erro ao gerar lista limitada."
    rm -f "$TmpSel"
    exit 1
fi

# Backup e substituição
cp -f "$SentFile" "$Backup"
mv -f "$TmpSel" "$SentFile"

echo "sentences.txt limitado a 250000 entradas."
echo "Backup criado em: $Backup"
