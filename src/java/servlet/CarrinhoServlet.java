/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.UsuarioBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Produto;

/**
 * ------ Universidade Católica de Angola --------
 * 
 * Autor: João Paulo Zinga;
 * Data: 01-01-2018;
 * Objectivo: Esta servlet responde a requisições de inserção de produtos ao carrinho.
 * 
 */
public class CarrinhoServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // Recebe o id do produto a adicionar ao carrinho
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        
        /* Retorna a sessão do usuario que fez a requisicao e pega o Bean com os dados e que contem
         * a instância do carrinho de compra
         */
        HttpSession sessao = request.getSession(true);
        UsuarioBean usuarioBean = (UsuarioBean) sessao.getAttribute("usuarioBean");
        
        /* Adiciona o produto ao carrinho atraves o metodousuarioBean.adicionarProduto(new Produto)
         * e recebe o resultado em uma variavel se realmente o produto foi adicionado
         */
        boolean adicionouProduto = usuarioBean.adicionarProduto(new Produto(idProduto));
        
        /* Prepara o atributo mensagem que será recebido na página validando se o produto foi ou naãp
         * adicionado ao carrinho
         */
        request.setAttribute("mensagem", 
                (adicionouProduto) ? "Produto adiconado ao carrinho" : "Produto já se encontra no carrinho");
        
        // Redireciona para a página home
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
    }

}
