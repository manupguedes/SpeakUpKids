<%@page import="Classes.Questao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Atividade"%>
<%@page import="Classes.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Atividades</title>

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
        <main id="mainAluno">
            <div class="title">
                <h3>Olá <%out.write(alu1.getNome_aluno());%></h3>
                <h4>Essas são suas Atividades</h4> 
            </div>
            <div class="containerCenter">
                <div class="containerAlunoAtividades">
                    <%
                        Atividade ati = new Atividade();
                        Questao ques = new Questao();
                        int codAluno = alu1.getCod_aluno();

                        ati.setCod_aluno(codAluno);
                        ati.consultarAtividades();

                        List<Atividade> listaAtividade = new ArrayList<>();
                        listaAtividade = ati.consultarAtividades();

                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        for (Atividade atividade : listaAtividade) {
                            String statusAtividade = atividade.getStatus_atividade();
                            int codAtividade = atividade.getCod_atividade();
                            
                            String numeroQuestao = ques.consultarNumQuestaoAtividade(codAtividade);
                            if ("Em Andamento".equals(statusAtividade)) {
                    %>
                    <div class="box" onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividade.getCod_atividade()%>&numeroQuestao=<%= numeroQuestao%>'">
                        <h4><%out.write(atividade.getTitulo_atividade());%></h4>
                        <h6>Data de Início: <% out.write(sdf.format(atividade.getData_inicio())); %></h6>
                        <h6>Data de Encerramento: <% out.write(sdf.format(atividade.getData_encerramento()));%></h6>
                        <h6>Correção: <%out.write(atividade.getStatus_atividade());%></h6>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="box">
                        <h4><%out.write(atividade.getTitulo_atividade());%></h4>
                        <h6>Data de Início: <% out.write(sdf.format(atividade.getData_inicio())); %></h6>
                        <h6>Data de Encerramento: <% out.write(sdf.format(atividade.getData_encerramento())); %></h6>
                        <a class="revisarAtividade" href="alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividade.getCod_atividade()%>"> <% out.write(atividade.getStatus_atividade());%></a>
                    </div>
                    <%
                            }

                        }
                    %> 
                </div>
            </div>
        </main>
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
        <script src="js/index.js"></script>
    </body>
</html>