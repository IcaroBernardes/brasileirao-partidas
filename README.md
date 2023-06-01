# Calendário circular de partidas do Brasileirão

**Desde 2006 a Série A do Brasileirão adotou um modelo de 38 rodadas com 20 clubes. Essa página exibe informações sobre o desempenho dos 42 clubes que participaram desse formato do campeonato (ao menos uma temporada) através de um calendário circular.** 

![](www/readme/thumb.png)

## Construção da página

Um dos objetivos desse projeto é acrescentar mais ferramentas de interativade à minha caixa de ferramentas enquanto programador em R. São pilares desse esforço:
- a geração de gráficos interativos em {ggiraph}
- a produção de documentos parametrizados no Quarto
- o uso do R como suporte ao JS
- a produção de páginas com HTML+CSS+JS

### Geração de gráficos interativos em {ggiraph}

📃 Código em [gerador.qmd](https://github.com/IcaroBernardes/calendario-brasileirao/blob/master/gerador.qmd)

Nesse script os dados são processados de sorte a gerar uma visualização na perspectiva de cada um dos clubes. Para tal, os dados foram manejados com abundante uso de {dplyr} e {purrr}. Em seguida, os elementos que compõem a visualização receberam coordenadas no plano cartesiano. Por fim, estes elementos foram agregados para compor o gráfico interativo com {ggiraph}.

![](www/readme/gerador1.png)

É interessante destacar um "hack" que permitiu o uso de imagens também como elementos interativos a partir de uma modificação da função ggpath::geom_from_path(). Além disso, a função do script gerador é ser um template para produção parametrizada dos documentos HTML que irão guardar os gráficos interativos. Tarefa essa extremamente simples de concretizar.

![](www/readme/gerador2.png)



## Créditos

Página feita por Ícaro Bernardes com R e HTML+CSS+JS.

**Perfis digitais:**
- Twitter: [@icarobsc](https://twitter.com/icarobsc)
- Github: [@IcaroBernardes](https://github.com/IcaroBernardes)
- Linkedin: [@icarobsc](https://www.linkedin.com/in/icarobsc)

Dados obtidos através do pacote [{brasileirao}](https://github.com/williamorim/brasileirao) criado por [William Amorim](https://github.com/williamorim).
