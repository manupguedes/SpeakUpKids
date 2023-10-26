<%@page import="Classes.Responsavel"%>
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
    <body id="professor">
        <%
            String vUsuResp = request.getParameter("responsavel");
            String vSenhaResp = request.getParameter("senha");
            int vCodResp = Integer.parseInt(request.getParameter("codigo"));
            int vCodAluno = Integer.parseInt(request.getParameter("codAluno"));
            Responsavel resp1 = new Responsavel();
            resp1.setUsu_resp(vUsuResp);
            resp1.setSenha_resp(vSenhaResp);
            resp1.setCod_resp(vCodResp);
            resp1 = resp1.consultarResponsavel();
        %>
        <nav class="navProfessor">
            <img src="images/responsavelLogo.png" alt="Logo SpeakUp" class="professorLogo">
            <ul class="navbar-list">
                <li>
                    <a href="responsavelAcompanharAluno.jsp?pmensagem=&responsavel=<%= vUsuResp %>&senha=<%= vSenhaResp %>&codigo=<%= vCodResp %>&codAluno=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-solid fa-file-circle-check"></i>
                        Acompanhamento
                    </a>
                </li>
                <li class="user">
                    <a href="responsavelConta.jsp?pmensagem=&responsavel=<%= vUsuResp %>&senha=<%= vSenhaResp %>&codigo=<%= vCodResp %>&codAluno=<%= vCodAluno%>">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </li>
            </ul>
            <aside class="sidebar-container">
                <div class="toggle">
                    <span class="lines"></span>
                    <span class="lines"></span>
                    <span class="lines"></span>
                </div>
                <div class="profile-and-links">
                    <div class="profile-card">
                    </div>
                    <ul class="links-list">
                        <li class="links">
                            <a href="minhaSemana.html"><i class="fa-regular fa-map"></i>Minha Semana</a>
                        </li>
                        <li class="links">
                            <a href="materias.html"><i class="fa-solid fa-book"></i>Matérias</a>
                        </li>
                        <li class="links">
                            <a href="atividades.html"><i class="fa-regular fa-calendar"></i></i>Atividades</a>
                        </li>
                        <li class="links">
                            <a href="mural.html"><i class="fa-regular fa-comments"></i></i>Mural</a>
                        </li>
                        <li class="links">
                            <a href="responsavelConta.html"><i class="fa-solid fa-address-card"></i>Conta</a>
                        </li>
                    </ul>
                </div>
                <div class="social-and-signout">
                    <div class="signout">
                        <a href="/web/index.html"><i class="fa-solid fa-right-from-bracket"></i>Sign Out</a>
                    </div>
                </div>
            </aside>
        </nav>
        <main id="mainListaExercicos">
            <div class="contaUsuario">
                <i class="fa-regular fa-user"></i>
                <h4>Código: <%out.write("" +resp1.getCod_resp());%></h4>
                <h4>Nome: <%out.write(resp1.getNome_resp());%> </h4>
                <h4>Email: <%out.write(resp1.getEmail_resp());%></h4>
                <h4>Usuário: <%out.write(resp1.getUsu_resp());%></h4>
                <h4>Senha: <%out.write(resp1.getSenha_resp());%></h4>
                <h4>Matrícula Aluno: <%out.write("" +resp1.getCod_aluno()   );%></h4>
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
