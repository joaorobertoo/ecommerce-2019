$(document).ready(function(){
    $(".form-check-input").click(function(){
        var valores_cat = [];
//        if($(".form-check-input").prop("checked")==false){
//            $(".carousel1").html("");
//            $(".carousel1").append("<h2>Comprar <b>Produtos</b></h2>");
//        }
        $(".form-check-input:checked").each(function(i){
          valores_cat[i] = $(this).val();
       }); 
       
       $.ajax({
           method: "POST",
           url: "filtrarPorCategoria",
           data: {"categorias" : valores_cat.toString()},
           dataType: "json",
           success: function(produtos){
               $(".carousel1").html("");
               $(".carousel1").append("<h2>Comprar <b>Produtos</b></h2>");
               for(var i=0; i<produtos["data"].length; i++){
                   $(".carousel1").append("\
                           <div>\
                                    <div class='col-md-4 thumb-wrapper'>\
                                        <div class='img-box'>\
                                            <a href='compraProdutos?codigo="+produtos["data"][i]["codigo"]+"'><img id='imagem' src='RecuperarImagem?codigo="+produtos["data"][i]["codigo"]+"'></a> \
                                        </div>\
                                        <div class='thumb-content'>\
                                            <h4>"+produtos["data"][i]["nomeProduto"]+"</h4>\
                                            <p class='item-price'> <span>R$"+produtos["data"][i]["preco"]+"</span></p> <a class='btn btn-primary' href='compraProdutos?codigo="+produtos["data"][i]["codigo"]+"'>Comprar</a></div></div> \
                                    </div> "
                   );
               }
           } 
       });
    });
    
});