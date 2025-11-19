# TG1 -- UC-Sistemas Operativos

# Realizado por:
Francisco Soudo

Miguel Pauzinho

Trabalho Prático (IPBeja)

## 📌 Descrição

Este projeto contém um conjunto de scripts em **Shell** desenvolvidos
para o Trabalho Guiado 1 de **Sistemas Operativos**.\
O objetivo é processar e analisar um corpus de texto, criando ficheiros
derivados, estatísticas, dicionários de palavras e dicionários de
frases.

Os scripts permitem:

-   Preparar a estrutura necessária do trabalho\
-   Organizar e converter o corpus\
-   Extrair estatísticas do conteúdo\
-   Criar listas e dicionários a partir do ficheiro base

------------------------------------------------------------------------

## 📂 Estrutura de Diretórios

``` bash
tg1/
├── scripts/         # Scripts dos exercícios (ex2.sh, ex3.sh, …)
├── corpus/          # Corpus original (ex: paisa.raw.utf8)
├── corpus_txt/      # Versões tratadas do corpus
├── corpus_info/     # Ficheiros com estatísticas extraídas
├── words_dict/      # Dicionários/listas de palavras
└── sentences_dict/  # Dicionários/listas de frases
```

Para criar a estrutura:

``` bash
mkdir -p tg1/{scripts,corpus,corpus_txt,corpus_info,words_dict,sentences_dict}
```

------------------------------------------------------------------------

## 📥 Instalação

``` bash
git clone https://github.com/Fsoudo/Sistemas-Operativos-TG1.git
cd Sistemas-Operativos-TG1
```

Se um ficheiro `.zip` com scripts for fornecido, extrair o conteúdo
para:

    tg1/scripts/

------------------------------------------------------------------------

## 📄 Colocação do Ficheiro de Corpus

Colocar o ficheiro do corpus (ex.: `paisa.raw.utf8`) em:

    tg1/corpus/

Exemplo:

``` bash
cp paisa.raw.utf8 tg1/corpus/
```

------------------------------------------------------------------------

## ▶️ Execução dos Scripts

1.  Aceder à pasta principal:

``` bash
cd tg1
```

2.  Dar permissões de execução:

``` bash
chmod +x scripts/*.sh
```

3.  Executar cada exercício individualmente:

``` bash
./scripts/NOME_DO_SCRIPT.sh
```

Exemplos:

``` bash
./scripts/ex2.sh
./scripts/ex3.sh
./scripts/ex4.sh
```

------------------------------------------------------------------------

## 📤 Resultados

Os resultados variam por exercício e são guardados nas seguintes pastas:

-   **corpus_txt/** --- versões tratadas do corpus\
-   **corpus_info/** --- estatísticas e resumos\
-   **words_dict/** --- listas e dicionários de palavras\
-   **sentences_dict/** --- frases e segmentos extraídos

Para visualizar:

``` bash
ls corpus_txt/
ls corpus_info/
ls words_dict/
ls sentences_dict/
```

Exemplo de pré-visualização:

``` bash
head corpus_info/*.txt
head words_dict/*.txt
```

------------------------------------------------------------------------

## ❗ Erros Comuns

### ❌ "Permission denied"

Falta de permissões de execução:

``` bash
chmod +x scripts/*.sh
```

### ❌ "No such file or directory"

O corpus pode estar no local errado --- confirmar que está em `corpus/`.

### ❌ Resultados vazios

Verificar se o ficheiro do corpus foi carregado corretamente e se o
caminho usado nos scripts corresponde ao real.

------------------------------------------------------------------------

## 📎 Notas Finais

-   Este repositório implementa o TG1 de Sistemas Operativos.
-   Os nomes dos scripts podem variar consoante a tua versão
-   Qualquer alteração à estrutura deve ser atualizada também neste
    documento.

------------------------------------------------------------------------
