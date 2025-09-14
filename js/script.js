const navbar = document.getElementById('navbar');
const navbar_parte_cima = document.getElementById('navbar_parte_cima');

window.addEventListener("scroll", () => {
    //console.log(scrollY)

    if(scrollY > 700){
        navbar.style.background = "rgba(0, 0, 0, 0.3)";
    }else{
        navbar.style.background = "transparent";
    }

    if(scrollY > 2050){
        navbar_parte_cima.style.transform = "translateY(-120px)";
        navbar_parte_cima.style.height = "10px";
    }else{
        navbar_parte_cima.style.transform = "unset";
        navbar_parte_cima.style.height = "unset";
    }

});