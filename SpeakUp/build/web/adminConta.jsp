<%@page import="Classes.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Conta</title>

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
        <%
            String vUsuAdmin = request.getParameter("admin");
            String vSenhaAdmin = request.getParameter("senha");
            int vCodAdmin = Integer.parseInt(request.getParameter("codigo"));
            Administrador admin1 = new Administrador();
            admin1.setUsu_admin(vUsuAdmin);
            admin1.setSenha_admin(vSenhaAdmin);
            admin1.setCod_admin(vCodAdmin);
            admin1 = admin1.consultarAdministrador();
        %>
        <nav class="navProfessor">
            <img
                src="images/professorLogo.png"
                alt="Logo SpeakUp"
                class="professorLogo"
                />
            <ul class="navbar-list">
                <li>
                    <a href="adminTurmas.jsp?pmensagem=&admin=<%= vUsuAdmin%>&senha=<%= vSenhaAdmin%>&codigo=<%= vCodAdmin%>" class="opcoes">
                        <i class="fa-solid fa-user-group"></i>
                        Turmas
                    </a>
                </li>
                <li class="user">
                    <a href="adminConta.jsp?pmensagem=&admin=<%= vUsuAdmin%>&senha=<%= vSenhaAdmin%>&codigo=<%= vCodAdmin%>">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <main id="mainListaExercicos">
            <div class="contaUsuario">
                <i class="fa-regular fa-user"></i>
                <h4>Número de Matrícula: <%out.write("" + admin1.getCod_admin());%> </h4>
                <h4>Nome Completo: <%out.write(admin1.getNome_admin());%></h4>
                <h4>Email: <%out.write(admin1.getEmail_admin());%></h4>
                <h4>Usuário: <%out.write(admin1.getUsu_admin());%></h4>
                <h4>Senha: <%out.write(admin1.getSenha_admin());%></h4>
                <a href="index.html">Sair</a>
            </div>
        </main>
        <script
            src="https://kit.fontawesome.com/87c9f9014b.js"
            crossorigin="anonymous"
        ></script>
        <script src="js/index.js"></script>
    </body>
</html>
