<%-- 
    Document   : cadFunc
    Created on : 28/08/2017, 22:10:15
    Author     : thiag
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
    obj.setEmpresa(objEmpresa);
    obj.setCargo(objCargo);
    
    if (FuncionarioDAO.salvarFuncionario(obj) > 0) {
        out.print("Salvo com sucesso");
    }else{
        out.print("Falha na inserção");
    }
%> 
