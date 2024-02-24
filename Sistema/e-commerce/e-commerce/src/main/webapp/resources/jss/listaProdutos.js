
/* global produtos */

$(document).ready(function () {

    $('#produtos').dataTable({
        "pagingType": "full_numbers",
        "ajax": "grid",
        "columns": [
            {"data": "nomeProduto"},
            {"data": "codigo"},
            {"data": "nomeCategoria"},
            {"data": "quantidadeProduto"},
            {"data": "preco"},
            {"data": "editar"}

        ]
    });

});

