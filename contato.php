<?php
    session_start();
    require 'Controller/conexao.php';
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Cada frame é inesquecível.">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <title>Contato - Alive Filmes</title>
    <link rel="stylesheet" href="css/reset.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="css/style.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="css/contato.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="css/footer.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="css/media.css?<?php echo time(); ?>">
</head>
<body>
    <header>
        <nav class="navbar" id="navbar">
            <div class="navbar_parte_cima" id="navbar_parte_cima">
                <ul>
                    <li>
                        <a href="index.php">
                            <img src="images/render_longa_sem_descricao.png" width="300" alt="">
                        </a>
                    </li>



                    <div class="navbar_parte_cima_direita">
                        <!-- Input Pesquisar -->
                        <div class="div_navbar_input_pesquisar">
                            <input class="navbar_input_pesquisar" type="text" name="navbar_pesquisa" id="navbar_pesquisa" placeholder="Pesquisar...">

                            <!-- Ícone Pesquisar-->
                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#F3F3F3"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                        </div>
                        <div class="div_navbar_botao_pesquisar">
                            <button class="btn_pesquisar_navbar">
                                <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#F3F3F3"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                            </button>
                        </div>

                        <div class="navbar_div_sociais">
                            <!-- Instagram -->
                            <li>
                                <a href="#" title="Instagram">
                                    <svg  class="navbar_svg_rede_social" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="28px" height="28px">    <path d="M 8 3 C 5.239 3 3 5.239 3 8 L 3 16 C 3 18.761 5.239 21 8 21 L 16 21 C 18.761 21 21 18.761 21 16 L 21 8 C 21 5.239 18.761 3 16 3 L 8 3 z M 18 5 C 18.552 5 19 5.448 19 6 C 19 6.552 18.552 7 18 7 C 17.448 7 17 6.552 17 6 C 17 5.448 17.448 5 18 5 z M 12 7 C 14.761 7 17 9.239 17 12 C 17 14.761 14.761 17 12 17 C 9.239 17 7 14.761 7 12 C 7 9.239 9.239 7 12 7 z M 12 9 A 3 3 0 0 0 9 12 A 3 3 0 0 0 12 15 A 3 3 0 0 0 15 12 A 3 3 0 0 0 12 9 z"/></svg>
                                </a>
                            </li>


                            <!-- Whatsapp -->
                            <li>
                                <a href="#" title="Whatsapp">
                                    <svg class="navbar_svg_rede_social"  xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="28px" height="28px">    <path d="M19.077,4.928C17.191,3.041,14.683,2.001,12.011,2c-5.506,0-9.987,4.479-9.989,9.985 c-0.001,1.76,0.459,3.478,1.333,4.992L2,22l5.233-1.237c1.459,0.796,3.101,1.215,4.773,1.216h0.004 c5.505,0,9.986-4.48,9.989-9.985C22.001,9.325,20.963,6.816,19.077,4.928z M16.898,15.554c-0.208,0.583-1.227,1.145-1.685,1.186 c-0.458,0.042-0.887,0.207-2.995-0.624c-2.537-1-4.139-3.601-4.263-3.767c-0.125-0.167-1.019-1.353-1.019-2.581 S7.581,7.936,7.81,7.687c0.229-0.25,0.499-0.312,0.666-0.312c0.166,0,0.333,0,0.478,0.006c0.178,0.007,0.375,0.016,0.562,0.431 c0.222,0.494,0.707,1.728,0.769,1.853s0.104,0.271,0.021,0.437s-0.125,0.27-0.249,0.416c-0.125,0.146-0.262,0.325-0.374,0.437 c-0.125,0.124-0.255,0.26-0.11,0.509c0.146,0.25,0.646,1.067,1.388,1.728c0.954,0.85,1.757,1.113,2.007,1.239 c0.25,0.125,0.395,0.104,0.541-0.063c0.146-0.166,0.624-0.728,0.79-0.978s0.333-0.208,0.562-0.125s1.456,0.687,1.705,0.812 c0.25,0.125,0.416,0.187,0.478,0.291C17.106,14.471,17.106,14.971,16.898,15.554z"/></svg>
                                </a>
                            </li>


                            <!-- Twitter -->
                            <li>
                                <a href="#" title="Twitter">
                                    <svg  class="navbar_svg_rede_social" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="28px" height="28px">    <path d="M22,3.999c-0.78,0.463-2.345,1.094-3.265,1.276c-0.027,0.007-0.049,0.016-0.075,0.023c-0.813-0.802-1.927-1.299-3.16-1.299 c-2.485,0-4.5,2.015-4.5,4.5c0,0.131-0.011,0.372,0,0.5c-3.353,0-5.905-1.756-7.735-4c-0.199,0.5-0.286,1.29-0.286,2.032 c0,1.401,1.095,2.777,2.8,3.63c-0.314,0.081-0.66,0.139-1.02,0.139c-0.581,0-1.196-0.153-1.759-0.617c0,0.017,0,0.033,0,0.051 c0,1.958,2.078,3.291,3.926,3.662c-0.375,0.221-1.131,0.243-1.5,0.243c-0.26,0-1.18-0.119-1.426-0.165 c0.514,1.605,2.368,2.507,4.135,2.539c-1.382,1.084-2.341,1.486-5.171,1.486H2C3.788,19.145,6.065,20,8.347,20 C15.777,20,20,14.337,20,8.999c0-0.086-0.002-0.266-0.005-0.447C19.995,8.534,20,8.517,20,8.499c0-0.027-0.008-0.053-0.008-0.08 c-0.003-0.136-0.006-0.263-0.009-0.329c0.79-0.57,1.475-1.281,2.017-2.091c-0.725,0.322-1.503,0.538-2.32,0.636 C20.514,6.135,21.699,4.943,22,3.999z"/></svg>
                                </a>
                            </li>


                            <!-- Facebook -->
                            <li>
                                <a href="#" title="Facebook">
                                    <svg class="navbar_svg_rede_social" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="28px" height="28px">    <path d="M12,2C6.477,2,2,6.477,2,12c0,5.013,3.693,9.153,8.505,9.876V14.65H8.031v-2.629h2.474v-1.749 c0-2.896,1.411-4.167,3.818-4.167c1.153,0,1.762,0.085,2.051,0.124v2.294h-1.642c-1.022,0-1.379,0.969-1.379,2.061v1.437h2.995 l-0.406,2.629h-2.588v7.247C18.235,21.236,22,17.062,22,12C22,6.477,17.523,2,12,2z"/></svg>
                                </a>
                            </li>
                        </div>
                    </div>
                </ul>
            </div>



            <div class="navbar_parte_baixo" id="navbar_parte_baixo">
                <ul>
                    <!-- Botão menu (visível apenas com max-width 750px) -->
                    <li class="li_navbar_botao_menu">
                        <button class="btn_menu_navbar">
                            <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#F3F3F3"><path d="M240-160q-33 0-56.5-23.5T160-240q0-33 23.5-56.5T240-320q33 0 56.5 23.5T320-240q0 33-23.5 56.5T240-160Zm240 0q-33 0-56.5-23.5T400-240q0-33 23.5-56.5T480-320q33 0 56.5 23.5T560-240q0 33-23.5 56.5T480-160Zm240 0q-33 0-56.5-23.5T640-240q0-33 23.5-56.5T720-320q33 0 56.5 23.5T800-240q0 33-23.5 56.5T720-160ZM240-400q-33 0-56.5-23.5T160-480q0-33 23.5-56.5T240-560q33 0 56.5 23.5T320-480q0 33-23.5 56.5T240-400Zm240 0q-33 0-56.5-23.5T400-480q0-33 23.5-56.5T480-560q33 0 56.5 23.5T560-480q0 33-23.5 56.5T480-400Zm240 0q-33 0-56.5-23.5T640-480q0-33 23.5-56.5T720-560q33 0 56.5 23.5T800-480q0 33-23.5 56.5T720-400ZM240-640q-33 0-56.5-23.5T160-720q0-33 23.5-56.5T240-800q33 0 56.5 23.5T320-720q0 33-23.5 56.5T240-640Zm240 0q-33 0-56.5-23.5T400-720q0-33 23.5-56.5T480-800q33 0 56.5 23.5T560-720q0 33-23.5 56.5T480-640Zm240 0q-33 0-56.5-23.5T640-720q0-33 23.5-56.5T720-800q33 0 56.5 23.5T800-720q0 33-23.5 56.5T720-640Z"/></svg>
                        </button>
                    </li>

                    <!-- Localização definida pelo usuário -->
                    <li>
                        <a href="#">
                            <div class="div_link_navbar_localizacao">
                                <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#F3F3F3"><path d="M480-480q33 0 56.5-23.5T560-560q0-33-23.5-56.5T480-640q-33 0-56.5 23.5T400-560q0 33 23.5 56.5T480-480Zm0 294q122-112 181-203.5T720-552q0-109-69.5-178.5T480-800q-101 0-170.5 69.5T240-552q0 71 59 162.5T480-186Zm0 106Q319-217 239.5-334.5T160-552q0-150 96.5-239T480-880q127 0 223.5 89T800-552q0 100-79.5 217.5T480-80Zm0-480Z"/></svg>
                                <p class="navbar_texto_link"><?php
                                    if(isset($_SESSION['logado'])){
                                        if(isset($_SESSION['cidade_cliente']) || isset($_SESSION['estado_cliente'])){
                                            echo $_SESSION['cidade_cliente'];
                                            echo ', ';
                                            echo $_SESSION['estado_cliente'];
                                        }else{
                                            echo 'Não definida';
                                        }
                                    }else{
                                        echo 'Não definida';
                                    }
                                ?></p>
                            </div>
                        </a>
                    </li>


                    <div class="div_navbar_parte_baixo_links_meio">
                        <li>
                            <a href="#" class="navbar_texto_link">Programação</a>
                        </li>


                        <li>
                            <a href="#" class="navbar_texto_link">Serviços</a>
                        </li>

                        
                        <li>
                            <a href="contato.php" class="navbar_texto_link">Contato</a>
                        </li>
                    </div>


                    <?php
                        if(isset($_SESSION['logado'])){
                            echo'
                            <div class="div_navbar_parte_baixo_links_fim">
                                <li>
                                    <a class="navbar_texto_link" href="usuario/perfil.php" title="Perfil">


                                        <svg xmlns="http://www.w3.org/2000/svg" height="28px" viewBox="0 -960 960 960" width="28px" fill="#F3F3F3"><path d="M234-276q51-39 114-61.5T480-360q69 0 132 22.5T726-276q35-41 54.5-93T800-480q0-133-93.5-226.5T480-800q-133 0-226.5 93.5T160-480q0 59 19.5 111t54.5 93Zm246-164q-59 0-99.5-40.5T340-580q0-59 40.5-99.5T480-720q59 0 99.5 40.5T620-580q0 59-40.5 99.5T480-440Zm0 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q53 0 100-15.5t86-44.5q-39-29-86-44.5T480-280q-53 0-100 15.5T294-220q39 29 86 44.5T480-160Zm0-360q26 0 43-17t17-43q0-26-17-43t-43-17q-26 0-43 17t-17 43q0 26 17 43t43 17Zm0-60Zm0 360Z"/></svg>
                                    </a>
                                </li>

                                <li>
                                    <form action="logout.php" method="post">


                                        <button class="btn_navbar_logout" type="submit" name="logout">Sair</button>
                                    </form>
                                </li>
                            </div>
                            ';
                        } else{
                            echo'
                            <li>
                                <a href="login.php" class="navbar_texto_link">Login</a>
                            </li>
                            ';
                        }
                    ?>
                </ul>
            </div>
        </nav>
    </header>



    <section class="secao_contato_1">
        <h1>entre em contato conosco</h1>

        <form action="<?php htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="post">
            <input type="text" name="nomeContato" placeholder="Nome">
            <input type="email" name="emailContato" id="">
            <textarea name="msgContato" id=""></textarea>
            <button type="submit" name="btn_contato">Enviar</button>
        </form>
    </section>
    


    <footer class="rodape">
        <div class="div_tudo_rodape">
            <div class="rodape_parte_cima">
                <div class="rodape_parte_cima_container rodape_parte_cima_container1">
                    <div class="div_rodape_logo">
                        <a href="index.php">
                            <img class="img_logo_rodape" src="images/render_longa_sem_descricao.png" alt="">
                        </a>
                    </div>

                    <div class="div_texto_seu_local_e_local">
                        <h2>Seu local:</h2>
                        <div class="div_link_rodape">
                            <a href="#">
                                <div class="div_link_navbar_localizacao">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#F3F3F3"><path d="M480-480q33 0 56.5-23.5T560-560q0-33-23.5-56.5T480-640q-33 0-56.5 23.5T400-560q0 33 23.5 56.5T480-480Zm0 294q122-112 181-203.5T720-552q0-109-69.5-178.5T480-800q-101 0-170.5 69.5T240-552q0 71 59 162.5T480-186Zm0 106Q319-217 239.5-334.5T160-552q0-150 96.5-239T480-880q127 0 223.5 89T800-552q0 100-79.5 217.5T480-80Zm0-480Z"/></svg>
                                    <p class="navbar_texto_link"><?php
                                    if(isset($_SESSION['logado'])){
                                        if(isset($_SESSION['cidade_cliente']) || isset($_SESSION['estado_cliente'])){
                                            echo $_SESSION['cidade_cliente'];
                                            echo ', ';
                                            echo $_SESSION['estado_cliente'];
                                        }else{
                                            echo 'Não definida';
                                        }
                                    }else{
                                        echo 'Não definida';
                                    }
                                ?></p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="rodape_parte_cima_container rodape_parte_cima_container2">
                    <h2>Links Úteis</h2>
                    <div class="div_rodape_todos_links_uteis">
                        <div class="div_link_rodape">
                            <a href="#"><p>Quem Somos</p></a>
                        </div>

                        <div class="div_link_rodape">
                            <a href="#"><p>FAQ</p></a>
                        </div>

                        <div class="div_link_rodape">
                            <a href="#"><p>Serviços</p></a>
                        </div>

                        <div class="div_link_rodape">
                            <a href="#"><p>Política de Privacidade</p></a>
                        </div>

                        <div class="div_link_rodape">
                            <a href="#"><p>Termos de Uso</p></a>
                        </div>
                    </div>
                </div>


            
                <div class="rodape_parte_cima_container rodape_parte_cima_container3">
                    <h2>Contato</h2>
                    <div class="div_rodape_todos_links_uteis">
                        <div class="div_link_rodape">
                            <a href="#"><p>Anuncie</p></a>
                        </div>

                        <div class="div_link_rodape">
                            <a href="#"><p>alivefilmes@gmail.com</p></a>
                        </div>

                        <div class="div_link_rodape">
                            <a href="#"><p>+55 11 98765-4321</p></a>
                        </div>
                    </div>
                    <div class="rodape_redes_sociais">
                        <!-- Instagram -->
                        <a href="#" title="Instagram">
                            <svg  class="rodape_svg_rede_social" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="30px" height="30px">    <path d="M 8 3 C 5.239 3 3 5.239 3 8 L 3 16 C 3 18.761 5.239 21 8 21 L 16 21 C 18.761 21 21 18.761 21 16 L 21 8 C 21 5.239 18.761 3 16 3 L 8 3 z M 18 5 C 18.552 5 19 5.448 19 6 C 19 6.552 18.552 7 18 7 C 17.448 7 17 6.552 17 6 C 17 5.448 17.448 5 18 5 z M 12 7 C 14.761 7 17 9.239 17 12 C 17 14.761 14.761 17 12 17 C 9.239 17 7 14.761 7 12 C 7 9.239 9.239 7 12 7 z M 12 9 A 3 3 0 0 0 9 12 A 3 3 0 0 0 12 15 A 3 3 0 0 0 15 12 A 3 3 0 0 0 12 9 z"/></svg>
                        </a>


                        <!-- Whatsapp -->
                        <a href="#" title="Whatsapp">
                            <svg class="rodape_svg_rede_social"  xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="30px" height="30px">    <path d="M19.077,4.928C17.191,3.041,14.683,2.001,12.011,2c-5.506,0-9.987,4.479-9.989,9.985 c-0.001,1.76,0.459,3.478,1.333,4.992L2,22l5.233-1.237c1.459,0.796,3.101,1.215,4.773,1.216h0.004 c5.505,0,9.986-4.48,9.989-9.985C22.001,9.325,20.963,6.816,19.077,4.928z M16.898,15.554c-0.208,0.583-1.227,1.145-1.685,1.186 c-0.458,0.042-0.887,0.207-2.995-0.624c-2.537-1-4.139-3.601-4.263-3.767c-0.125-0.167-1.019-1.353-1.019-2.581 S7.581,7.936,7.81,7.687c0.229-0.25,0.499-0.312,0.666-0.312c0.166,0,0.333,0,0.478,0.006c0.178,0.007,0.375,0.016,0.562,0.431 c0.222,0.494,0.707,1.728,0.769,1.853s0.104,0.271,0.021,0.437s-0.125,0.27-0.249,0.416c-0.125,0.146-0.262,0.325-0.374,0.437 c-0.125,0.124-0.255,0.26-0.11,0.509c0.146,0.25,0.646,1.067,1.388,1.728c0.954,0.85,1.757,1.113,2.007,1.239 c0.25,0.125,0.395,0.104,0.541-0.063c0.146-0.166,0.624-0.728,0.79-0.978s0.333-0.208,0.562-0.125s1.456,0.687,1.705,0.812 c0.25,0.125,0.416,0.187,0.478,0.291C17.106,14.471,17.106,14.971,16.898,15.554z"/></svg>
                        </a>


                        <!-- Twitter -->
                        <a href="#" title="Twitter">
                            <svg  class="rodape_svg_rede_social" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="30px" height="30px">    <path d="M22,3.999c-0.78,0.463-2.345,1.094-3.265,1.276c-0.027,0.007-0.049,0.016-0.075,0.023c-0.813-0.802-1.927-1.299-3.16-1.299 c-2.485,0-4.5,2.015-4.5,4.5c0,0.131-0.011,0.372,0,0.5c-3.353,0-5.905-1.756-7.735-4c-0.199,0.5-0.286,1.29-0.286,2.032 c0,1.401,1.095,2.777,2.8,3.63c-0.314,0.081-0.66,0.139-1.02,0.139c-0.581,0-1.196-0.153-1.759-0.617c0,0.017,0,0.033,0,0.051 c0,1.958,2.078,3.291,3.926,3.662c-0.375,0.221-1.131,0.243-1.5,0.243c-0.26,0-1.18-0.119-1.426-0.165 c0.514,1.605,2.368,2.507,4.135,2.539c-1.382,1.084-2.341,1.486-5.171,1.486H2C3.788,19.145,6.065,20,8.347,20 C15.777,20,20,14.337,20,8.999c0-0.086-0.002-0.266-0.005-0.447C19.995,8.534,20,8.517,20,8.499c0-0.027-0.008-0.053-0.008-0.08 c-0.003-0.136-0.006-0.263-0.009-0.329c0.79-0.57,1.475-1.281,2.017-2.091c-0.725,0.322-1.503,0.538-2.32,0.636 C20.514,6.135,21.699,4.943,22,3.999z"/></svg>
                        </a>


                        <!-- Facebook -->
                        <a href="#" title="Facebook">
                            <svg class="rodape_svg_rede_social" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="30px" height="30px">    <path d="M12,2C6.477,2,2,6.477,2,12c0,5.013,3.693,9.153,8.505,9.876V14.65H8.031v-2.629h2.474v-1.749 c0-2.896,1.411-4.167,3.818-4.167c1.153,0,1.762,0.085,2.051,0.124v2.294h-1.642c-1.022,0-1.379,0.969-1.379,2.061v1.437h2.995 l-0.406,2.629h-2.588v7.247C18.235,21.236,22,17.062,22,12C22,6.477,17.523,2,12,2z"/></svg>
                        </a>
                    </div>
                </div>
            </div>
            <div class="rodape_parte_baixo">
                <h2>Em breve disponível um App mobile</h2>
            </div>
        </div>
    </footer>
    <div class="rodape_final">
        <p>&copy; Copyright AliveFilmes 2025. Todos os direitos reservados</p>
    </div>
    <script src="js/script.js"></script>
</body>
<?php

    if(isset($_POST["btn_contato"])){

        

    }

?>