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
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">
    <title>Sessões para <?php
        try {
            $sql = 'SELECT nome_filme FROM tb_filme WHERE id_filme = 1';
            $resultadoSql = mysqli_query($conexao, $sql);
            $sqlQuery = mysqli_fetch_assoc($resultadoSql);
            echo $sqlQuery["nome_filme"];
        } catch(mysqli_sql_exception) {
            echo'Filme';
        }
    ?> - Alive Filmes</title>
    <link rel="stylesheet" href="../css/reset.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/style.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/sessoesHome.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/sessoes.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/footer.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="../css/media.css?<?php echo time(); ?>">
</head>
<body>
    <?php include("../recursos/header.php") ?>


    <section class="secao_sessao_1">
        <!-- DIV SESSÃO MASTER -->
        <div class="info_sessao">
            <div class="div_capa_filme">
                <!-- Imagem capa Filme-->
                <img class="img_capa_filme" src="../images/capasFilmes/1.webp" alt="Capa Filme">
            </div>
            <div class="div_conteudo_info_filme">
                <div class="div_conteudo_parte1_info_filme">
                    <div class="div_link_filme_sessao">
                        <!-- Nome filme-->
                        <h1 class="titulo_filme_info_filme"><?php
                            try {
                                $sql = 'SELECT nome_filme FROM tb_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);
                                $sqlQuery = mysqli_fetch_assoc($resultadoSql);
                                echo $sqlQuery["nome_filme"];
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?></h1>
                    </div>
                    <div class="descricao_filme">
                        <!-- Genero Filme-->
                        <h2><?php
                            try {
                                $sql = 'SELECT genero_filme FROM tb_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);
                                $sqlQuery = mysqli_fetch_assoc($resultadoSql);
                                echo $sqlQuery["genero_filme"];
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?></h2>

                        <!-- Classificação indicativa filme -->
                        <?php
                            try {
                                $sql = 'SELECT classificacao_indicativa_filme FROM tb_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);
                                $sqlQuery = mysqli_fetch_assoc($resultadoSql);
                                $classificacaoFilme = $sqlQuery["classificacao_indicativa_filme"];
                                echo"
                                    <div class='classificacao_indicativa_filme' id='classificacao_indicativa_{$classificacaoFilme}_anos_filme'>
                                    <h2>
                                ";

                                if($classificacaoFilme != 0){
                                    echo $classificacaoFilme.' anos';
                                }else{
                                    echo 'L';
                                }
                                
                                echo "</h2></div>";
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?>

                        <!-- Duração filme -->
                        
                        <h2><?php
                            try {
                                $sql = 'SELECT duracao_filme FROM tb_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);
                                $sqlQuery = mysqli_fetch_assoc($resultadoSql);
                                echo $sqlQuery["duracao_filme"];
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?></h2>
                    </div>

                    <!-- Tags filme (se tiver) -->
                    <div class="tags_filme"></div>

                    <div class="div_sinopse_filme">
                        <p><?php
                            try {
                                $sql = 'SELECT sinopse_filme FROM tb_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);
                                $sqlQuery = mysqli_fetch_assoc($resultadoSql);
                                echo $sqlQuery["sinopse_filme"];
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?></p>
                    </div>

                    <!-- Outras informações do filme (direção, elenco e distribuidora) -->
                    <div class="outras_infos_filme">
                        <p class="infosFilme"><span>Direção: </span><?php
                            try {
                                $sql = 'SELECT nome_diretor_filme FROM tb_direcao_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);

                                // se tiver mais q 2 pessoas, poe todas e adiciona uma virgula
                                if(mysqli_num_rows($resultadoSql) >= 2){
                                    while($linha = mysqli_fetch_assoc($resultadoSql)){
                                        echo $linha['nome_diretor_filme'] . ', ';
                                    }
                                } else if (mysqli_num_rows($resultadoSql) === 1){ // caso contrário, coloca so 1
                                    $linha = mysqli_fetch_assoc($resultadoSql);
                                    echo $linha["nome_diretor_filme"];
                                } else{ // caso contrário, vai pra puta que pariu
                                    echo'N/A';
                                }
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?></p>
                        <p class="infosFilme"><span>Elenco: </span><?php
                            try {
                                $sql = 'SELECT nome_ator_filme FROM tb_elenco_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);
                                
                                // se tiver mais q 2 pessoas, poe todas e adiciona uma virgula
                                if(mysqli_num_rows($resultadoSql) >= 2){
                                    while($linha = mysqli_fetch_assoc($resultadoSql)){
                                        echo $linha['nome_ator_filme'] . ', ';
                                    }
                                } else if (mysqli_num_rows($resultadoSql) === 1){ // caso contrário, coloca so 1
                                    $linha = mysqli_fetch_assoc($resultadoSql);
                                    echo $linha["nome_ator_filme"];
                                } else{ // caso contrário, vai pra puta que pariu
                                    echo'N/A';
                                }
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?></p>



                        <p class="infosFilme"><span>Distribuidora: </span><?php
                            try {
                                $sql = 'SELECT nome_distribuidora FROM tb_distribuidora_filme WHERE id_filme = 1';
                                $resultadoSql = mysqli_query($conexao, $sql);
                                
                                // se tiver mais q 2 pessoas, poe todas e adiciona uma virgula
                                if(mysqli_num_rows($resultadoSql) >= 2){
                                    while($linha = mysqli_fetch_assoc($resultadoSql)){
                                        echo $linha['nome_distribuidora'] . ', ';
                                    }
                                } else if (mysqli_num_rows($resultadoSql) === 1){ // caso contrário, coloca so 1
                                    $linha = mysqli_fetch_assoc($resultadoSql);
                                    echo $linha["nome_distribuidora"];
                                } else{ // caso contrário, vai pra puta que pariu
                                    echo'N/A';
                                }
                            } catch(mysqli_sql_exception) {
                                echo'N/A';
                            }
                        ?></p>
                    </div>
                    
                </div>



                <div class="div_conteudo_parte2_info_filme">
                    <h2>Hoje</h2>

                    <!-- Sala e tipo de áudio filme -->
                    <div class="div_sala_e_tipo_audio_filme">
                        <h3><span></span>Dublado</h3>
                        <div class="div_botoes_horarios_sessao">
                            <a href="#">
                                <button class="btn_horario_sessao">18:00</button>
                            </a>
                            <button class="btn_horario_sessao">18:50</button>
                            <button class="btn_horario_sessao">20:00</button>
                        </div>
                    </div>


                    <!-- Sala e tipo de áudio filme -->
                    <div class="div_sala_e_tipo_audio_filme">
                        <h3><span>IMAX - </span>Dublado</h3>
                        <div class="div_botoes_horarios_sessao">
                            <button class="btn_horario_sessao">15:00</button>
                            <button class="btn_horario_sessao">16:50</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- DIV SESSÃO MASTER Fim-->
    </section>


    
    <?php include("../recursos/footer.php") ?>



    <!-- Script para tirar a ultima virgula das informações dos filmes caso haja uma no final -->
    <script>
        infosFilme.forEach((el) => {
            if(el.textContent.endsWith(", ")){
                el.textContent = el.textContent.slice(0, el.textContent.lastIndexOf(", "));
            }
        })
    </script>
    <script src="../js/script.js"></script>
</body>