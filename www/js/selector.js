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
                console.log(value === "");
                // Define a id e nome da página do clube selecionado
                let teamid = '#' + value.split(",")[0];
                let teampage = value.split(",")[0] + '.html';
                $(document.documentElement).find('.content').fadeOut('slow');
                $(document.documentElement).find(teamid).fadeIn('slow');
                
                // Defina a cor da barra lateral em função do clube
                let styles = {
                    backgroundColor: value.split(",")[1],
                    boxShadow: value.split(",")[1] + " 2px 0 6px 3px"
                };
                $(document.documentElement).find('#sidebar').css(styles);
            }
        });
    });
});