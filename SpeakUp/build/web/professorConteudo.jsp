<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Conteudo"%>
<%@page import="Classes.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <main id="mainProfessor">
            <h3 class="titulo">Esses são seus Conteúdos:</h3>
            <div class="containerCenter">
                <div class="containerProfessorConteudo">
                    <div class="containerCenter">
                        <div class="adicionarTurma" >
                            <h4>Adicionar Conteúdo</h4>
                            <div class="circle">
                                <a href="professorAdicionarConteudo.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>">
                                    <i class="fa-solid fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%  Professor prof = new Professor();
                        Conteudo cont = new Conteudo();
                        
                        cont.setCod_aluno(vCodAluno);
                        cont.consultarConteudos();
                        
                        String diretorio = "biblioteca/";
                        List<Conteudo> listaConteudo = new ArrayList<>();
                        listaConteudo = cont.consultarConteudos();
                        for (Conteudo conteudo : listaConteudo) {
                        String linkConteudo = conteudo.getDesc_cont();
                    %>

                    <table> 
                        <thead>
                        <th>Numero da Atividade</th>
                        <th>Conteúdo</th>
                        <th>Link para Arquivo</th>
                        </thead>

                        <tbody> 
                        <td><% out.write(Integer.toString(conteudo.getCod_cont())); %></td>
                        <td><%out.write(conteudo.getNome_cont()); %></td>
                        <td><a style="text-decoration: none; color: black" href="<%out.write(diretorio + linkConteudo);%>" target="_blank"> Abrir Arquivo</a></td>
                        </tbody>
                    </table>

                    <%
                        }
                    %>    
                </div>
        </main>
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
        <script src="js/main.js"></script>
    </body>
</html>