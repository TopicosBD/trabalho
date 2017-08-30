<%-- 
    Document   : cadFunc
    Created on : 28/08/2017, 22:10:15
    Author     : thiag
--%>

<%@page import="negocio.Cargo"%>
<%@page import="model.FuncionarioDAO"%>  
<jsp:useBean id="obj" class="negocio.Funcionario"/>
<jsp:useBean id="objCargo" class="negocio.Cargo"/>
<jsp:useBean id="objEmpresa" class="negocio.Empresa"/>

<jsp:setProperty property="cpf" name="obj"/>
<jsp:setProperty property="nome" name="obj"/>
<jsp:setProperty property="dataNascimento" name="obj"/>
<jsp:setProperty property="endereco" name="obj"/>
<jsp:setProperty property="telefone" name="obj"/>
<jsp:setProperty property="idCargo" name="objCargo"/>
<jsp:setProperty property="idEmpresa" name="objEmpresa"/>

<%
    int status;
    ///obj.setDataNascimento(obj.converterStringData(obj.));
    obj.setEmpresa(objEmpresa);
    obj.setCargo(objCargo);
    
    status = FuncionarioDAO.salvarFuncionario(obj);
    if (status > 0) {
        out.print("Salvo com sucesso");
    }else{
        out.print("Falha na inserção");
    }

%> 
