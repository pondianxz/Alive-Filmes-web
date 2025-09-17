<?php
    session_start();
    require "Controller/conexao.php";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
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
<?php
    
    // se o usuario clicou no botao pra logar, faz o seguinte
    if(isset($_POST["botao_login"])){

        try{
            // pega as variaveis dos email e senha
            $email = mysqli_real_escape_string($conexao, $_POST["email"]);
            $senha = mysqli_real_escape_string($conexao, $_POST["senha"]);


            // pega o email que a pessoa digitou e compara com o banco de dados
            $sql1 = "SELECT email_cliente FROM tb_email_cliente WHERE email_cliente ='$email'";
            $email_conseguido = mysqli_query($conexao, $sql1);
            $email_conseguido_real = mysqli_fetch_assoc($email_conseguido);
            $email_conseguido_real_mesmo = $email_conseguido_real['email_cliente'];


            // pega o id do cliente, baseado no email q ele digitou
            $sql2 = "SELECT id_cliente FROM tb_email_cliente WHERE email_cliente = '$email'";
            $id_conseguido = mysqli_query($conexao, $sql2);
            $id_conseguido_real = mysqli_fetch_assoc($id_conseguido);
            $id_conseguido_real_mesmo = $id_conseguido_real['id_cliente'];


            // pega o nome do cliente
            $sql3 = "SELECT nome_cliente FROM tb_cliente WHERE id_cliente = '$id_conseguido_real_mesmo'";
            $nome_cliente_conseguido = mysqli_query($conexao, $sql3);
            $nome_cliente_conseguido_real = mysqli_fetch_assoc($nome_cliente_conseguido);
            $nome_cliente_conseguido_real_mesmo = $nome_cliente_conseguido_real['nome_cliente'];


            // pega a cidade do cliente
            $sql4 = "SELECT cidade_cliente FROM tb_cliente WHERE id_cliente = '$id_conseguido_real_mesmo'";
            $cidade_cliente_conseguido = mysqli_query($conexao, $sql4);
            $cidade_cliente_conseguido_real = mysqli_fetch_assoc($cidade_cliente_conseguido);
            $cidade_cliente_conseguido_real_mesmo = $cidade_cliente_conseguido_real['cidade_cliente'];


            // pega o estado do cliente
            $sql5 = "SELECT estado_cliente FROM tb_cliente WHERE id_cliente = '$id_conseguido_real_mesmo'";
            $estado_cliente_conseguido = mysqli_query($conexao, $sql5);
            $estado_cliente_conseguido_real = mysqli_fetch_assoc($estado_cliente_conseguido);
            $estado_cliente_conseguido_real_mesmo = $estado_cliente_conseguido_real['estado_cliente'];
            


            // se o email que a pessoa digitou, é o mesmo que tá no banco de dados, faz:
            if($email === $email_conseguido_real_mesmo){

                // pega a senha que a pessoa digitou e compara com a do banco de dados
                $sql6 = "SELECT senha_cliente FROM tb_cliente WHERE id_cliente = '$id_conseguido_real_mesmo'";
                $senha_conseguida =  mysqli_query($conexao, $sql6);
                $senha_conseguida_real = mysqli_fetch_assoc($senha_conseguida);
                $senha_conseguida_real_mesmo = $senha_conseguida_real['senha_cliente'];

                // verifica se a senha é real ou fake
                if(password_verify($senha, $senha_conseguida_real_mesmo)){

                    $_SESSION['logado']         = 1;
                    $_SESSION['nome_cliente']   = $nome_cliente_conseguido_real_mesmo;
                    $_SESSION['cidade_cliente'] = $cidade_cliente_conseguido_real_mesmo;
                    $_SESSION['estado_cliente'] = $estado_cliente_conseguido_real_mesmo;
                    $_SESSION['email_cliente']  = $email;
                    header("Location: index.php"); // redireciona para a index
                    exit();
                }else{
                    echo'ce digitou alguma coisa errada';
                }
            }else{
                echo'ce digitou alguma coisa errada';
            }

        }catch(mysqli_sql_exception){
            echo'deu alguma coisa errada com o servidor';
        }
    }
mysqli_close($conexao);
?>