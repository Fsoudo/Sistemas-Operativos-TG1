#!/bin/bash

# Script Master - Executa scripts do TG1 à escolha do utilizador
# Trabalho de Grupo 1 - Sistemas Operativos

clear
echo "=========================================="
echo "  MASTER SCRIPT - TG1 Eugénio Italiano"
echo "=========================================="
echo ""
echo "Scripts disponíveis:"
echo ""
echo "  1) Requisito 2 - Criar sub-corpus (200k linhas)"
echo "  2) Requisito 3 - Calcular métricas do corpus"
echo "  3) Requisito 4 - Criar ficheiro de palavras"
echo "  4) Requisito 5 - Criar ficheiro de pares de palavras"
echo "  5) Requisito 6 - Verificar palavras nos pares"
echo "  6) Requisito 7 - Criar ficheiro de frases"
echo "  7) Requisito 8 - Criar ficheiro de pares de frases"
echo "  8) Requisito 9 - Verificar frases nos pares"
echo "  9) Requisito 10 - Limitar dicionários a 250.000 entradas"
echo ""
echo " 10) Preparar ficheiros para instalação no Eugénio"
echo ""
echo " 11) Executar TODOS os scripts (ordem correta)"
echo ""
echo "  0) Sair"
echo ""
echo "=========================================="
echo ""

# Função para executar um script
execute_script() {
    local script_name=$1
    local description=$2

    echo ""
    echo "=========================================="
    echo ">>> Executando: $description"
    echo "=========================================="
    echo ""

    if [ -f "$script_name" ]; then
        ./"$script_name"
        local exit_code=$?
        echo ""
        if [ $exit_code -eq 0 ]; then
            echo "✓ Script executado com sucesso!"
        else
            echo "✗ Erro ao executar script (código: $exit_code)"
        fi
    else
        echo "✗ Erro: Script $script_name não encontrado!"
    fi

    echo ""
}

# Função para pausar e aguardar Enter
pause() {
    echo ""
    read -p "Pressione ENTER para continuar..."
}

# Função para preparar ficheiros para instalação no Eugénio
prepare_eugenio_files() {
    local WORDS_FILE="/home/$USER/tg1/words_dict/words.txt"
    local WORDS_PAIRS_FILE="/home/$USER/tg1/words_dict/words_pairs.txt"
    local SENTENCES_FILE="/home/$USER/tg1/sentences_dict/sentences.txt"
    local SENTENCES_PAIRS_FILE="/home/$USER/tg1/sentences_dict/sentences_pairs.txt"
    local OUTPUT_DIR="/home/$USER/tg1/eugenio_install"

    echo ""
    echo "=========================================="
    echo "  Preparar Ficheiros para o Eugénio"
    echo "=========================================="
    echo ""

    # Criar diretoria de output se não existir
    mkdir -p "$OUTPUT_DIR"

    echo "A copiar e renomear ficheiros..."
    echo ""

    # Copiar e renomear
    cp "$WORDS_FILE" "$OUTPUT_DIR/geral.pal" && echo "  ✓ geral.pal criado"
    cp "$WORDS_PAIRS_FILE" "$OUTPUT_DIR/geral.par" && echo "  ✓ geral.par criado"
    cp "$SENTENCES_FILE" "$OUTPUT_DIR/geral.frs" && echo "  ✓ geral.frs criado"
    cp "$SENTENCES_PAIRS_FILE" "$OUTPUT_DIR/geral.paf" && echo "  ✓ geral.paf criado"

    echo ""
    echo "=========================================="
    echo "✓ Ficheiros preparados!"
    echo "=========================================="
    echo ""
    echo "Localização: $OUTPUT_DIR/"
    echo ""

    # Mostrar estatísticas
    echo "Ficheiros criados:"
    local WORDS_COUNT=$(wc -l < "$OUTPUT_DIR/geral.pal")
    local PAIRS_COUNT=$(wc -l < "$OUTPUT_DIR/geral.par")
    local SENTENCES_COUNT=$(wc -l < "$OUTPUT_DIR/geral.frs")
    local SENTENCE_PAIRS_COUNT=$(wc -l < "$OUTPUT_DIR/geral.paf")

    echo "  • geral.pal - Palavras ($WORDS_COUNT entradas)"
    echo "  • geral.par - Pares de palavras ($PAIRS_COUNT entradas)"
    echo "  • geral.frs - Frases ($SENTENCES_COUNT entradas)"
    echo "  • geral.paf - Pares de frases ($SENTENCE_PAIRS_COUNT entradas)"
    echo ""
    echo "=========================================="
    echo "Como instalar:"
    echo "=========================================="
    echo ""
    echo "1. Copie os 4 ficheiros da pasta 'eugenio_install/' para:"
    echo ""
    echo "   Windows:"
    echo "   C:\\Users\\[SEU_USERNAME]\\AppData\\Roaming\\LabSI2-INESC-ID\\Eugénio 3.0"
    echo ""
    echo "2. Feche o Eugénio (se estiver aberto)"
    echo ""
    echo "3. Abra o Eugénio V3 e teste!"
    echo ""
    echo "Consulte INSTALACAO_EUGENIO.md para mais detalhes."
    echo ""
}

