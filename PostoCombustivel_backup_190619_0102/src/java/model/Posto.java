
package model;



public class Posto {
    
    private int codigo_produto;
    private String descricao_produto;
    private Double preco_produto;
    private Double preco_gasolina;
    private Double total_gasolina;
    private Double total_alcool;
    private Double total_quantidade_cod;

    
    
    public int getCodigo_produto() {
        return codigo_produto;
    }

    public void setCodigo_produto(int codigo_produto) {
        this.codigo_produto = codigo_produto;
    }

    public String getDescricao_produto() {
        return descricao_produto;
    }

    public void setDescricao_produto(String descricao_produto) {
        this.descricao_produto = descricao_produto;
    }

    public Double getPreco_produto() {
        return preco_produto;
    }

    public void setPreco_produto(Double preto_produto) {
        this.preco_produto = preto_produto;
    }

    public Double getPreco_gasolina() {
        return preco_gasolina;
    }

    public void setPreco_gasolina(Double preco_gasolina) {
        this.preco_gasolina = preco_gasolina;
    }

    public Double getTotal_gasolina() {
        return total_gasolina;
    }

    public void setTotal_gasolina(Double total_gasolina) {
        this.total_gasolina = total_gasolina;
    }

    public Double getTotal_alcool() {
        return total_alcool;
    }

    public void setTotal_alcool(Double total_alcool) {
        this.total_alcool = total_alcool;
    }

    public Double getTotal_quantidade_cod() {
        return total_quantidade_cod;
    }

    public void setTotal_quantidade_cod(Double total_quantidade_cod) {
        this.total_quantidade_cod = total_quantidade_cod;
    }
    
    
    
}
