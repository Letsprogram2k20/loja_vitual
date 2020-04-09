<%--
        - Universidade Católica de Angola -
 
    Documento: Pagina que renderiza o carrinho com todos os produtos
    Autor: João Paulo Zinga;
    Data: 01-01-2018;
  
--%>

<%@page import="configuracoes.Config"%>
<%@page import="dao.ProdutoDao"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>

        <link href="resources/_bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/carrinhoDeCompra.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%-- Chama o Bean de sessao onde costam os dados do usuário e tambem o carrinho! --%>
        <jsp:useBean id="usuarioBean" class="bean.UsuarioBean" scope="session" />

        <% if (usuarioBean.getCarrinho().size() == 0)
            {  %>
        <h3>Não há produtos no carrinho...</h3>

        <%
        }
        else
        {
            // Este loop serve para renderizar os produtos que estão no carrino usuarioBean.getCarrinho()
            for (Produto produto : usuarioBean.getCarrinho())
            {
                // Carrega os dados do produto para exibi-lo visto que no carrinho só temos o ID
                ProdutoDao.findById(produto);
        %>

        <div class="root-carrinho">
            <div class="row produto">
                <div class="col-4">
                    <img class='imagemProduto' src='<%= Config.PATH_NAME_IMAGES + produto.getImagem()%>' alt='Imagem do produto' />
                </div>
                <div class="col-8">
                    <div> <b>Produto ID: </b> <%= produto.getPkProduto()%> </div>
                    <div> <b>Nome: </b> <%= produto.getNomeProduto()%> </div>
                    <div> <b>Preço: </b> <%= produto.getPreco()%> Kz</div>

                    <div class='panel-button row' >
                        <div class='col-6 mr'>
                            <button class='form-control' >Comprar</button>
                        </div>
                        <div class='col-6'>
                            <a 
                                href='CarrinhoServlet?idProduto=<%= produto.getPkProduto()%>'
                                class='form-control btn btn-danger' 
                                >
                                <i class='fa fa-shopping-cart '><!-- Icone carrinho <--></i>
                                Remover
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </body>
</html>
