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
<%@page trimDirectiveWhitespaces="true"%>
<%
    List<TipoExame> tiposExame = new ArrayList<TipoExame>();
    tiposExame = TipoExameDAO.getTipoExames(5);
    for(int i = 0; i < tiposExame.size(); i++){
        tiposExame.get(i).setExames(null);
    }                    
    Gson gson = new Gson();
    String json = "{\"Lista\":" + gson.toJson(tiposExame) + "}";
%>
<%=json%>