
package dao;

import connectionDB.ConnectDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Produto;

/**
 *
 * ------ Universidade Católica de Angola --------
 * 
 * Autor: João Paulo Zinga;
 * Data: 01-01-2018;
 * Objectivo: Classe para a manipulação da entidade Produto na base de dados.
 * 
 */

public class ProdutoDao
{
    
    /*
     *  Objectivo: Buscar todos os produtos da base de dados ordenados pelo preco;
     */
    public static ArrayList<Produto> findAllOrderByPreco(){
     
        try
        {
            // Cria uma instancia do Objecto ConnectDB e abre a conexão com a base de dados usando as configuracoes.
            ConnectDB con = new ConnectDB();
            
            // Prepara uma nova query a ser executada.
            con.setPrepareStatement("SELECT * FROM produto ORDER BY preco DESC");
            
            // Declara um ResultSet que vai receber o resultado da query executada
            ResultSet rs = con.consultar();

            // Declara um objecto do tipo ArrayList<Produto> para armazenar o resultado da pesquisa
            ArrayList<Produto> produtos = new ArrayList();
         
            // Cria um loop para ler os registos vindos da base de dados e só para quando não haver mais registos
            while(rs.next()){
                
                // Adiciona um novo produto ao arraylist produtos usando o construtor de Produto
                produtos.add(
                        new Produto(
                               rs.getInt("pk_produto"),
                               rs.getString("nome_produto"),
                               rs.getString("descricao"),
                               rs.getDouble("preco"),
                               rs.getString("imagem")
                        )
                );
            }
            
            // Termina a conexão com a base dados
            con.disconect();
            
            // Retorna o resultado
            return produtos;
            
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            Logger.getLogger(ProdutoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Em caso de erro retorna null
        return null;
    }
    
    
    /*
     *  Objectivo: Busca um determinado produto na tabela Produto dado o seu ID
     */
    public static void findById(Produto produto){
     
        try
        {
            ConnectDB con = new ConnectDB();
            
            con.setPrepareStatement("SELECT * FROM produto WHERE pk_produto = ?");
            
            // Atribuir o valor do atributo passado na query como ? no cado o Id do produto
            con.getPrepareStatement().setInt(1, produto.getPkProduto());
            
            ResultSet rs = con.consultar();
         
            while(rs.next()){
                produto.setDescricao(rs.getString("descricao"));
                produto.setImagem(rs.getString("imagem"));
                produto.setNomeProduto(rs.getString("nome_produto"));
                produto.setPreco(rs.getDouble("preco"));
            }
            
            con.disconect();
            
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            Logger.getLogger(ProdutoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
