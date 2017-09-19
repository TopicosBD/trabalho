<%-- 
    Document   : formFunc
    Created on : 28/08/2017, 22:52:00
    Author     : thiag
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="negocio.TipoExame"%>
<%@page import="model.TipoExameDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Json - Tipos de Exame</title>
        <link rel="stylesheet" href="style.css">
        <meta charset="UTF-8">
    </head>
    <body>
        <div class="content">
            <%
                List<TipoExame> tiposExame = new ArrayList<TipoExame>();
                tiposExame = TipoExameDAO.getTipoExames(5);
                for(int i = 0; i < tiposExame.size(); i++){
                    tiposExame.get(i).setExames(null);
                }                    
                Gson gson = new Gson();
                String json = gson.toJson(tiposExame);
            %>             
            <p><%=json%></p>
        </div>
    </body>
</html>
