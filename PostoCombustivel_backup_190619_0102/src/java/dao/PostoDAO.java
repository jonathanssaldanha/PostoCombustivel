
package dao;

import model.Posto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostoDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Posto> lista = new ArrayList<>();
    
    public PostoDAO() {
        conn = new ConnectionFactory().getConexao();
    }
    
    public void inserir(Posto produto){
        String sql = "INSERT INTO produto(descricao_produto, preco_produto, preco_gasolina) VALUES(?,?,?)";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getDescricao_produto());
            stmt.setDouble(2, produto.getPreco_produto());
            stmt.setDouble(3, produto.getPreco_gasolina());
            stmt.execute();
            stmt.close();            
        }catch(Exception erro){
            throw new RuntimeException("Erro 2: " + erro);
        }
    }

    public void alterar(Posto produto){
        String sql = "UPDATE produto SET descricao_produto = ?, preco_produto = ?, preco_gasolina = ? WHERE codigo_produto = ?";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getDescricao_produto());
            stmt.setDouble(2, produto.getPreco_produto());
            stmt.setDouble(3, produto.getPreco_gasolina());
            stmt.setInt(4, produto.getCodigo_produto());
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro 3: " + erro);
        }
    }

    public void excluir(int valor){
        String sql = "DELETE FROM produto WHERE codigo_produto = "+valor;
        try{
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro 4: " + erro);
        }
    }    
    
    
        public ArrayList<Posto> listaSomaPrecoGasolina(){
        String sql = "SELECT SUM(preco_gasolina) FROM produto WHERE preco_gasolina > '0'";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Posto produto = new Posto();
                produto.setTotal_gasolina(rs.getDouble("SUM(preco_gasolina)"));
                lista.add(produto);
            }
          
        }catch(Exception erro){
            throw new RuntimeException("Erro 13: " + erro);
        }
        return lista;
        }    
        
        
        public ArrayList<Posto> listaSomaPrecoAlcool(){
        String sql = "SELECT SUM(preco_produto) FROM produto WHERE preco_produto > '0'";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            double soma=0;
            while(rs.next()){
                Posto produto = new Posto();
                produto.setTotal_alcool(rs.getDouble("SUM(preco_produto)"));
                lista.add(produto);
            }
          
        }catch(Exception erro){
            throw new RuntimeException("Erro 13: " + erro);
        }
        return lista;
        }    
        
        public ArrayList<Posto> listaQuantCod(){
        String sql = "SELECT COUNT(codigo_produto) FROM produto WHERE codigo_produto > '0'";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            double soma=0;
            while(rs.next()){
                Posto produto = new Posto();
                produto.setTotal_quantidade_cod(rs.getDouble("COUNT(codigo_produto)"));
                lista.add(produto);
            }
          
        }catch(Exception erro){
            throw new RuntimeException("Erro 13: " + erro);
        }
        return lista;
        }  
        
    public ArrayList<Posto> listarTodos(){
        String sql = "SELECT * FROM produto";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Posto produto = new Posto();
                produto.setCodigo_produto(rs.getInt("codigo_produto"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                produto.setPreco_gasolina(rs.getDouble("preco_gasolina"));
                lista.add(produto);
                
            }
            
        }catch(Exception erro){
            throw new RuntimeException("Erro 5: " + erro);
        }
        return lista;
    }
    
        public ArrayList<Posto> listarTodosDescricao(String valor){
        String sql = "SELECT * FROM produto WHERE descricao_produto LIKE '%"+valor+"%' ";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Posto produto = new Posto();
                produto.setCodigo_produto(rs.getInt("codigo_produto"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                produto.setPreco_gasolina(rs.getDouble("preco_gasolina"));
                lista.add(produto);
                
            }
        }catch(Exception erro){
            throw new RuntimeException("Erro 6: " + erro);
        }
        return lista;
        }

        public ArrayList<Posto> listarGasolinaMaisBarata(){
        String sql = "SELECT * FROM produto ORDER by preco_gasolina";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Posto produto = new Posto();
                produto.setCodigo_produto(rs.getInt("codigo_produto"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                produto.setPreco_gasolina(rs.getDouble("preco_gasolina"));
                lista.add(produto);
                break;

            }
        }catch(Exception erro){
            throw new RuntimeException("Erro 13: " + erro);
        }
        return lista;
        }
        
        public ArrayList<Posto> listarAlcoolMaisBarata(){
        String sql = "SELECT * FROM produto ORDER by preco_produto";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Posto produto = new Posto();
                produto.setCodigo_produto(rs.getInt("codigo_produto"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                produto.setPreco_gasolina(rs.getDouble("preco_gasolina"));
//                produto.setValor_total(rs.getDouble("valor_total"))
                lista.add(produto);
                break;

            }
            
            
            
        }catch(Exception erro){
            throw new RuntimeException("Erro 13: " + erro);
        }
        return lista;
        }
        
        
}
