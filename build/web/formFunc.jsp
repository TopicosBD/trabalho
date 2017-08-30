<%-- 
    Document   : formFunc
    Created on : 28/08/2017, 22:52:00
    Author     : thiag
--%>

<%@page import="negocio.Empresa"%>
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
                        Session s = HibernateUtil.getSessionFactory().openSession();
                        Transaction tx = s.beginTransaction();
                        Cargo se = new Cargo();
                        List li = s.createCriteria(Cargo.class).list();
                        s.flush();
                        s.close();
                        Iterator<Cargo> ie = li.iterator();
                        while (ie.hasNext()) {
                            se = ie.next();
                            Integer un = se.getIdCargo();
                            String no = se.getNome();
                %>
                            <option value="<%= un%>"><%= no%></option>
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
                        Session s = HibernateUtil.getSessionFactory().openSession();
                        Transaction tx = s.beginTransaction();
                        Empresa se = new Empresa();
                        List li = s.createCriteria(Empresa.class).list();
                        s.flush();
                        s.close();
                        Iterator<Empresa> ie = li.iterator();
                        while (ie.hasNext()) {
                            se = ie.next();
                            Integer un = se.getIdEmpresa();
                            String no = se.getNomeFantasia();
                %>
                            <option value="<%= un%>"><%= no%></option>
                <%
                        }
                    } catch (Exception he) {
                        he.printStackTrace();
                    }
                %>
            </select> <br><br>
            
            <input type="submit" value="Cadastrar"/>  
            <input type="reset" value="Limpar">
        </form>
        </div>
    </body>
</html>
