<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Compra</title>
        <%@include file="/WEB-INF/jsp/estrutura/ImportBot.jsp"%> 

        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/compraProdutos.css"/>

        <script type="text/javascript" src="resources/jss/compraProdutos.js"></script>
    </head>
    <body>
        <div>
            <%@include file="/WEB-INF/jsp/estrutura/header.jsp"%>
            <div class="container conteudo" >
                ${mensagemCompra}
                <div class="col-md-offset-2 ">

                <div class="row">
                    <div class="col-md-4 item-photo">
                        <img style="max-width:100%;" src="RecuperarImagem?codigo=${Produto.codigo}" />
                    </div>
                    <div class="col-md-5" style="border:0px solid gray">
                        <!-- titulo produto -->
                        <h3 class="nomeProd">${Produto.nomeProduto}</h3>    
                        <h5><strong>Código: ${Produto.codigo}</strong> </h5>
                        <h5><strong>Categoria: ${Produto.categoria.nomeCategoria}</strong></h5>

                        <!-- precos -->
                        <h6 class="title-price">Preço</h6>
                        <h3 style="margin-top:0px;" class="title-price">R$${Produto.preco}</h3>
                        
                        <form action="realizarCompra" id="realizarCompra" method="POST" >
                            <input name="codigo" type= hidden value="${Produto.codigo}">
                            
                            <input name="preco" type= hidden value="${Produto.preco}">
                            <!-- detalhes do produto -->                     
                            <div class="section" style="padding-bottom:20px;">
                                <h6 class="title-attr"><small>Quantidade</small></h6>                    
                                <div>
                                    <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>

                                    <input name="quantidade" value="1" id="quantidadeProduto"/>
                                    
                                    <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                                </div>
                            </div>                

                            <!-- Botoes de compra -->
                            <div class="section" style="padding-bottom:20px;">
                                <button class="btn btn-primary" type="submit"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Comprar</button>
                        </form>
                            <input id="quantidadeMax" type="hidden" value="${Produto.quantidadeProduto}"/>
                    </div>                                        
                </div>                              


            </div>

            <div class="col-xs-9">
                <ul class="menu-items">
                    <li class="active"><strong>Descrição</strong></li>

                </ul>
                <div style="width:100%;border-top:1px solid silver">

                    
                    <h5><strong>${Produto.descricao}</strong>  </h5>
                    
                </div>
            </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>
</body>
</html>
