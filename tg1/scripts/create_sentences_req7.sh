#!/bin/bash

# Variáveis
Ficheiro_Trabalho="/home/$USER/tg1/corpus_txt/paisa_200k.txt"
Resultado="/home/$USER/tg1/sentences_dict/sentences.txt"
MAX_WORDS=30

# Criar diretoria se não existir
mkdir -p "/home/$USER/tg1/sentences_dict"

# Verificação do corpus
if [ ! -f "$Ficheiro_Trabalho" ]
then
    echo "Erro: Ficheiro $Ficheiro_Trabalho não encontrado!"
    echo "Por favor, execute primeiro o script do requisito 2 para criar o corpus."
    exit 1
fi

echo "A processar frases do corpus..."

# Processar frases com limite de 30 palavras (evita crash do Eugénio)
# grep: remove linhas vazias
# sed: divide texto por pontuação (., !, ?)
# tr: converte para minúsculas
# sed: remove caracteres especiais, mantendo apenas letras e espaços
# sed: normaliza espaços múltiplos para um único espaço
# sed: remove espaços no início e fim da linha
# awk: limita cada frase a máximo 30 palavras e filtra frases muito curtas
# tr: substitui espaços por |
# grep: remove linhas vazias ou só com |
# sort: ordena as frases
# uniq -c: conta ocorrências
# sed: remove espaços iniciais
# awk: reformata para "frase contagem"
# sort: ordena alfabeticamente
grep -v '^[[:space:]]*$' "$Ficheiro_Trabalho" | \
    sed 's/[.!?]\+/\n/g' | \
    tr '[:upper:]' '[:lower:]' | \
    sed 's/[^[:alpha:][:space:]]//g' | \
    sed 's/[[:space:]]\+/ /g' | \
    sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | \
    awk -v max="$MAX_WORDS" '{
        nwords = split($0, words, " ")
        if (nwords < 2) next
        if (nwords > max) {
            result = words[1]
            for (i = 2; i <= max; i++) {
                result = result " " words[i]
            }
            print result
        } else {
            print $0
        }
    }' | \
    tr ' ' '|' | \
    grep -v '^$' | \
    grep -v '^|*$' | \
    sort | \
    uniq -c | \
    sed 's/^ *//' | \
    awk '{c=$1; $1=""; sub(/^ /,""); print $0, c}' | \
    sort > "$Resultado"

echo "Ficheiro de frases criado: $Resultado"
echo "Total de frases únicas: $(wc -l < "$Resultado")"
