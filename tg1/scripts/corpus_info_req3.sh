#!/bin/bash

# Variáveis
Ficheiro_Trabalho="/home/$USER/tg1/corpus_txt/paisa_200k.txt"
Resultado="/home/$USER/tg1/corpus_info/corpus_info.txt"

# Criar diretoria se não existir
mkdir -p "/home/$USER/tg1/corpus_info"

# Conta corretamente o número de caracteres
numero_caracteres=$(wc -c < $Ficheiro_Trabalho)

# Conta apenas linhas não vazias (-v '^$') ignora linhas em branco
numero_linhas_nao_vazias=$(grep -v '^$' $Ficheiro_Trabalho | wc -l)

# Calcula o número total de palavras existentes no ficheiro do corpus
# cat: lê o conteúdo completo do ficheiro e envia-o para o "pipe"
# tr: Comando translate ou transform | -s opção de "squeeze", comprime repetições do mesmo caractere
numero_total_de_palavras=$(cat $Ficheiro_Trabalho | tr -s ' ' | wc -w)

# Converte para minúsculas, remove pontuação, quebra palavras em linhas, elimina vazios, ordena e conta únicas
numero_total_de_palavras_diferentes=$(tr 'A-Z' 'a-z' < $Ficheiro_Trabalho | sed 's/[[:punct:]]/ /g' | tr -s ' ' | tr ' ' '\n' | grep -v '^$' | sort | uniq | wc -l)

# Calcula a proporção entre o número de palavras diferentes e o número total de palavras
total_de_palavras_diferentes__por__total_de_palavras=$(echo "scale=6; $numero_total_de_palavras_diferentes / $numero_total_de_palavras" | bc)

# Define frases como as linhas do corpus
numero_total_de_frases=$numero_linhas_nao_vazias

# Remove duplicadas e conta frases únicas
numero_total_de_frases_diferentes=$(grep -v '^$' $Ficheiro_Trabalho | sort | uniq | wc -l)

# Calcula a proporção (ou quociente) entre $numero_total_de_frases_diferentes / $numero_total_de_frases
total_de_frases_diferentes__por__total_de_frases=$(echo "scale=6; $numero_total_de_frases_diferentes / $numero_total_de_frases" | bc)

# Bloco que organiza e limpa
{
    echo "=== INFORMAÇÕES DO CORPUS ==="
    echo ""
    echo "Número de caracteres: $numero_caracteres"
    echo "Quantidade de linhas não vazias: $numero_linhas_nao_vazias"
    echo "Número total de palavras: $numero_total_de_palavras"
    echo "Número total de palavras diferentes: $numero_total_de_palavras_diferentes"
    echo "Quociente (palavras diferentes / total palavras): $total_de_palavras_diferentes__por__total_de_palavras"
    echo "Número total de frases: $numero_total_de_frases"
    echo "Número total de frases diferentes: $numero_total_de_frases_diferentes"
    echo "Quociente (frases diferentes / total frases): $total_de_frases_diferentes__por__total_de_frases"
} > $Resultado

echo "Resultados guardados em $Resultado"
cat $Resultado
