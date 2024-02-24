<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
    <head>
        <%@include file="/WEB-INF/jsp/estrutura/ImportBot.jsp"%>      
        <script type="text/javascript" src="resources/jss/index.js"></script>


    </head>

    <body>
        <div>

            <%@include file="/WEB-INF/jsp/estrutura/header.jsp"%>
            <div class="container conteudo" >
                ${mensagemLogin}
                ${sucessoEdicao}
                ${sucessoLogout}
                <div class="sidenav">
                    <h3><b>Categorias</b></h3>
                    <jsp:useBean id="dao2" class="DAO.DAOCategoria">
                        <c:forEach var="categoria" items="${dao2.retornaCategorias()}">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="${categoria.idCategoria}">
                                <label class="form-item"><c:out escapeXml="false" value="${categoria.nomeCategoria}"></c:out></label>
                                </div>
                        </c:forEach>
                    </jsp:useBean>
                </div>

                <div class=" restante carousel1 carousel ">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Últimos <b>Produtos</b> Cadastrados</h2>
                            <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
                                <!-- Carousel indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>   
                                <!-- Wrapper for carousel items -->
                                <jsp:useBean id="dao" class="DAO.DAOProduto">

                                    <div class="carousel-inner">
                                        <div class="item carousel-item active">
                                            <div class="row"> 

                                                <c:forEach var="produto" items="${dao.selecionarProdutosRecentes()}" varStatus="indice">
                                                    <c:if test="${indice.index==0}">

                                                        <div class="col-md-6">
                                                            <div class="thumb-wrapper">
                                                                <div class="img-box">
                                                                    <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary"><img id="imagem" src="RecuperarImagem?codigo=${produto.codigo}"></a> 
                                                                </div>
                                                                <div class="thumb-content">
                                                                    <h4><c:out escapeXml="false" value="${produto.nomeProduto}"></c:out></h4>
                                                                    <p class="item-price"> <span>R$<c:out escapeXml="false" value="${produto.preco}"></c:out></span></p>

                                                                        <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary">Comprar</a>
                                                                </div>						
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach var="produto" items="${dao.selecionarProdutosRecentes()}" varStatus="indice">
                                                    <c:if test="${indice.index==1}">
                                                        <div class="col-md-6">
                                                            <div class="thumb-wrapper">
                                                                <div class="img-box">
                                                                    <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary"><img id="imagem" src="RecuperarImagem?codigo=${produto.codigo}"></a>
                                                                </div>
                                                                <div class="thumb-content">
                                                                    <h4><c:out escapeXml="false" value="${produto.nomeProduto}"></c:out></h4>
                                                                    <p class="item-price"> <span>R$<c:out escapeXml="false" value="${produto.preco}"></c:out></span></p>

                                                                        <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary">Comprar</a>
                                                                </div>						
                                                            </div>
                                                        </div>

                                                    </c:if>
                                                </c:forEach>

                                            </div>
                                        </div>  
                                        <div class="item carousel-item">
                                            <div class="row">
                                                <c:forEach var="produto" items="${dao.selecionarProdutosRecentes()}" varStatus="indice">
                                                    <c:if test="${indice.index==2}">
                                                        <div class="col-md-6">
                                                            <div class="thumb-wrapper">
                                                                <div class="img-box">
                                                                    <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary"><img id="imagem" src="RecuperarImagem?codigo=${produto.codigo}"></a>
                                                                </div>
                                                                <div class="thumb-content">
                                                                    <h4><c:out escapeXml="false" value="${produto.nomeProduto}"></c:out></h4>
                                                                    <p class="item-price"><span>R$<c:out escapeXml="false" value="${produto.preco}"></c:out></span></p>

                                                                        <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary">Comprar</a>
                                                                </div>						
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach var="produto" items="${dao.selecionarProdutosRecentes()}" varStatus="indice">
                                                    <c:if test="${indice.index==3}">
                                                        <div class="col-md-6">
                                                            <div class="thumb-wrapper">
                                                                <div class="img-box">
                                                                    <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary"><img id="imagem" src="RecuperarImagem?codigo=${produto.codigo}"></a>
                                                                </div>
                                                                <div class="thumb-content">
                                                                    <h4><c:out escapeXml="false" value="${produto.nomeProduto}"></c:out></h4>
                                                                    <p class="item-price"><span>R$<c:out escapeXml="false" value="${produto.preco}"></c:out></span></p>

                                                                        <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary">Comprar</a>
                                                                </div>						
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="item carousel-item">
                                            <div class="row">
                                                <c:forEach var="produto" items="${dao.selecionarProdutosRecentes()}" varStatus="indice">
                                                    <c:if test="${indice.index==4}">
                                                        <div class="col-md-6">
                                                            <div class="thumb-wrapper">
                                                                <div class="img-box">
                                                                    <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary"> <img id="imagem" src="RecuperarImagem?codigo=${produto.codigo}"></a>
                                                                </div>
                                                                <div class="thumb-content">
                                                                    <h4><c:out escapeXml="false" value="${produto.nomeProduto}"></c:out></h4>
                                                                    <p class="item-price"> <span>R$<c:out escapeXml="false" value="${produto.preco}"></c:out></span></p>

                                                                        <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary">Comprar</a>
                                                                </div>						
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach var="produto" items="${dao.selecionarProdutosRecentes()}" varStatus="indice">
                                                    <c:if test="${indice.index==5}">
                                                        <div class="col-md-6">
                                                            <div class="thumb-wrapper">
                                                                <div class="img-box">
                                                                    <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary"> <img id="imagem" src="RecuperarImagem?codigo=${produto.codigo}"></a>
                                                                </div>
                                                                <div class="thumb-content">
                                                                    <h4><c:out escapeXml="false" value="${produto.nomeProduto}"></c:out></h4>
                                                                    <p class="item-price"><span>R$<c:out escapeXml="false" value="${produto.preco}"></c:out></span></p>

                                                                        <a href="compraProdutos?codigo=${produto.codigo}" class="btn btn-primary">Comprar</a>
                                                                </div>						
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>

                                    </div>

                                </jsp:useBean>
                                <!-- Carousel controls -->
                                <a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                                <a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <h2>Comprar<b> Produtos</b></h2>
                    <jsp:useBean id="dao0" class="DAO.DAOProduto">
                        <c:forEach var="produto" items="${dao0.obterProdutos()}">
                            <div>
                                <div class="col-md-4 thumb-wrapper">
                                    <div class="img-box">
                                        <a href="compraProdutos?codigo=${produto.codigo}"><img id="imagem" src="RecuperarImagem?codigo=${produto.codigo}"></a> 
                                    </div>
                                    <div class="thumb-content">
                                        <h4>${produto.nomeProduto}</h4>
                                        <p class="item-price"> <span>R$${produto.preco}</span></p> <a class="btn btn-primary" href="compraProdutos?codigo=${produto.codigo}">Comprar</a>
                                    </div>
                                </div> 
                            </div>
                        </c:forEach>
                    </jsp:useBean>
                </div>

            </div>
        </div>
        <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>   

    </body>
</html>
