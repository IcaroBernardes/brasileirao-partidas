########## Cria objetos e matrizes JS para alimentar a página ##########
# 0. Setup inicial ##########
## Carrega os pacotes
library(dplyr)
library(glue)
library(jsonlite)
library(purrr)
library(tidyr)

# 1. Manejo dos dados ##########
## Cria uma tibble com o nome do clube, id do clube
## e cor do menu lateral associada
selectopts <- dplyr::tibble(
  value = list(
    c("america-mg", "#00804a"),
    c("america-rn", "#800900"),
    c("athletico-pr", "#700f0f"),
    c("atletico-go", "#770909"),
    c("atletico-mg", "#493e36"),
    c("avai", "#11436e"),
    c("bahia", "#183d67"),
    c("barueri", "#796c06"),
    c("botafogo", "#404040"),
    c("bragantino", "#770926"),
    c("ceara", "#404040"),
    c("chapecoense", "#037d42"),
    c("corinthians", "#404040"),
    c("coritiba", "#00806a"),
    c("criciuma", "#7a6606"),
    c("cruzeiro", "#05287a"),
    c("csa", "#063093"),
    c("cuiaba", "#027e3a"),
    c("figueirense", "#443c3e"),
    c("flamengo", "#6e1711"),
    c("fluminense", "#00804f"),
    c("fortaleza", "#143e6b"),
    c("goias", "#245b39"),
    c("gremio", "#085477"),
    c("guarani", "#008059"),
    c("internacional", "#7d0309"),
    c("ipatinga", "#305728"),
    c("joinville", "#413e3e"),
    c("juventude", "#0d723c"),
    c("nautico", "#760a0d"),
    c("palmeiras", "#008046"),
    c("parana", "#6a1b15"),
    c("ponte-preta", "#404040"),
    c("portuguesa", "#146b2d"),
    c("santa-cruz", "#771009"),
    c("santo-andre", "#7c6003"),
    c("santos", "#404040"),
    c("sao-caetano", "#00803e"),
    c("sao-paulo", "#760a0d"),
    c("sport", "#720d11"),
    c("vasco-da-gama", "#404040"),
    c("vitoria", "#800900")
  ),
  label = c(
    "América-MG", "América RN", "Athletico PR",
    "Atlético GO", "Atlético MG", "Avaí",
    "Bahia", "Barueri", "Botafogo",
    "Bragantino", "Ceará", "Chapecoense",
    "Corinthians", "Coritiba", "Criciúma",
    "Cruzeiro", "CSA", "Cuiabá",
    "Figueirense", "Flamengo", "Fluminense",
    "Fortaleza", "Goiás", "Grêmio",
    "Guarani", "Internacional", "Ipatinga",
    "Joinville", "Juventude", "Náutico",
    "Palmeiras", "Paraná", "Ponte Preta",
    "Portuguesa", "Santa Cruz", "Santo André",
    "Santos", "São Caetano", "São Paulo",
    "Sport", "Vasco da Gama", "Vitória"
    )
)

## Extrai as id dos clubes
buildlist <- selectopts$value |> purrr::map_chr(~.[1])

## Cria uma matriz de objetos JS
selectopts <- selectopts |> jsonlite::toJSON(pretty = TRUE)

## Adiciona a declação de "var" (variável global)
selectopts <- glue::glue("// Lista para menu de seleção
                         var selectopts = {selectopts}")

## Cria uma matriz de objetos JS
buildlist <- buildlist |> jsonlite::toJSON(pretty = TRUE)

## Adiciona a declação de "var" (variável global)
buildlist <- glue::glue("// Lista para preenchimento de #container
                         var teams = {buildlist}")

## Une todos os bancos em uma única string escrita em JS
alldata <- glue::glue_collapse(c(selectopts, buildlist),
                               sep = "\n\n")

## Escreve o JS com todos os dados
fileConn <- file("www/js/dataset.js")
writeLines(alldata, fileConn)
close(fileConn)
