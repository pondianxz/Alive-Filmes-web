const navbar            = document.getElementById('navbar');
const navbar_parte_cima = document.getElementById('navbar_parte_cima');


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
            }
            else if(scrollY >= 1650){
                navbar_parte_cima.style.transform = "translateY(-120px)";
                navbar_parte_cima.style.height = "10px";
            } 
            else{
                navbar_parte_cima.style.transform = "unset";
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

