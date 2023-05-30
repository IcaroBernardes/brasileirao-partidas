// Gera o menu Selectize e define o efeito de sua seleção
$(document).ready(function () {
    $(function () {
        $("#menu").selectize({
            options: selectopts,
            labelField: 'label',
            searchField: ['label', 'value'],
            placeholder: 'Selecione um time',
            delimiter: ',',
            onChange: function (value) {

                // Define valores em função de haver ou não seleção
                let teamid = '';
                let teampage = '';
                let teamcolor = '';
                if (value === "") {
                    teamid = '#time1';
                    teampage = 'time1.html';
                    teamcolor = '#202020';
                } else {
                    teamid = '#' + value.split(",")[0];
                    teampage = value.split(",")[0] + '.html';
                    teamcolor = value.split(",")[1];
                }

                // Aplica a id e nome da página do clube selecionado
                $(document.documentElement).find('.content').fadeOut('slow');
                setTimeout(() => {
                    $(document.documentElement).find('.content').attr('src', '');
                    $(document.documentElement).find(teamid).attr('src', teampage);
                }, 500);
                setTimeout(() => {
                    $(document.documentElement).find(teamid).fadeIn('slow');
                }, 1500);


                // Aplica a cor da barra lateral e sua sombra
                let styles = {
                    backgroundColor: teamcolor,
                    boxShadow: teamcolor + " 2px 0 6px 3px"
                };
                $(document.documentElement).find('#sidebar').css(styles);
            }
        });
    });
});