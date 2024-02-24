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
                <div class=" col-md-offset-2">
                <h5 class="text-center">${mensagem}</h5>

                <div class="row">
                    <div class="col-xs-4 item-photo">
                        <img style="max-width:100%;" src="RecuperarImagem?codigo=${Compra.produto.codigo}" />
                    </div>
                    <div class="col-xs-5" style="border:0px solid gray">
                        <!-- titulo produto -->
                        <h3 class="nomeProd">${Compra.produto.nomeProduto}</h3>   
                        <h5><strong>Data: ${Compra.dataCompra} </strong></h5>
<!--                        <h5><strong>Código: ${Compra.produto.codigo} </strong></h5>-->
                        <h5><strong>Categoria: ${Compra.produto.categoria.nomeCategoria}</strong></h5>
                        <h5><strong>Quantidade comprada: ${Compra.quantidadeCompra}</strong></h5>
                        <!-- precos -->
                        <h6 class="title-price">Preço Unitário</h6>
                        <h3 style="margin-top:0px;" class="title-price">R$${Compra.produto.preco}</h3>
                        
                        <h6 class="title-price">Preço Total da Compra</h6>
                        <h3 style="margin-top:0px;" class="title-price">R$${Compra.valor}</h3>
                                                             
                                        
                </div>                              


            </div>

            <div class="col-xs-9">
                <ul class="menu-items">
                    <li class="active"><strong>Descrição</strong></li>

                </ul>
                <div style="width:100%;border-top:1px solid silver">

                    
                    <h5><strong>${Compra.produto.descricao} </strong> <h5>
                    
                </div>
            </div>

        </div>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>
</body>
</html>