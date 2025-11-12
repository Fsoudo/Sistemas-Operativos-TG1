#!/bin/bash

# Caminhos fixos
WordsFile="/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words.txt"
PairsFile="/home/$USER/Sistemas-Operativos-TG1/tg1/words_dict/words_pairs.txt"

# Verificação dos ficheiros necessários
if [ ! -f "$WordsFile" ]; then
    echo "Erro: Ficheiro $WordsFile não encontrado! Por favor, executa primeiro o script que cria o ficheiro de palavras (Req4)."
    exit 1
fi

if [ ! -f "$PairsFile" ]; then
    echo "Erro: Ficheiro $PairsFile não encontrado! Por favor, executa primeiro o script que cria o ficheiro de pares de palavras (Req5)."
    exit 1
fi

echo "A verificar se todas as palavras dos pares existem em words.txt..."
echo ""

# Extrai lista de palavras do ficheiro de palavras (segunda coluna)
awk '{print $2}' "$WordsFile" > /tmp/palavras_tmp.txt

# Percorre cada par do ficheiro de pares e verifica se ambas as palavras existem
awk '
BEGIN {
    while ((getline < "/tmp/palavras_tmp.txt") > 0) {
        palavras[$1] = 1
    }
}
{
    w1 = $1
    w2 = $2
    if (!(w1 in palavras)) {
        print "⚠️  Aviso: A palavra \"" w1 "\" do par \"" w1 " " w2 "\" não existe em words.txt"
        erro = 1
    }
    if (!(w2 in palavras)) {
        print "⚠️  Aviso: A palavra \"" w2 "\" do par \"" w1 " " w2 "\" não existe em words.txt"
        erro = 1
    }
}
END {
    if (erro != 1)
        print "✅ Todas as palavras dos pares existem no ficheiro words.txt"
    else
        print "⚠️  Existem palavras nos pares que não estão em words.txt"
}' "$PairsFile"

# Limpeza do ficheiro temporário
rm -f /tmp/palavras_tmp.txt
