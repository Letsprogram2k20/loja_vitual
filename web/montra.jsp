<%--
        - Universidade Católica de Angola -
 
    Documento: Pagina que renderiza a montra
    Autor: João Paulo Zinga;
    Data: 01-01-2018;
  
 --%>

<%@page import="configuracoes.Config"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="resources/_bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/montra.css" rel="stylesheet" type="text/css"/>

<div class="root-montra container-fluid" >    
    <div class="row" >
        
        <%-- Este loop serve para renderizar os produtos retornados pelo metodo ProdutoDao.findAllOrderByPreco() --%>
        <% for (Produto produto : ProdutoDao.findAllOrderByPreco())
            {%>
        <div class="produto">
            <img class='imagemProduto' src='<%= Config.PATH_NAME_IMAGES + produto.getImagem() %>' alt='Imagem do produto' />
            <div class='infomacoesProduto'>
                <div> <b>Produto ID: </b> <%= produto.getPkProduto()%> </div>
                <div> <b>Descricao: </b> <%= produto.getNomeProduto()%> </div>
                <div> <b>Preço: </b> <%= produto.getPreco()%> Kz</div>
            </div>
            <div class='panel-button row' >
                <div class='col-6 mr'>
                    <button class='form-control' >Comprar</button>
                </div>
                <div class='col-6'>
                    <a 
                        href='CarrinhoServlet?idProduto=<%= produto.getPkProduto()%>'
                        class='form-control btn btn-danger' 
                        >
                        <img id="carrinho-icone" src="assets/icones/shopping-cart-btn.svg" class="carrinho-icone-btn" />
                        Adicionar
                    </a>
                </div>
            </div>
        </div>
        <% }%>
        
    </div>
</div>
