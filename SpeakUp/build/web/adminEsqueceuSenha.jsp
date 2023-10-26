<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Recuperar Senha</title>

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="styles/style.css" />
        <link rel="stylesheet" href="styles/media-query.css" />

        <link
            rel="shortcut icon"
            href="images/favicon-32x32.png"
            type="image/x-icon"
            />
    </head>
    <body>
        <img src="images/logoFinal.png" alt="SpeakUp Kids" class="logo" />
        <main id="bodyLogin">
            <div class="backArrow">
                <a href="index.html"><i class="fa-solid fa-arrow-left"></i></a>
            </div>
            <div class="container" style="top: 100px">
                <form action="adminRedefinirSenha.jsp" method="post" class="formCadastrar">
                    <button
                        class="fa-solid fa-eye"
                        id="olhoLogin"
                        id="eye"
                        type="button"
                        onclick="mostrarOcultarSenha()"
                        style="top: 110px; left: 93px;" 
                        ></button>
                    <button
                        class="fa-solid fa-eye"
                        id="olhoLogin"
                        id="eye"
                        type="button"
                        onclick="mostrarOcultarSenha2()"
                        style="top: 155px"
                        ></button>
                    <h3 class="titleRecuperacao" style="top: -20px">Recuperação de Senha</h3>
                    <div class="inputs">
                        <i class="fa-sharp fa-solid fa-envelope"></i>
                        <input type="email" placeholder="Email" id="email" name="email_admin" required />
                        <br />
                        <label for="senha" class="fa-solid fa-lock"></label>
                        <input type="password" placeholder="Nova Senha" id="senha" name="senha_admin" required />
                        <br />
                        <label for="confirmarSenha" class="fa-solid fa-lock"></label>
                        <input type="password" placeholder="Confirmar Senha" id="confirmarSenha" name="confirmar_senha" required />
                        <br />
                        <button type="submit" class="botaoLogar">Alterar Senha</button>
                    </div>
                </form> 
            </div>
        </main>
        <script
            src="https://kit.fontawesome.com/87c9f9014b.js"
            crossorigin="anonymous"
        ></script>
        <script src="js/index.js"></script>
    </body>
</html>