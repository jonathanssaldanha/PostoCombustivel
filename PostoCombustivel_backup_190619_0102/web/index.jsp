<%-- 
    Document   : index
    Created on : 14/06/2019, 23:53:15
    Author     : jonat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Posto"%>
<%@page import="dao.PostoDAO"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%out.print("<h1>Buscar:</h1>");%>
 
        <form action="index.jsp" method="post">
            
            <label>Descricao:</label><br/>
            <input type="text" name="descricao"/>
            
            <button type="submit">
                Pesquisar
            </button>
            
        </form></br>
            
        <a href="inserir.jsp">NOVO</a>
        <a href="alterar.jsp">EDITAR</a>
        <a href="excluir.jsp">EXCLUIR</a
        <a href="index.jsp">VOLTAR</a>
        
        <!--Todo os registros do banco de dados-->
        <%
            try{
                out.print("<table>");
                out.print("<tr>");
                out.print("<h1>Todos os registros no Banco de Dados</h1>");
                out.print("<hr>");
                out.print("<th>Codigo</th><th>Descricao</th><th>Preco Alcool</th><th>Preco Gasolina</th><th>Editar</th><th>Excluir</th>");
                
                PostoDAO prd = new PostoDAO();
                
                
                if(request.getParameter("descricao") == "" || request.getParameter("descricao") == null){
                    ArrayList<Posto> lista = prd.listarTodos();
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td><hr>"+lista.get(num).getCodigo_produto()+"</td>");
                        out.print("<td><hr>"+lista.get(num).getDescricao_produto()+"</td>");
                        out.print("<td><hr>"+lista.get(num).getPreco_produto()+"</td>");
                        out.print("<td><hr>"+lista.get(num).getPreco_gasolina()+"</td>");
//                        out.print("<td><hr>"+lista.get(num).getTotal_gasolina()+"</td>");
                        out.print("<td><hr><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><hr><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                   
                                      
                }else{
                    ArrayList<Posto> lista = prd.listarTodosDescricao(request.getParameter("descricao"));
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td>"+lista.get(num).getCodigo_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getDescricao_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_gasolina()+"</td>");
                        out.print("<td><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                }
                
                out.print("</tr>");
                out.print("</table>");



            }catch(Exception erro){
                throw new RuntimeException("Erro 10: " + erro);
            }
        %>
        
        <!--Somar a Coluna de codigo_produto-->
        <%
            try{
                
                out.print("<table>");
                out.print("<tr>");
                out.print("<hr>");
                
                
                PostoDAO prd = new PostoDAO();
                if(request.getParameter("descricao") == "" || request.getParameter("descricao") == null){
                    ArrayList<Posto> lista = prd.listaQuantCod();
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");

                        out.print("<td><hr><b> Total cadastros: "+lista.get(num).getTotal_quantidade_cod()+"</b></td>");
                        
                        out.print("</tr>");
                    }
                    
                }else{
                    out.print("<th>Codigo</th><th>Descricao</th><th>Preco Alcool</th><th>Preco Gasolina</th><th>Editar</th><th>Excluir</th>");
                    ArrayList<Posto> lista = prd.listarTodosDescricao(request.getParameter("descricao"));
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td>"+lista.get(num).getCodigo_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getDescricao_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_gasolina()+"</td>");
                        out.print("<td><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                }
                out.print("</tr>");
                out.print("</table>");



            }catch(Exception erro){
                throw new RuntimeException("Erro 11: " + erro);
            }
        %>
        
        <!--Somar a Coluna de preco_gasolina-->
        <%
            try{
                
                out.print("<table>");
                out.print("<tr>");
//                out.print("<h1>Total preço da gasolina</h1>");
                out.print("<hr>");
                
                
                PostoDAO prd = new PostoDAO();
                if(request.getParameter("descricao") == "" || request.getParameter("descricao") == null){
                    ArrayList<Posto> lista = prd.listaSomaPrecoGasolina();
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");

                        out.print("<td><hr><b> Total Gasolina: "+lista.get(num).getTotal_gasolina()+"</b></td>");
                        
                        out.print("</tr>");
                    }
                    
                }else{
                    out.print("<th>Codigo</th><th>Descricao</th><th>Preco Alcool</th><th>Preco Gasolina</th><th>Editar</th><th>Excluir</th>");
                    ArrayList<Posto> lista = prd.listarTodosDescricao(request.getParameter("descricao"));
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td>"+lista.get(num).getCodigo_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getDescricao_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_gasolina()+"</td>");
                        out.print("<td><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                }
                out.print("</tr>");
                out.print("</table>");



            }catch(Exception erro){
                throw new RuntimeException("Erro 11: " + erro);
            }
        %>
        
        <!--Somar a Coluna de preco_alcool-->
        <%
            try{
                
                out.print("<table>");
                out.print("<tr>");
//                out.print("<h1>Total preço da alcool</h1>");
                out.print("<hr>");
                
                
                PostoDAO prd = new PostoDAO();
                if(request.getParameter("descricao") == "" || request.getParameter("descricao") == null){
                    ArrayList<Posto> lista = prd.listaSomaPrecoAlcool();
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");

                        out.print("<td><hr><b> Total Alcool: "+lista.get(num).getTotal_alcool()+"</b></td>");
                        
                        out.print("</tr>");
                    }
                    
                }else{
                    out.print("<th>Codigo</th><th>Descricao</th><th>Preco Alcool</th><th>Preco Gasolina</th><th>Editar</th><th>Excluir</th>");
                    ArrayList<Posto> lista = prd.listarTodosDescricao(request.getParameter("descricao"));
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td>"+lista.get(num).getCodigo_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getDescricao_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_gasolina()+"</td>");
                        out.print("<td><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                }
                out.print("</tr>");
                out.print("</table>");



            }catch(Exception erro){
                throw new RuntimeException("Erro 11: " + erro);
            }
        %>
        
        <!--Posto com gasolina mais barata-->
        <%
        
            try{
                
                out.print("<table>");
                out.print("<tr>");
                out.print("<h1>Posto com a Gasolina mais Barata</h1>");
                out.print("<hr>");
                out.print("<th>Codigo</th><th>Descricao</th><th>Preco Alcool</th><th>Preco Gasolina</th><th>Editar</th><th>Excluir</th>");
                
                
                PostoDAO prd = new PostoDAO();
                if(request.getParameter("descricao") == "" || request.getParameter("descricao") == null){
                    ArrayList<Posto> lista = prd.listarGasolinaMaisBarata();
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td><hr><b>"+lista.get(num).getCodigo_produto()+"</b></td>");
                        out.print("<td><hr><b>"+lista.get(num).getDescricao_produto()+"</b></td>");
                        out.print("<td><hr><b>"+lista.get(num).getPreco_produto()+"</b></td>");
                        out.print("<td><hr><b>"+lista.get(num).getPreco_gasolina()+"</b></td>");
                        out.print("<td><hr><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><hr><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                    
                }else{
                    ArrayList<Posto> lista = prd.listarTodosDescricao(request.getParameter("descricao"));
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td>"+lista.get(num).getCodigo_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getDescricao_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_produto()+"</td>");
                        out.print("<td>"+lista.get(num).getPreco_gasolina()+"</td>");
                        out.print("<td><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                }
                out.print("</tr>");
                out.print("</table>");



            }catch(Exception erro){
                throw new RuntimeException("Erro 11: " + erro);
            }
        %>
        
        <!--Posto com alcool mais barato-->
        <%
        
            try{
                out.print("<table>");
                out.print("<tr>");
                out.print("<h1>Posto com o Alcool mais Barato</h1>");
                out.print("<hr>");
                out.print("<th>Codigo</th><th>Descricao</th><th>Preco Alcool</th><th>Preco Gasolina</th><th>Editar</th><th>Excluir</th>");
                
                PostoDAO prd = new PostoDAO();
                if(request.getParameter("descricao") == "" || request.getParameter("descricao") == null){
                    ArrayList<Posto> lista = prd.listarAlcoolMaisBarata();
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td><hr><b>"+lista.get(num).getCodigo_produto()+"</b></td>");
                        out.print("<td><hr><b>"+lista.get(num).getDescricao_produto()+"</b></td>");
                        out.print("<td><hr><b>"+lista.get(num).getPreco_produto()+"</b></td>");
                        out.print("<td><hr><b>"+lista.get(num).getPreco_gasolina()+"</b></td>");
                        out.print("<td><hr><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><hr><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                    
                }
                else{
                    ArrayList<Posto> lista = prd.listarTodosDescricao(request.getParameter("descricao"));
                    for(int num = 0; num < lista.size(); num++){
                        out.print("<tr>");
                        out.print("<td><hr>"+lista.get(num).getCodigo_produto()+"</td>");
                        out.print("<td><hr>"+lista.get(num).getDescricao_produto()+"</td>");
                        out.print("<td><hr>"+lista.get(num).getPreco_produto()+"</td>");
                        out.print("<td><hr>"+lista.get(num).getPreco_gasolina()+"</td>");
                        out.print("<td><hr><a href='alterar.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Editar</a></td>");
                        out.print("<td><hr><a href='excluir.jsp?codigo="+lista.get(num).getCodigo_produto()+"&descricao="+lista.get(num).getDescricao_produto()+"&preco="+lista.get(num).getPreco_produto()+"&precoGasolina="+lista.get(num).getPreco_gasolina()+"'>Excluir</a></td>");
                        out.print("<td></td>");
                        out.print("</tr>");
                    }
                }
                out.print("</tr>");
                out.print("</table>");



            }catch(Exception erro){
                throw new RuntimeException("Erro 15: " + erro);
            }
        %>
        
    </body>
</html>