# Loop principal
while true; do
    read -p "Escolha uma opção [0-11]: " choice

    case $choice in
        1)
            execute_script "create_sub_corpus_req2.sh" "Requisito 2 - Criar sub-corpus"
            pause
            ;;
        2)
            execute_script "corpus_info_req3.sh" "Requisito 3 - Métricas do corpus"
            pause
            ;;
        3)
            execute_script "create_words_req4.sh" "Requisito 4 - Ficheiro de palavras"
            pause
            ;;
        4)
            execute_script "create_word_pairs_req5.sh" "Requisito 5 - Pares de palavras"
            pause
            ;;
        5)
            execute_script "verify_word_pairs_req6.sh" "Requisito 6 - Verificação de palavras"
            pause
            ;;
        6)
            execute_script "create_sentences_req7.sh" "Requisito 7 - Ficheiro de frases"
            pause
            ;;
        7)
            execute_script "create_sentence_pairs_req8.sh" "Requisito 8 - Pares de frases"
            pause
            ;;
        8)
            execute_script "verify_sentence_pairs_req9.sh" "Requisito 9 - Verificação de frases"
            pause
            ;;
        9)
            execute_script "limit_entries_req10.sh" "Requisito 10 - Limitar entradas"
            pause
            ;;
        10)
            prepare_eugenio_files
            pause
            ;;
        11)
            echo ""
            echo "=========================================="
            echo ">>> Executando TODOS os scripts"
            echo "=========================================="
            execute_script "create_sub_corpus_req2.sh" "Requisito 2 - Criar sub-corpus"
            execute_script "corpus_info_req3.sh" "Requisito 3 - Métricas do corpus"
            execute_script "create_words_req4.sh" "Requisito 4 - Ficheiro de palavras"
            execute_script "create_word_pairs_req5.sh" "Requisito 5 - Pares de palavras"
            execute_script "verify_word_pairs_req6.sh" "Requisito 6 - Verificação de palavras"
            execute_script "create_sentences_req7.sh" "Requisito 7 - Ficheiro de frases"
            execute_script "create_sentence_pairs_req8.sh" "Requisito 8 - Pares de frases"
            execute_script "verify_sentence_pairs_req9.sh" "Requisito 9 - Verificação de frases"
            execute_script "limit_entries_req10.sh" "Requisito 10 - Limitar entradas"
            prepare_eugenio_files
            echo ""
            echo "=========================================="
            echo "✓ TODOS os scripts foram executados!"
            echo "=========================================="
            pause
            ;;
        0)
            echo ""
            echo "A sair... Até breve!"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo "✗ Opção inválida! Escolha um número entre 0 e 11."
            echo ""
            pause
            ;;
    esac

    # Limpar ecrã e mostrar menu novamente
    clear
    echo "=========================================="
    echo "  MASTER SCRIPT - TG1 Eugénio Italiano"
    echo "=========================================="
    echo ""
    echo "Scripts disponíveis:"
    echo ""
    echo "  1) Requisito 2 - Criar sub-corpus (200k linhas)"
    echo "  2) Requisito 3 - Calcular métricas do corpus"
    echo "  3) Requisito 4 - Criar ficheiro de palavras"
    echo "  4) Requisito 5 - Criar ficheiro de pares de palavras"
    echo "  5) Requisito 6 - Verificar palavras nos pares"
    echo "  6) Requisito 7 - Criar ficheiro de frases"
    echo "  7) Requisito 8 - Criar ficheiro de pares de frases"
    echo "  8) Requisito 9 - Verificar frases nos pares"
    echo "  9) Requisito 10 - Limitar dicionários a 250.000 entradas"
    echo ""
    echo " 10) Preparar ficheiros para instalação no Eugénio"
    echo ""
    echo " 11) Executar TODOS os scripts (ordem correta)"
    echo ""
    echo "  0) Sair"
    echo ""
    echo "=========================================="
    echo ""
done
