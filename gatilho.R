# 0. Setup inicial ##########
## Carrega bibliotecas
library(dplyr)
library(purrr)
library(quarto)

## Define nomes dos clubes e dos arquivos HTML que serão gerados
clubes <- dplyr::tibble(
  times = c("América MG", "América RN", "Athletico PR",
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
            "Sport", "Vasco da Gama", "Vitória"),
  nomes = c("america-mg", "america-rn", "athletico-pr",
            "atletico-go", "atletico-mg", "avai",
            "bahia", "barueri", "botafogo",
            "bragantino", "ceara", "chapecoense",
            "corinthians", "coritiba", "criciuma",
            "cruzeiro", "csa", "cuiaba",
            "figueirense", "flamengo", "fluminense",
            "fortaleza", "goias", "gremio",
            "guarani", "internacional", "ipatinga",
            "joinville", "juventude", "nautico",
            "palmeiras", "parana", "ponte-preta",
            "portuguesa", "santa-cruz", "santo-andre",
            "santos", "sao-caetano", "sao-paulo",
            "sport", "vasco-da-gama", "vitoria")
)

## Adiciona o tutorial
clubes <- clubes |> 
  dplyr::add_row(times = "time1", nomes = "time1")

# 1. Geração dos HTML ##########
## Gera um HTML para cada clube
purrr::pwalk(clubes, function(times, nomes) {
  quarto::quarto_render(
    input = "gerador.qmd",
    execute_params = list(clube = times),
    output_file = glue::glue("{nomes}.html")
  )
})
