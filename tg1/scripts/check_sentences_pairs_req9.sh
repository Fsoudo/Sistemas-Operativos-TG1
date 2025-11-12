#!/bin/bash

# Caminhos fixos
SentencesFile="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/sentences.txt"
PairsFile="/home/$USER/Sistemas-Operativos-TG1/tg1/sentences_dict/sentences_pairs.txt"

# Verificação dos ficheiros necessários
if [ ! -f "$SentencesFile" ]; then
    echo "Erro: Ficheiro $SentencesFile não encontrado!"
    echo "Por favor, executa primeiro o script que cria o ficheiro de frases (Req7)."
    exit 1
fi

if [ ! -f "$PairsFile" ]; then
    echo "Erro: Ficheiro $PairsFile não encontrado!"
    echo "Por favor, executa primeiro o script que cria o ficheiro de pares de frases (Req8)."
    exit 1
fi

echo "A verificar se todas as frases dos pares existem no ficheiro sentences.txt..."
echo ""

# Extrai a lista de frases únicas (coluna 1)
awk '{$NF=""; sub(/[[:space:]]+$/, ""); print}' "$SentencesFile" > /tmp/frases_tmp.txt

# Percorre cada par e verifica se ambas as frases existem
awk '
BEGIN {
    while ((getline < "/tmp/frases_tmp.txt") > 0) {
        frases[$0] = 1
    }
}
{
    n = NF
    freq = $n
    $n = ""
    sub(/[[:space:]]+$/, "")
    split($0, parts, " ")
    frase1 = parts[1]
    frase2 = parts[2]
    if (!(frase1 in frases)) {
        print "⚠️  Aviso: A frase 1 do par \"" frase1 "\" não existe em sentences.txt"
        erro = 1
    }
    if (!(frase2 in frases)) {
        print "⚠️  Aviso: A frase 2 do par \"" frase2 "\" não existe em sentences.txt"
        erro = 1
    }
}
END {
    if (erro != 1)
        print "✅ Todas as frases dos pares existem no ficheiro sentences.txt"
    else
        print "⚠️  Existem frases nos pares que não estão em sentences.txt"
}' "$PairsFile"

# Limpeza do ficheiro temporário
rm -f /tmp/frases_tmp.txt
