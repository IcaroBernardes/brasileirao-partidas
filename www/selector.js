// Gera o menu Selectize e define o efeito de sua seleção
$(document).ready(function () {
    $(function () {
        $("#menu").selectize({
            options: [
                { value: ["america-mg", "#105C00"], label: "América-MG" },
                { value: ["america-rn", "#5B1100"], label: "América RN" },
                { value: ["athletico-pr", "#5B1100"], label: "Athletico PR" },
                { value: ["atletico-go", "#5B1100"], label: "Atlético GO" },
                { value: "atletico-mg", label: "Atlético MG" },
                { value: ["avai", "#000A5C"], label: "Avaí" },
                { value: ["bahia", "#000A5C"], label: "Bahia" },
                { value: ["barueri", "#5B5000"], label: "Barueri" },
                { value: "botafogo", label: "Botafogo" },
                { value: "bragantino", label: "Bragantino" },
                { value: "ceara", label: "Ceará" },
                { value: "chapecoense", label: "Chapecoense" },
                { value: "corinthians", label: "Corinthians" },
                { value: "coritiba", label: "Coritiba" },
                { value: "criciuma", label: "Criciúma" },
                { value: "cruzeiro", label: "Cruzeiro" },
                { value: "csa", label: "CSA" },
                { value: "cuiaba", label: "Cuiabá" },
                { value: "figueirense", label: "Figueirense" },
                { value: "flamengo", label: "Flamengo" },
                { value: "fluminense", label: "Fluminense" },
                { value: "fortaleza", label: "Fortaleza" },
                { value: ["goias", "#105C00"], label: "Goiás" },
                { value: "gremio", label: "Grêmio" },
                { value: "guarani", label: "Guarani" },
                { value: "internacional", label: "Internacional" },
                { value: "ipatinga", label: "Ipatinga" },
                { value: "joinville", label: "Joinville" },
                { value: "juventude", label: "Juventude" },
                { value: "nautico", label: "Náutico" },
                { value: "palmeiras", label: "Palmeiras" },
                { value: "parana", label: "Paraná" },
                { value: "ponte-preta", label: "Ponte Preta" },
                { value: "portuguesa", label: "Portuguesa" },
                { value: "santa-cruz", label: "Santa Cruz" },
                { value: "santo-andre", label: "Santo André" },
                { value: "santos", label: "Santos" },
                { value: "sao-caetano", label: "São Caetano" },
                { value: "sao-paulo", label: "São Paulo" },
                { value: "sport", label: "Sport" },
                { value: "vasco-da-gama", label: "Vasco da Gama" },
                { value: "vitoria", label: "Vitória" },
            ],
            labelField: 'label',
            searchField: ['label', 'value'],
            placeholder: 'Selecione um time',
            delimiter: ',',
            onChange: function (value) {
                let teampage = value.split(",")[0] + '.html';
                $(document.documentElement).find('#content').fadeOut('slow');
                setTimeout(() => {
                    $(document.documentElement).find('#content').attr('src', teampage);
                }, 500);
                setTimeout(() => {
                    $(document.documentElement).find('#content').fadeIn('slow');
                }, 500);

                let styles = {
                    backgroundColor: value.split(",")[1],
                    boxShadow: value.split(",")[1] + " 2px 0 6px 3px"
                };
                $(document.documentElement).find('#sidebar').css(styles);
            }
        });
    });
});