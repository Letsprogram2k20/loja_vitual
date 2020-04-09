/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author daisanapaulo
 */
public class Produto
{
    
    private int pkProduto;
    private String nomeProduto;
    private String descricao;
    private Double preco;
    private String imagem;

    public Produto(int pkProduto)
    {
        this.pkProduto = pkProduto;
    }

    public Produto(int pkProduto, String nomeProduto, String descricao, Double preco, String imagem)
    {
        this.pkProduto = pkProduto;
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.preco = preco;
        this.imagem = imagem;
    }

    public Produto(int pkProduto, String descricao, String imagem)
    {
        this.pkProduto = pkProduto;
        this.descricao = descricao;
        this.imagem = imagem;
    }

    public int getPkProduto()
    {
        return pkProduto;
    }

    public void setPkProduto(int pkProduto)
    {
        this.pkProduto = pkProduto;
    }

    public String getDescricao()
    {
        return descricao;
    }

    public void setDescricao(String descricao)
    {
        this.descricao = descricao;
    }

    public String getImagem()
    {
        return imagem;
    }

    public void setImagem(String imagem)
    {
        this.imagem = imagem;
    }

    public String getNomeProduto()
    {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto)
    {
        this.nomeProduto = nomeProduto;
    }

    public Double getPreco()
    {
        return preco;
    }

    public void setPreco(Double preco)
    {
        this.preco = preco;
    }
    
}
