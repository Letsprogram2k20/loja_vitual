
function trocarIcone(acender){
    var imagem = document.getElementById("carrinho-icone");
    if (acender)
        imagem.src = "assets/icones/shopping-cart-2.svg";
    else
        imagem.src = "assets/icones/shopping-cart.svg";
}

(function ($) {

    "use strict";

    var fullHeight = function () {

        $('.js-fullheight').css('height', $(window).height());
        $(window).resize(function () {
            $('.js-fullheight').css('height', $(window).height());
        });

    };
    fullHeight();

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

})(jQuery);

$(window).on("load", function () {
    // página totalmente carregada (DOM, imagens etc.)
    var mensagem = document.getElementById("mensagem");

    if (mensagem.value !== "null")
        alert(mensagem.value);
});