<%@page import="Classes.Conteudo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Turma"%>
<%@page import="Classes.Professor"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SpeakUp</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap" rel="stylesheet">

        <link rel="stylesheet" href= "styles/style.css">
        <link rel="stylesheet" href="stylesAluno/media-query.css">

        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
    </head>
    <body id="aluno">
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

        </nav>
        <main id="mainAluno">
            <h1 class="title">Esse são Seus Alunos:</h1>
            <div class="containerCenter">
                <div class="containerProfessorAlunos">
                    <%
                        Turma tur = new Turma();
                        Conteudo cont = new Conteudo();
                        List<Turma> alunosTurma = new ArrayList<>();
                        alunosTurma = tur.consultarAlunos(vCodProfessor);
                        for (Turma alunos : alunosTurma) {
                            int vCodAluno = alunos.getCod_aluno();
                            String ultimoConteudoVisto = cont.consultarUltimoConteudoPorCodAluno(vCodAluno);
                    %>
                    <div class="box" onclick="window.location.href = 'professorAcompanharAluno.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>'">
                        <h4><% out.write(alunos.getNome_aluno());%></h4>
                        <h6><i class="fa-solid fa-book" style="margin-right: 0.5rem"></i>Último Conteúdo Visto:</h6>
                        <%

                            if (ultimoConteudoVisto == null) {

                        %>
                        <h6>Não Possui Conteúdos</h6>

                        <%} else {%>

                        <h6><%= ultimoConteudoVisto%></h6>

                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </main>
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
        <script src="js/main.js"></script>
    </body>
</html>