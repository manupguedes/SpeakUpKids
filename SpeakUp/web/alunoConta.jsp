<%@page import="Classes.Aluno"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Conta</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/media-query.css">

        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
    </head>
    <body>
        <%
            String vUsuAluno = request.getParameter("aluno");
            String vSenhaAluno = request.getParameter("senha");
            int vCodAluno = Integer.parseInt(request.getParameter("codigo"));
            Aluno alu1 = new Aluno();
            alu1.setUsu_aluno(vUsuAluno);
            alu1.setSenha_aluno(vSenhaAluno);
            alu1.setCod_aluno(vCodAluno);
            alu1 = alu1.consultarAluno();
        %>
        <nav class="navAluno">
            <img src="images/foneLogo.png" alt="Logo SpeakUp" class="foneLogo">
            <ul class="navbar-list">
                <li>
                    <a href="alunoMinhaSemana.jsp?pmensagem=&aluno=<%= vUsuAluno %>&senha=<%= vSenhaAluno %>&codigo=<%= vCodAluno %>" class="opcoes">
                        <i class="fa-regular fa-map"></i>
                        Minha Semana
                    </a>
                </li>
                <li>
                    <a href="alunoConteudo.jsp?pmensagem&aluno=<%= vUsuAluno %>&senha=<%= vSenhaAluno %>&codigo=<%= vCodAluno %>" class="opcoes">
                        <i class="fa-solid fa-book"></i>
                        Conteúdo
                    </a>
                </li>
                <li>
                    <a href="alunoAtividades.jsp?pmensagem&aluno=<%= vUsuAluno %>&senha=<%= vSenhaAluno %>&codigo=<%= vCodAluno %>" class="opcoes">
                        <i class="fa-regular fa-calendar"></i>
                        Atividades
                    </a>
                </li>
                <li class="user">
                    <a href="alunoConta.jsp?pmensagem&aluno=<%= vUsuAluno %>&senha=<%= vSenhaAluno %>&codigo=<%= vCodAluno %>">
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
                            <a href="conta.html"><i class="fa-solid fa-address-card"></i>Conta</a>
                        </li>
                    </ul>
                </div>
                <div class="social-and-signout">
                    <div class="signout">
                        <a href="/web/index.html"><i class="fa-solid fa-right-from-bracket"></i>Sign Out</a>
                    </div>
                </div>
            </aside>
        </footer>
    </nav>
    <main id="mainAluno">
        <div class="contaUsuario">
            <i class="fa-regular fa-user"></i>           
            <h4>Número de Matrícula: <%out.write("" + alu1.getCod_aluno());%> </h4>
            <h4>Nome Completo: <%out.write(alu1.getNome_aluno());%></h4>
            <h4>Email: <%out.write(alu1.getEmail_aluno());%></h4>
            <h4>Usuário: <%out.write(alu1.getUsu_aluno());%></h4>
            <h4>Senha: <%out.write(alu1.getSenha_aluno());%></h4>
            <a href="index.html">Sair</a>
        </div>
    </main>
    <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>
</body>
</html>