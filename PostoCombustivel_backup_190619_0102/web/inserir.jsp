<%-- 
    Document   : inserir
    Created on : 14/06/2019, 23:35:35
    Author     : jonat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="executa_inserir.jsp" method="post">
<!--            <label>Codigo:</label><br/>
            <input type='text' name='codigo'/><br/>-->
            
            
            <label>Descrição:</label><br/>
            <input type='text' name='descricao'/><br/>
            
            <label>Preço Alcool:</label><br/>
            <input type='text' name='preco'/><br/>
            
            <label>Preço Gasolina:</label><br/>
            <input type='text' name='precoGasolina'/><br/>
            
            <button type="submit">
                OK
            </button>
            
            <a href="index.jsp">VOLTAR</a>
            
        </form>
        
        
    </body>
</html>
