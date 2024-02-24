<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/WEB-INF/jsp/estrutura/ImportBot.jsp"%>     
        <script src="<%=request.getContextPath()%>/resources/jss/cadastroProdutos.js"></script>
    </head>

    <body>
        <div>

            <%@include file="/WEB-INF/jsp/estrutura/header.jsp"%>
            <div class="container conteudo">
                ${mensagemCodigoDuplicado}
                ${mensagemFalha}
                <h2>Cadastro de <b>Produtos</b></h2>
                <div class="col-md-offset-3">

                    <form:form action="salvarProduto" id="salvarProduto" commandName="Produto" method="POST" enctype="multipart/form-data">

                        <div>

                            <div class="row ">
                                <div class="form-group  col-md-4">
                                    <form:label path="codigo" for="codigo">Código</form:label>
                                    <form:input id="codigo" type="text" path="codigo" cssClass="form-control" required="required" />

                                </div>

                                <div class="form-group  col-md-4 ">
                                    <jsp:useBean id="dao" class="DAO.DAOCategoria">
                                        <form:label path="Categoria" for="categoria">Categoria</form:label>
                                        <form:select id="categoria"  path="Categoria.idCategoria" cssClass="form-control" > 
                                            <form:option value="0">--Selecione uma opção--</form:option>
                                            <form:options items="${dao.retornaCategorias()}" itemValue="idCategoria" itemLabel="nomeCategoria"></form:options>                                                                   
                                        </form:select>
                                    </jsp:useBean>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="form-group  col-md-4">
                                    <form:label path="nomeProduto" for="nomeProduto">Nome</form:label>
                                    <form:input id="nomeProduto" type="text" path="nomeProduto" cssClass="form-control" required="required" />

                                </div>
                                <div class="form-group  col-md-2">
                                    <form:label path="preco" for="preco" name="preco">Preço</form:label>
                                    <form:input id="preco"  path="preco" cssClass="form-control" maxlength="13" required="required" />

                                </div>
                                <div class="form-group  col-md-2">
                                    <form:label path="quantidadeProduto" for="quantidadeProduto">Quantidade</form:label>
                                    <form:input id="quantidadeProduto" type="text" path="quantidadeProduto" cssClass="form-control"  />

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-8">
                                <form:label path="descricao" for="descricao">Descrição</form:label>
                                <form:textarea id="descricao" type="text" path="descricao" cssClass="form-control"  />
                            </div>

                            <div class="form-group col-md-12 ">
                                <input style="min-height: 10px" id="imagem" type="file" name="file" Class="form-control" required="required"/>
                            </div>
                        </div>

                        <div class="row form-group col-md-offset-2">

                            
                                <button  class="col-md-2 btn btn-primary " id="salvar" >Gravar</button>
                                <button  class=" col-md-2 btn btn-primary" type="reset">Limpar</button>
                                
                            

                        </div>
                    </form:form>
                </div>
            </div>
            <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>   
        </div>
    </body>
</html>