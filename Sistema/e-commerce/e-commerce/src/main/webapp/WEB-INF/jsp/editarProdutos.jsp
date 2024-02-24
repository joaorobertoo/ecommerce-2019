<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jsp/estrutura/ImportBot.jsp"%>  
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/editarProdutos.css"/>
        <script src="<%=request.getContextPath()%>/resources/jss/editarProdutos.js"></script>
    </head>
    <body>
        <div>

            <%@include file="/WEB-INF/jsp/estrutura/header.jsp"%>
            <div class="container conteudo">
                ${mensagemFalhaEdicao}
                <h2>Editar <b>Produtos</b></h2>
                <form:form action="editarProduto" id="editarProduto" commandName="Produto" method="POST" enctype="multipart/form-data">
                    <div class="col-md-offset-2">
                        <div>
                            <span class="row">
                                <img id="imagem" src="RecuperarImagem?codigo=${Produto.codigo}"> 
                            </span>
                            <div class="row col-md-offset-3">
                                <div class="form-group  col-md-9">
                                    <form:label path="nomeProduto" for="nomeProduto">Nome</form:label>
                                    <form:input id="nomeProduto" type="text" path="nomeProduto" cssClass="form-control" required="required" />

                                </div>
                                    
                                    <form:input type="hidden" id="codigo"  path="codigo"  value="${Produto.codigo}" />
                                
                            </div>
                            <div class="row col-md-offset-3">
                                <div class="form-group  col-md-4">
                                    <jsp:useBean id="dao" class="DAO.DAOCategoria">
                                        <form:label path="Categoria" for="categoria">Categoria</form:label>
                                        <form:select id="categoria"  path="Categoria.idCategoria" cssClass="form-control" > 
                                            <form:option value="0">--Selecione uma opção--</form:option>
                                            <form:options items="${dao.retornaCategorias()}" itemValue="idCategoria" itemLabel="nomeCategoria"></form:options>                                                                   
                                        </form:select>
                                    </jsp:useBean>

                                </div>
                                <div class="form-group  col-md-3">
                                    <form:label path="preco" for="preco" name="preco" >Preço</form:label>
                                    <form:input id="preco"  path="preco" cssClass="form-control" maxlength="13" required="" />

                                </div>
                                <div class="form-group  col-md-2">
                                    <form:label path="quantidadeProduto" for="quantidadeProduto">Quantidade</form:label>
                                    <form:input id="quantidadeProduto" type="text" path="quantidadeProduto" cssClass="form-control"  />

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" form-group col-md-10">
                                <form:label path="descricao" for="descricao">Descrição</form:label>
                                <form:textarea id="descricao" type="text" path="descricao" cssClass="form-control"  />
                            </div>


                        </div>
                        <div class="row form-group col-md-4">
                            <input style="min-height: 10px" id="imagem" type="file" name="file" class="form-control"/>
                        </div>
                        <div class="row form-group">

                            <div class=" col-md-offset-4">
                                <button  class="col-md-4 btn btn-primary" >Gravar</button>
                                <!--                            <button action="excluir" class="btn btn-danger excluir" >Excluir</button>-->
                            </div>

                        </div>
                    </form:form>
                </div>
            </div>
            <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>   
        </div>
    </body>

</html>
