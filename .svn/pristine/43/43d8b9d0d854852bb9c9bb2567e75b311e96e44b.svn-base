$(document).ready(function () {
    $("#cpf").mask("000.000.000-00");
    $("#numero").mask("00000");

    $("#editarUsuario").submit(function (e) {

        if ($("#senha").val() !== $("#confirmaSenha").val()) {
            $("#senha").css("border-color", "red");
            $("#confirmaSenha").css("border-color", "red");
            alert("Senhas diferentes!");
            e.preventDefault();
        }
        if ($("#estado").val() === "0") {
            $("#estado").css("border-color", "red");
            alert("Selecione um estado!");
            e.preventDefault();
        }
        
    });



});