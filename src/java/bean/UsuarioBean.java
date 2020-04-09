/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import modelo.Produto;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author daisanapaulo
 */
public class UsuarioBean implements Serializable
{
    
    private String email;
    private String password;
    
    private ArrayList<Produto> carrinho;

    public UsuarioBean()
    {
        this.email = "";
        this.password = "";
        
        carrinho = new ArrayList();
        
    }
    
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public ArrayList<Produto> getCarrinho()
    {
        return carrinho;
    }

    public void setCarrinho(ArrayList<Produto> carrinho)
    {
        this.carrinho = carrinho;
    }

    public boolean adicionarProduto(Produto produto){
        
        // Verifica se produto já está no carrinho
        
        if (!produtoConsta(produto)){
           this.carrinho.add(produto);
           return true;
        }
        
        return false;
    }
    
    public boolean produtoConsta(Produto produto){
        for (Produto p : this.carrinho)
        {
            if (p.getPkProduto() == produto.getPkProduto()) {
                return true;
            }
        }
        return false;
    }
    
    
}
