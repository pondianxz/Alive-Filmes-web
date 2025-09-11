<?php 
session_start();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta - Alive Filmes</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/media.css">
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
                    <h1 class="titulo_texto_login">Começe sua experiência.</h1>

                    <div class="div_form_login">
                        <form action="<?php htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="post" class="form_login">
                            <div class="div_form_login_nome">
                                <label for="nome">Nome Completo</label>
                                <input type="text" name="nome" id="">
                            </div>

                            <div class="div_form_login_email">
                                <label for="email">E-mail</label>
                                <input type="email" name="email" id="">
                            </div>

                            <div class="div_form_login_senha">
                                <label for="senha">Senha</label>
                                <input type="password" name="senha" id="">
                            </div>

                            <div class="div_form_login_confirmar_senha">
                                <label for="confirmar_senha">Confirmar senha</label>
                                <input type="password" name="confirmar_senha" id="">
                            </div>

                            <button class="botao_login_e_cadastro" name="botao_cadastro" type="submit">Criar Conta</button>
                        </form>
                    </div>

                    <p class="nao_tenho_conta_login">
                        Já tem uma conta?
                        <a href="login.php">
                            Entrar
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
<?php
    $nome            = $_POST['nome'];
    $email           = $_POST['email'];
    $senha           = $_POST['senha'];
    $confirmar_senha = $_POST['confirmar_senha'];
    
    // se o usuario clicou no botao de cadastrar
    if(isset($_POST['botao_cadastro'])){
        if(empty($nome)){
            echo'
            <h1 style="color: red; font-size: 32px">Preencha o campo de nome</h1>
            ';
        }else if(empty($email)){
            echo'
            <h1 style="color: red; font-size: 32px">Preencha o campo de email</h1>
            ';
        }else if(empty($senha)){
            echo'
            <h1 style="color: red; font-size: 32px">Preencha o campo da senha</h1>
            ';
        }else if(empty($confirmar_senha)){
            echo'
            <h1 style="color: red; font-size: 32px">Preencha o campo de confirmar senha</h1>
            ';
        }else if($senha != $confirmar_senha){
            echo'
            <h1 style="color: red; font-size: 32px">As senhas nao coincidem</h1>
            ';
        } else {

            // criptografa a senha
            $senha_hashed = password_hash($senha, PASSWORD_BCRYPT);

            try{

            }catch(mysqli_sql_exception){

            }
        }
    }
?>