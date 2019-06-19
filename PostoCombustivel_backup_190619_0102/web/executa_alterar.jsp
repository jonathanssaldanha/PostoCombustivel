<%-- 
    Document   : executa_alterar
    Created on : 14/06/2019, 23:10:26
    Author     : jonat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Posto"%>
<%@page import="dao.PostoDAO"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            try{
                Posto pro = new Posto();
                PostoDAO prd = new PostoDAO();
                if(request.getParameter("descricao").equals("") || request.getParameter("preco").equals("")){
                    response.sendRedirect("index.jsp");
                }else{
                    pro.setDescricao_produto(request.getParameter("descricao"));
                    pro.setPreco_produto(Double.parseDouble(request.getParameter("preco")));
                    pro.setPreco_gasolina(Double.parseDouble(request.getParameter("precoGasolina")));
                    pro.setCodigo_produto(Integer.parseInt(request.getParameter("codigo")));
                    prd.alterar(pro);
                    response.sendRedirect("index.jsp");
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro 8: " + erro);
            }
        %>
        
        
    </body>
</html>
