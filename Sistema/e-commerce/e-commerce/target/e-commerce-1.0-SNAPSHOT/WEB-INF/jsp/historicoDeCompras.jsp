<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/WEB-INF/jsp/estrutura/ImportBot.jsp"%>   
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
        <script type="text/javascript" src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>

        <script src="<%=request.getContextPath()%>/resources/jss/historicoDeCompras.js"></script>
    </head>

    <body>
        <div>

            <%@include file="/WEB-INF/jsp/estrutura/header.jsp"%>
            <div class="container conteudo" >
                ${mensagemCompra}
                <h2><b>Histórico de</b> Compras</h2>
                <div class="col-md-offset-5 col-md-3 text-info">
                    <p> ${msg}</p>
                </div>
                <table id="produtos" class="cell-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>Data da Compra</th> 
                            <th>Nome do produto</th>
                            <th>Categoria</th>                          
                            <th>Quantidade</th>
                            <th>Preço</th> 
                            
                            <th>Visualizar Compra</th>
                        </tr>
                    </thead> 
                    <tfoot>
                        <tr>
                            <th>Data da Compra</th> 
                            <th>Nome do produto</th>
                            <th>Categoria</th>                          
                            <th>Quantidade</th>
                            <th>Preço</th>
                            
                            <th>Visualizar Compra</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>   
        </div>
    </body>
</html>