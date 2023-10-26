<%@page import="Classes.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
            String vUsuProfessor = request.getParameter("professor");
            String vSenhaProfessor = request.getParameter("senha");
            int vCodProfessor = Integer.parseInt(request.getParameter("codigo"));
            Professor prof1 = new Professor();
            prof1.setUsu_professor(vUsuProfessor);
            prof1.setSenha_professor(vSenhaProfessor);
            prof1.setCod_professor(vCodProfessor);
            prof1 = prof1.consultarProfessor();
        %>
        <nav class="navProfessor">
            <img src="images/professorLogo.png" alt="Logo SpeakUp" class="professorLogo">
            <ul class="navbar-list">
                <li>
                    <a href="professorAlunos.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>" class="opcoes">
                        <i class="fa-solid fa-user-group"></i>
                        Alunos
                    </a>
                </li>
                <li class="user">
                    <a href="professorAlunoConta.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>">
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
                            <a href="professorConta.html"><i class="fa-solid fa-address-card"></i>Conta</a>
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
                <h4>Código: <%out.write("" + prof1.getCod_professor());%></h4>
                <h4>Nome: <%out.write(prof1.getNome_professor());%> </h4>
                <h4>Email: <%out.write(prof1.getEmail_professor());%></h4>
                <h4>Usuário: <%out.write(prof1.getUsu_professor());%></h4>
                <h4>Senha: <%out.write(prof1.getSenha_professor());%></h4>
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
