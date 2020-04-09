<%--
        - Universidade Católica de Angola -
 
    Documento: Pagina que renderiza o carrinho com todos os produtos
    Autor: João Paulo Zinga;
    Data: 01-01-2018;
  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="resources/_bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String mensagem = "" + request.getAttribute("mensagem");
        %>

        <input id="mensagem" type="hidden" value="<%= mensagem%>" />
        <% mensagem = "null";
        %>

        <jsp:useBean id="usuarioBean" class="bean.UsuarioBean" scope="session" />

        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="custom-menu">
                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                    </button>
                </div>
                <div class="img bg-wrap text-center py-4" style="background-image: url(assets/bg_1.png);">
                    <div class="user-logo">
                        <div class="img" style="background-image: url(assets/my_avatar.jpg);"></div>
                        <h3 class="nomeUser">João Paulo Zinga</h3>
                    </div>
                </div>
                <ul class="list-unstyled components mb-5">
                    <li class="active">
                        <a href="#"><span class="fa fa-home mr-3"></span> Inicio </a>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-download mr-3 notif">
                                <small class="d-flex align-items-center justify-content-center">5</small>
                            </span> Notificações
                        </a>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-gift mr-3"></span> Histórico de compras </a>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-trophy mr-3"></span> Meus Dados </a>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-sign-out mr-3"></span> Sair </a>
                    </li>
                </ul>

                <div class="carrinho row center" onmousemove="trocarIcone(true);" onmouseout="trocarIcone(false);" >
                    <a class="center" href="carrinhoDeCompra.jsp">
                        <span class="carrinho-icone notif">
                            <img id="carrinho-icone" src="assets/icones/shopping-cart.svg" class="carrinho-icone" />
                            <% if (!usuarioBean.getCarrinho().isEmpty())
                                { %>
                            <small class="d-flex align-items-center justify-content-center">
                                ${usuarioBean.carrinho.size()}
                            </small>
                            <% }
                               %>
                        </span> 
                        <p>Ver carrinho</p>
                    </a>
                </div>

            </nav>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
                <%@include file="montra.jsp" %>
            </div>
        </div>

        <script src="resources/_jquery/jquery.min.js" type="text/javascript"></script>
        <script src="resources/_pouper/popper.js" type="text/javascript"></script>
        <script src="resources/_bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/js/home.js" type="text/javascript"></script>
    </body>
</html>
