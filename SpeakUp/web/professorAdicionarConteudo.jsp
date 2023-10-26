<%@page import="Classes.Professor"%>
<%@page import="Classes.Conteudo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SpeakUp</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="stylesAluno/media-query.css">

        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
    </head>
    <body id="professor">
        <%
            String vUsuProfessor = request.getParameter("professor");
            String vSenhaProfessor = request.getParameter("senha");
            int vCodProfessor = Integer.parseInt(request.getParameter("codigo"));
            int vCodAluno = Integer.parseInt(request.getParameter("codAluno"));
            
        %>
        <nav class="navProfessor">
            <img src="images/professorLogo.png" alt="Logo SpeakUp" class="professorLogo">
             <ul class="navbar-list">
                <li>
                    <a href="professorAcompanharAluno.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-solid fa-file-circle-check"></i>
                        Acompanhamento
                    </a>
                </li>
                <li>
                    <a href="professorConteudo.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-solid fa-book"></i>
                        Conteúdo
                    </a>
                </li>
                <li>
                    <a href="professorAtividades.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-regular fa-calendar"></i>
                        Atividades
                    </a>
                </li>
                <li class="user">
                    <a href="professorConta.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <main>
            <section class="container">
                <div class="conteudo">
                    <form method="post" action="professorCriarConteudo.jsp?professor=<%out.write(vUsuProfessor);%>&senha=<%out.write(vSenhaProfessor);%>&codigo=<%out.write(""+vCodProfessor);%>&codAluno=<%out.write("" +vCodAluno);%>" id="adicionarConteudo">
                        <div class="descConteudoAdicionarConteudo">
                            <input type="hidden" name="cod_aluno" value="<% out.write("" + vCodAluno);%>">
                            <input type="text" id="tituloConteudo" placeholder="Título" class="informacaoConteudo" name="nome_cont">
                            <input type="file" id="arquivos" name="desc_cont">
                            <button type="submit" class="button">Salvar</button>
                        </div> 
                    </form>
                </div> 
            </section>
        </main>
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
        <script src="js/index.js"></script>
    </body>
</html>