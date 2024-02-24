<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jsp/estrutura/ImportBot.jsp"%>        
        <script src="<%=request.getContextPath()%>/resources/jss/editarUsuarios.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/jss/jquery.mask.min.js"></script>   
    </head>
    <body>

        <%@include file="/WEB-INF/jsp/estrutura/header.jsp"%>

        <div class="container conteudo">
            
            <form:form action="editarUsuario" id="editarUsuario" commandName="Usuario" method="POST">

                <form:input type="hidden" path="admin" value="${Usuario.admin}" ></form:input>
                <div >
                    ${erroEdicao}
                    <h2>Editar <b>Dados</b></h2>
                    <div style="background-color: #4ED4E8"></div>

                </div>
                <!-- Text input-->
                <div class="row col-md-offset-2">
                    <div class="form-group  col-md-10">
                        <form:label path="nomeUsuario" for="nome">Nome</form:label>
                        <form:input  id="nomeUsuario" type="text" path="nomeUsuario" cssClass="form-control" required="required" />

                    </div>
                </div>
                <div class="row col-md-offset-2">
                    <div class="form-group col-md-5 ">
                        <form:label path="email" for="email" >Email</form:label>
                        <form:input id="email" type="email" path="email" cssClass="form-control" required="required"/> 
                    </div>

                    <div class="form-group col-md-5">
                        <form:label path="cpf" for="cpf">CPF</form:label>
                        <form:input readonly="true" id="cpf" type="text" path="cpf" cssClass="form-control" required="required"/> 
                    </div>

                </div>

                <div class="row col-md-offset-2">
                    <div class="form-group col-md-5">
                        <form:label path="senha" for="senha">Senha</form:label>
                        <form:input id="senha" type="password" path="senha" cssClass="form-control" required="required"/> 
                    </div>
                    <div class="form-group col-md-5">
                        <label for="confirmaSenha">Confirmar senha</label>
                        <input id="confirmaSenha" type="password"  class="form-control"  name="confirmaSenha"required="required"> 
                    </div>

                </div>
                <div class="row col-md-offset-2">
                    <div class="form-group col-md-10">
                        <form:label path="estado" for="estado">Estado</form:label>
                        <form:select id="estado"  path="estado" cssClass="form-control" required="required"> 
                            
                            <form:option value="0">--Selecione uma opção--</form:option>
                            <form:option value="AC">Acre</form:option>
                            <form:option value="AL">Alagoas</form:option>
                            <form:option value="AP">Amapá</form:option>
                            <form:option value="AM">Amazonas</form:option>
                            <form:option value="BA">Bahia</form:option>
                            <form:option value="CE">Ceará</form:option>
                            <form:option value="DF">Distrito Federal</form:option>
                            <form:option value="ES">Espírito Santo</form:option>
                            <form:option value="GO">Goiás</form:option>
                            <form:option value="MA">Maranhão</form:option>
                            <form:option value="MT">Mato Grosso</form:option>
                            <form:option value="MS">Mato Grosso do Sul</form:option>
                            <form:option value="MG">Minas Gerais</form:option>
                            <form:option value="PA">Pará</form:option>
                            <form:option value="PB">Paraíba</form:option>
                            <form:option value="PR">Paraná</form:option>
                            <form:option value="PE">Pernambuco</form:option>
                            <form:option value="PI">Piauí</form:option>
                            <form:option value="RJ">Rio de Janeiro</form:option>
                            <form:option value="RN">Rio Grande do Norte</form:option>
                            <form:option value="RS">Rio Grande do Sul</form:option>
                            <form:option value="RO">Rondônia</form:option>
                            <form:option value="RR">Roraima</form:option>
                            <form:option value="SC">Santa Catarina</form:option>
                            <form:option value="SP">São Paulo</form:option>
                            <form:option value="SE">Sergipe</form:option>
                            <form:option value="TO">Tocantins</form:option>
                        </form:select>
                    </div> 
                </div>


                <div class="row col-md-offset-2">
                    <div class="form-group col-md-5 ">
                        <form:label path="cidade" for="cidade">Cidade</form:label>
                        <form:input id="cidade" type="text" path="cidade" cssClass="form-control" required="required"/> 


                    </div>

                    <div class="form-group col-md-5 ">

                        <form:label path="bairro" for="bairro">Bairro</form:label>
                        <form:input id="bairro" type="text" path="bairro" cssClass="form-control" required="required"/> 

                    </div>
                </div>
                <div class="row col-md-offset-2" >
                    <div class="form-group col-md-5">
                        <form:label path="rua" for="rua">Rua</form:label>
                        <form:input id="rua" type="text" path="rua" cssClass="form-control" required="required"/> 


                    </div>

                    <div class="form-group col-md-5">
                        <form:label path="numero" for="numero">Numero</form:label>
                        <form:input id="numero" type="text" path="numero" cssClass="form-control" required="required"/> 
                    </div>
                </div>

                <!-- Button -->
                <div class="form-group">

                    <div class="col-md-2 col-md-offset-5">
                        <button  class="btn btn-primary" >Salvar Edição</button>
                        <span>${str}</span><span> ${str1}</span>
                    </div>
                </div>



            </form:form>

        </div>
        <%@include file="/WEB-INF/jsp/estrutura/footer.jsp"%>



    </body>
</html>