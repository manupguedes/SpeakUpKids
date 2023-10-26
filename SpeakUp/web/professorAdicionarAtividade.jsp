<%@page import="Classes.Professor"%>
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
        <link rel="stylesheet" href="styles/media-query.css" />

        <link
            rel="shortcut icon"
            href="images/favicon-32x32.png"
            type="image/x-icon"
            />
    </head>
    <body id="professor">
        <%
            String vUsuProfessor = request.getParameter("professor");
            String vSenhaProfessor = request.getParameter("senha");
            int vCodProfessor = Integer.parseInt(request.getParameter("codigo"));
            int vCodAluno = Integer.parseInt(request.getParameter("codAluno"));
                       
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
        <main id="mainListaExercicos">
            <form
                action="professorCriarAtividade.jsp?pmensagem=Teste de Sistema&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>"
                class="formQuestoes"
                id="formNovaQuestao"
                method="post"
                >
                <h1>Nova Atividade</h1>
                <br>
                <div class="inputs">
                    <input type="hidden" name="cod_aluno" value="<% out.write("" + vCodAluno);%>">
                    <input type="hidden" name="cod_professor" value="<% out.write("" + vCodProfessor);%>">
                    <i class="fa-solid fa-clipboard" style="font-size: 1rem"></i>
                    <input type="text" name="titulo_atividade" placeholder="Título Atividade">
                </div>
                <label for="DataIniAtt">Data Início da Atividade</label>
                <input type="date" id="DataIniAtt" name="data_inicio" required />
                <br>
                <label for="DataTerAtt">Data Termino da Atividade</label>
                <input type="date" id="DataTerAtt" name="data_encerramento" required />
                <input type="hidden" name="status_atividade" value="Em Andamento" required />
                
                <button type="submit" class="botao"> Adicionar Atividade </button>
            </form>
        </main>
        <script
            src="https://kit.fontawesome.com/87c9f9014b.js"
            crossorigin="anonymous"
        ></script>
        <script src="js/index.js"></script>
    </body>
</html>