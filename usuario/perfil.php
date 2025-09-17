<?php
    session_start();
    require '../Controller/conexao.php';
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Cada frame é inesquecível.">
    <title>Perfil - Alive Filmes</title>
    <link rel="stylesheet" href="../css/reset.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/style.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/perfil.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/footer.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/media.css?<?php echo time(); ?>">
</head>
<body>
    <?php include("../recursos/header.php") ?>


    <section class="secao_perfil_1">
        <h1>
            <?php
                if(!isset($_SESSION['email_cliente']) || !isset($_SESSION['logado'])){
                    header("Location: ../login.php");
                    exit();
                }else{
                    echo $_SESSION['nome_cliente'];
                }
            ?>
        </h1>
    </section>



    <?php include("../recursos/footer.php") ?>


    <script src="../js/script.js"></script>
</body>