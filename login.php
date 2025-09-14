<?php
session_start();
require "Controller/conexao.php";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Alive Filmes</title>
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
                    <h1 class="titulo_texto_login">Bem-vindo de volta.</h1>

                    <div class="div_form_login">
                        <form action="<?php htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="post" class="form_login">
                            <div class="div_form_login_email">
                                <label for="email">E-mail</label>
                                <input type="email" name="email" id="">
                            </div>

                            <div class="div_form_login_senha">
                                <label for="senha">Senha</label>
                                <input type="password" name="senha" id="">
                            </div>

                            <button class="botao_login_e_cadastro" name="botao_login" type="submit">Entrar</button>
                        </form>
                    </div>

                    <p class="nao_tenho_conta_login">
                        Não tem uma conta?
                        <a href="registro.php">
                            Crie agora
                        </a>
                    </p>
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
    <script src="js/script.js"></script>
</body>
</html>