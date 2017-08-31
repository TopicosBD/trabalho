<%-- 
    Document   : formFunc
    Created on : 28/08/2017, 22:52:00
    Author     : thiag
--%>

<%@page import="negocio.Empresa"%>
<%@page import="model.EmpresaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CargoDAO"%>
<%@page import="negocio.Cargo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Funcionário</title>
        <link rel="stylesheet" href="style.css">
        <meta charset="UTF-8">
    </head>
    <body>
        <header><h2>Cadastro de Funcionário</h2></header>
        <div class="content">
        <form name="Cadastrar" action = "cadFunc.jsp" method = "POST">
            <br><fieldset>
            <legend>Informe:</legend>
            CPF:<br> <input type="text" name="cpf" value="" onclick="this.value=''"/><br><br>  
            Nome:<br> <input type="text" name="nome"  value="" onclick="this.value=''"/><br><br>  
            Data de Nascimento:<br> <input type="text" name="dataNascimento"  value="" onclick="this.value=''"/><br><br>  
            Endereço:<br> <input type="text" name="endereco"  value="" onclick="this.value=''"/><br><br>  
            Telefone:<br> <input type="text" name="telefone"  value="" onclick="this.value=''"/><br><br>  
            Cargo:<br>
            <select name="idCargo">    
                <%
                    try {
                        Cargo cargo = new Cargo();
                        List cargos = CargoDAO.findAll();
                        Iterator<Cargo> ie = cargos.iterator();
                        while (ie.hasNext()) {
                            cargo = ie.next();
                            Integer id = cargo.getIdCargo();
                            String nome = cargo.getNome();
                %>
                            <option value="<%= id%>"><%= nome%></option>
                <%
                        }
                    } catch (Exception he) {
                        he.printStackTrace();
                    }
                %>
            </select> <br><br>  
            Empresa:<br>
            <select name="idEmpresa">    
                <%
                    try {
                        Empresa empresa = new Empresa();
                        List empresas = EmpresaDAO.getEmpresas(5);
                        Iterator<Empresa> ie = empresas.iterator();
                        while (ie.hasNext()) {
                            empresa = ie.next();
                            Integer id = empresa.getIdEmpresa();
                            String nome = empresa.getNomeFantasia();
                %>
                            <option value="<%= id%>"><%= nome%></option>
                <%
                        }
                    } catch (Exception he) {
                        he.printStackTrace();
                    }
                %>
            </select> <br><br>
            
            <input type="submit" value="Cadastrar"/>  
        </form>
        </div>
    </body>
</html>
