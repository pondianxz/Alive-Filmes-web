<?php 
session_start();
require "Controller/conexao.php";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta - Alive Filmes</title>
    <link rel="stylesheet" href="css/reset.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="css/style.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="css/login.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="css/media.css?<?php echo time(); ?>">
</head>
<body>
    <section class="secao_tudo_login">

    
        <div class="login_esquerda">
            <div class="div_img_login_logo">
                <a class="link_login_logo" href="index.php">
                    <img class="img_login_logo" src="images/render_abreviada.png" alt="Logo Alive Filmes">
                </a>
            </div>
        </div>



        <div class="login_direita">
            <div class="login_direita_parte_cima">
                <div class="login_container">
                    <h1 class="titulo_texto_login">Informações de contato</h1>

                    <div class="div_form_login">
                        <form action="<?php htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="post" class="form_login">

                            <div>
                                <label for="cep">CEP</label>
                                <input type="text" name="cep" maxlength="8"   onblur="buscaCep(this.value)">
                            </div>

                            <div>
                                <label for="endereco">Endereço</label>
                                <input type="text" name="endereco" id="input_endereco" >
                            </div>

                            <div>
                                <label for="bairro">Bairro</label>
                                <input type="text" name="bairro" id="input_bairro" >
                            </div>

                            <div>
                                <label for="cidade">Cidade</label>
                                <input type="text" name="cidade" id="input_cidade">
                            </div>

                            <div>
                                <label for="estado">Estado</label>
                                <input type="text" name="estado" id="input_estado">
                            </div>



                            <button class="botao_login_e_cadastro" name="botao_cadastro" type="submit">Registrar</button>
                        </form>
                    </div>
                </div>
            </div>


            <div class="login_direita_parte_baixo">
                <p>
                    <a href="#">Quem somos</a>
                </p>
                <p>|</p>
                <p>
                    <a href="#">FAQ</a>
                </p>
                <p>|</p>
                <p>
                    <a href="#">Serviços</a>
                </p>
                <p>|</p>
                <p>
                    <a href="#">Política de Privacidade</a>
                </p>
                <p>|</p>
                <p>
                    <a href="#">Termos de Uso</a>
                </p>
            </div>
        </div>


        <div class="div_login_img_fundo"></div>
    </section>
    <script src="js/buscaCep.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
<?php
    $cep      = $_POST['cep'];
    $endereco = $_POST['endereco'];
    $bairro   = $_POST['bairro'];
    $cidade   = $_POST['cidade'];
    $estado   = $_POST['estado'];

    // se a pessoa clicou pra registrar, faz essas parada ai
    if(isset($_POST['botao_cadastro'])){
        
        try{

            $id_cliente = $_SESSION['id_cliente'];

            // atualiza as informaçoes de contato na porra do banco de dados
            $sql ="UPDATE tb_cliente SET
                logradouro_cliente = '$endereco',
                cep_cliente = '$cep',
                bairro_cliente = '$bairro',
                cidade_cliente = '$cidade',
                estado_cliente = '$estado'
                WHERE id_cliente = '$id_cliente';
            ";
            mysqli_query($conexao, $sql);

            // define as sessões
            $_SESSION['cep'] = $cep;
            $_SESSION['endereco'] = $endereco;
            $_SESSION['bairro'] = $bairro;
            $_SESSION['cidade'] = $cidade;
            $_SESSION['estado'] = $estado;

            // redireciona o usuario para a pagina index
            header("Location: index.php");

        } 
        catch (mysqli_sql_exception){
            echo'
            <h1>Erro ao informaçoes de contato do usuario</h1>
            ';
        }

    }
mysqli_close($conexao);
?>