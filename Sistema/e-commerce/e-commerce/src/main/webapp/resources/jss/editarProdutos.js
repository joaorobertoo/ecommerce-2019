
$(document).ready(function () {

    $("#quantidadeProduto").mask("00000");
    
    $("#preco").maskMoney({
         decimal: ".",
         thousands: ""
     });

    $("#editarProduto").submit(function (e) {


        if ($("#quantidadeProduto").val() < 0) {
            $("#quantidadeProduto").css("border-color", "red");
            alert("Insira uma quantidade positiva!");
            e.preventDefault();
        }
        if ($("#preco").val() < 0) {
            $("#preco").css("border-color", "red");
            alert("Insira um preço positivo!");
            e.preventDefault();
        }



    });

});