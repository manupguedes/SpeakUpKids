<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Conteudo"%>
<%@page import="Classes.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Matérias</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="stylesAluno/media-query.css">

        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
    </head>
    <body id="aluno">
        <%
            String vUsuAluno = request.getParameter("aluno");
            String vSenhaAluno = request.getParameter("senha");
            int vCodAluno = Integer.parseInt(request.getParameter("codigo"));
        %>
        <nav class="navAluno">
            <img src="images/foneLogo.png" alt="Logo SpeakUp" class="foneLogo">
            <ul class="navbar-list">
                <li>
                    <a href="alunoMinhaSemana.jsp?pmensagem=&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-regular fa-map"></i>
                        Minha Semana
                    </a>
                </li>
                <li>
                    <a href="alunoConteudo.jsp?pmensagem&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-solid fa-book"></i>
                        Conteúdo
                    </a>
                </li>
                <li>
                    <a href="alunoAtividades.jsp?pmensagem&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-regular fa-calendar"></i>
                        Atividades
                    </a>
                </li>
                <li class="user">
                    <a href="alunoConta.jsp?pmensagem&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <main id="mainProfessor">
            <%
                Conteudo cont = new Conteudo();

                cont.setCod_aluno(vCodAluno);
                cont.consultarConteudos();

                String diretorio = "biblioteca/";
                List<Conteudo> listaConteudo = new ArrayList<>();
                listaConteudo = cont.consultarConteudos();

                if (listaConteudo.size() == 0) {
            %>
            <h3 class="titulo">Você não Possui Conteúdos para Estudar ;)</h3>
            <%
            } else {

            %>
            <h3 class="titulo">Esses são seus Conteúdos:</h3>
            <div class="containerCenter">
                <div class="containerProfessorConteudo">
                    <%  for (Conteudo conteudo : listaConteudo) {
                    String linkConteudo = conteudo.getDesc_cont();
                    %>

                    <table style="transform: scale(1.3)"> 
                        <thead>
                        <th>Numero da Atividade</th>
                        <th>Conteúdo</th>
                        <th>Link para Arquivo</th>
                        </thead>

                        <tbody> 
                        <td><% out.write(Integer.toString(conteudo.getCod_cont())); %></td>
                        <td><%out.write(conteudo.getNome_cont()); %></td>
                        <td><a style="text-decoration: none; color: black" target="_blank" href="<%out.write(diretorio + linkConteudo); %> ">Abrir Link</a></td>
                        </tbody>
                    </table>

                    <%
                            }
                        }

                    %>   
                </div>
        </main>
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
    </body>
</html>