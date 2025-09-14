<?php
session_start();

// se o usuario clicar pra sair, moggar o usuario e redirecionar ele pra pagina de login
if(isset($_POST['logout'])){
    session_destroy();
    header("Location: login.php");
}

?>