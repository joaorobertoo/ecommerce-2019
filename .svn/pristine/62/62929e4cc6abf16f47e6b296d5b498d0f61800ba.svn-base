<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jsp/estrutura/ImportBot.jsp"%> 

    </head>
    <body>
        <div>
            <%@include file="/WEB-INF/jsp/estrutura/header.jsp"%>
            <div class="container conteudo" >
                <div >
                    ${sucessoCadastro}
                    ${mensagemLogin}
                    
                   

                </div>
                <div  class="">
                    <h2>Faça seu <b>Login</b></h2>

                    <div class="main">
                        <div class="">
                            <div class="login-form">
                                <form:form action="efetuaLogin" id="efetuaLogin" commandName="Usuario" method="POST">                       
                                    <fieldset>
                                        <div class="col-md-offset-4 form-group col-md-4">
                                            <form:label path="email" for="email">Email</form:label>
                                            <form:input id="email" type="text" path="email" cssClass="form-control" required=""/> 

                                        </div>
                                        <div class="form-group col-md-offset-4 col-md-4">
                                            <form:label path="senha" for="senha">Senha</form:label>
                                            <form:input id="senha" type="password" path="senha" cssClass="form-control" required=""/>
                                        </div>
                                        

                                        <div class="form-group col-md-offset-4 col-md-4">


                                            <button type="submit" class=" col-md-offset-2 btn btn-primary col-md-4">Login</button>

                                            <a type="submit" class= " btn btn-primary col-md-4" href="cadastroUsuarios">Registrar</a>
                                        </div>


                                    </fieldset>




                                </div>
                            </div>
                        </form:form>
                        <div>${mensagem}</div>
                    </div>
                </div>
            </div>
        </div>





        <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>
    </body>
</html>