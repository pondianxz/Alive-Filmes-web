const navbar            = document.getElementById('navbar');
const navbar_parte_cima = document.getElementById('navbar_parte_cima');
const INTERACOES        = document.getElementById('INTERACOES');
const INT_div_video_trailer = document.getElementById('INT_div_video_trailer');
const INT_div_div_ver_trailer = document.getElementById('INT_div_div_ver_trailer');


paginaAtual = window.location.pathname;

window.addEventListener("scroll", () => {
    switch (true) {
        // caso o user esteja na pagina index
        case (paginaAtual === ""):
        case (paginaAtual.includes("index.php")):
            if(scrollY < 700){
                navbar.style.background = "transparent";
            }
            else if(scrollY >= 700 && scrollY < 1650){
                navbar.style.background = "rgba(0, 0, 0, 0.3)";
                navbar_parte_cima.style.transform = "translateY(0px)";
                navbar_parte_cima.style.height = "unset";

            }
            else if(scrollY >= 1650){
                navbar_parte_cima.style.transform = "translateY(-120px)";
                navbar_parte_cima.style.height = "10px";
            } 
            else{
                navbar_parte_cima.style.height = "unset";
            }
            break;


        // caso o user esteja em algum arquivo da pasta de "sessoes", ou na pagina de contato
        case (paginaAtual.includes("sessoes/")):
        case (paginaAtual.includes("contato.php")):
            navbar_parte_cima.style.transform = "translateY(-120px)";
            navbar_parte_cima.style.height = "10px";
            break;
    }
})

// se o usuario clicar no botao de fechar trailer do filme
function fecharTrailer(){
    INTERACOES.style.display = "none";
    INT_div_div_ver_trailer.style.display = "none";
}