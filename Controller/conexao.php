<?php
$bd_servidor = 'localhost';
$bd_user = 'root';
$bd_senha = '';
$bd_nome = 'bdalivefilmes';
$conexao = '';

try{
    $conexao = mysqli_connect($bd_servidor, $bd_user, $bd_senha, $bd_nome);
}catch(mysqli_sql_exception){
    echo'
        <h1 style="color: red; font-size: 80px; transform: translateY(100px);">Não foi possível conectar ao servidor</h1>
        ';
}

?>