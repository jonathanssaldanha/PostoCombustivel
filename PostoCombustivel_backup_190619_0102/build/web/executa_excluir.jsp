<%-- 
    Document   : executa_excluir
    Created on : 14/06/2019, 23:10:38
    Author     : jonat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.PostoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            try{
                PostoDAO prd = new PostoDAO();
                prd.excluir(Integer.parseInt(request.getParameter("codigo")));
                response.sendRedirect("index.jsp");
            }catch(Exception erro){
                throw new RuntimeException("Erro 9: " + erro);
            }
        %>
        
    </body>
</html>
