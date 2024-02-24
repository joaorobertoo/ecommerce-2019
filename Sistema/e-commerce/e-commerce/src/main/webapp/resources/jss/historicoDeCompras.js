$(document).ready(function () {

    $("#dataCompra").mask("00-00-0000 00:00");

    $('#produtos').dataTable({
        "pagingType": "full_numbers",
        "ajax": "grid2",
        "columns": [
            {"data": "dataCompra"},
            {"data": "nomeProduto"},
            {"data": "nomeCategoria"},
            {"data": "quantidadeCompra"},
            {"data": "valor"},
            {"data": "visualizar"}

        ]
    });

});