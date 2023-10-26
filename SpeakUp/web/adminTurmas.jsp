<%@page import="Classes.Administrador"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Turma"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SpeakUp</title>

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="styles/style.css" />
        <link rel="stylesheet" href="stylesAluno/media-query.css" />

        <link
            rel="shortcut icon"
            href="images/favicon-32x32.png"
            type="image/x-icon"
            />
    </head>
    <body id="aluno">
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
                    <a href="adminTurmas.jsp?pmensagem=Login feito com sucesso&admin=<%= vUsuAdmin%>&senha=<%= vSenhaAdmin%>&codigo=<%= vCodAdmin%>" class="opcoes">
                        <i class="fa-solid fa-user-group"></i>
                        Turmas
                    </a>
                </li>
                <li class="user">
                    <a href="adminConta.jsp?pmensagem=Login feito com sucesso&admin=<%= vUsuAdmin%>&senha=<%= vSenhaAdmin%>&codigo=<%= vCodAdmin%>">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <main id="mainAluno" ">
            <div class="containerCenter">
                <div class="adicionarTurma" >
                    <h4>Adicionar Turma</h4>
                    <div class="circle">
                        <a href="adminAdicionarTurma.jsp?pmensagem=&admin=<%= vUsuAdmin%>&senha=<%= vSenhaAdmin%>&codigo=<%= vCodAdmin%>">
                            <i class="fa-solid fa-plus"></i>
                        </a>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="containerCenter">
                <div class="containerProfessorAlunos">
                    <%
                        Turma tur = new Turma();
                        List<Turma> listaTurma = tur.consultarTurmas();
                        for (Turma turma : listaTurma) {
                    %>
                    <div class="boxTurma">
                        <h3>Turma <%= turma.getCod_turma()%></h3>
                        <h4>Nome Professor: <%= turma.getNome_professor()%></h4>
                        <h4>Nome Aluno:<br> <%= turma.getNome_aluno()%></h4>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </main>
        <script
            src="https://kit.fontawesome.com/87c9f9014b.js"
            crossorigin="anonymous"
        ></script>
        <script src="js/main.js"></script>
    </body>
</html>
