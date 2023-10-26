<%-- 
    Document   : alunoRevisarAtividade
    Created on : 5 de out. de 2023, 13:54:55
    Author     : joao_ponchiroli
--%>

<%@page import="Classes.Atividade"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Questao"%>
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
            <%  int atividadeId = Integer.parseInt(request.getParameter("atividadeId"));
                Atividade ati = new Atividade();
                Questao ques = new Questao();
                ati.setCod_atividade(atividadeId);
                ques.setCod_atividade(atividadeId);
                String tituloAtividade = ati.ConsultarTituloAtividade();
                String comentarioProfessor = ques.ConsultarComentarioProfessor();
                List<Questao> listaQuestao = new ArrayList<>();
                listaQuestao = ques.consultarQuestoesPorAtividade(atividadeId);
            %>                  
            <div>
                <h3 class="titulo"><%= tituloAtividade%></h3>
                <h4 class="subTitulo">Seu Professor Deixou um Comentário para essa Atividade:</h4>    
                <h5 class="subTitulo"><%= comentarioProfessor%></h5>
            </div>
            <div class="containerCenter">                
                <div class="containerProfessorConteudo">  
                    <%for (Questao questao : listaQuestao) {
                            String valorAlternativa = listaQuestao.get(0).getAlternativa_correta();
                            if ("-".equals(valorAlternativa)) {
                    %>
                    <table style="transform: scale(1.5)"> 
                        <thead>
                        <th>Numero da Questão</th>
                        <th>Enunciado da Questão</th>
                        <th>Resposta Esperada</th>
                        <th>Resposta Cadastrada</th>
                        </thead>
                        <br><br>
                        <tbody> 
                        <td><% out.write(questao.getNumero_questao()); %></td>
                        <td><% out.write(questao.getEnunciado_questao()); %></td>
                        <td><% out.write(questao.getResposta_esperada()); %></td>
                        <td><% out.write(questao.getResposta_cadastrada()); %></td>
                        </tbody>
                    </table>

                    <%
                    } else {%>
                    <table style="transform: scale(1.4)"> 
                        <thead>
                        <th>Numero da Questão</th>
                        <th>Enunciado da Questão</th>
                        <th>Alternativa Correta</th>
                        <th>Resposta Cadastrada</th>
                        </thead>

                        <tbody> 
                        <td><% out.write(Integer.toString(questao.getCod_questao())); %></td>
                        <td><% out.write(questao.getEnunciado_questao()); %></td>
                        <td><% out.write(questao.getAlternativa_correta()); %></td>
                        <td><% out.write(questao.getResposta_cadastrada()); %></td>
                        </tbody>
                    </table>
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