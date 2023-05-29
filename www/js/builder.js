// Insere os iframes dentro de #container
$(document).ready(function () {
    // Cria a estrutura HTML em forma de string
    let galleryHTML = teams.map((el) => {
        return "<iframe class='content' id='" + el + "' src=''>";
    });

    // Aplica a string ao #container como uma estrutura HTML
    $("#container").html(galleryHTML);
});