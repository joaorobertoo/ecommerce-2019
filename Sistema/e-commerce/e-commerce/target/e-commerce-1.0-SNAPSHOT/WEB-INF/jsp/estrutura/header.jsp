<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-inverse navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="index" ><b>Vende Tudo</b></a>
        </div>


        <c:choose>
            <c:when test="${sessionScope.usuarioLogado.nomeUsuario==null}">
                <div class="row col-md-offset-9">
                    
                        <span class="nav navbar-nav" style="margin-right: 5px"> <a href="index" class="navbar-link navbar-brand"><b>Página Inicial</b></a></span>
                        <a href="login" class="navbar-link navbar-brand"><b>Login</b></a>
                    
                </div>
            </c:when>
            <c:otherwise>

                <span class=" nav navbar-nav nav" style="color:#ffc000;font-weight: bold; margin-top: 15px">Bem vindo, ${sessionScope.usuarioLogado.nomeUsuario}.</span>
                
                <div class="row col-md-offset-5">
                    <span class="nav navbar-nav" style="margin-right: 5px"> <a href="index" class="navbar-link navbar-brand"><b>Página Inicial</b></a></span>
                    <c:choose>
                        <c:when test="${sessionScope.usuarioLogado.admin==false}">
                            <span class="nav navbar-nav" style="margin-right: 5px"> <a href="editarUsuarios?cpf=${usuarioLogado.cpf}" class=" navbar-link navbar-brand"><b>Meus dados</b></a></span>
                            <span class="nav navbar-nav" style="margin-right: 5px"> <a href="historicoDeCompras" class="navbar-link navbar-brand"><b>Histórico de compas</b></a></span>
                        </c:when>
                        <c:otherwise>
                            <span class="nav navbar-nav" style="margin-right: 5px"> <a href="editarUsuarios?cpf=${usuarioLogado.cpf}" class="navbar-link navbar-brand"><b>Meus dados</b></a></span>
                            <span class="nav navbar-nav" style="margin-right: 5px"> <a href="cadastroProdutos" class=" navbar-link navbar-brand"><b>Cadastrar produtos</b></a></span>
                            <span class="nav navbar-nav" style="margin-right: 5px"> <a href="listaProdutos" class=" navbar-link navbar-brand"><b>Visualizar produtos</b></a></span>
                        </c:otherwise>
                    </c:choose>
                    <form:form action="efetuaLogout" id="efetuaLogout" commandName="Usuario" method="POST">
                        <span>  <a class="navbar-link navbar-brand" href="efetuaLogout"><b>Logout</b></a></span>
                    </form:form>
                </c:otherwise> 
            </c:choose>
        </div>
    </div>
</nav>

