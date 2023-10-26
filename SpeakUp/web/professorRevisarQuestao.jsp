<%@page import="Classes.Questao"%>
<%@page import="Classes.Atividade"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Conteudo"%>
<%@page import="Classes.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="pt-br">
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
            <%  int atividadeId = Integer.parseInt(request.getParameter("codAtividade"));
                Professor prof = new Professor();
                Atividade ati = new Atividade();
                Questao ques = new Questao();
                ati.setCod_atividade(atividadeId);
                ques.setCod_atividade(atividadeId);
                String tituloAtividade = ati.ConsultarTituloAtividade();
                List<Questao> listaQuestao = new ArrayList<>();
                listaQuestao = ques.consultarQuestoesPorAtividade(atividadeId);
                String valorAlternativa = listaQuestao.get(0).getAlternativa_correta();
            %>        
            <h3 class="titulo"><%= tituloAtividade%></h3>
            <form method="post" action="professorEncerrarCorrecao.jsp?pmensagem=TesteSitema&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>&atividadeId=<%= atividadeId%>" >
            <div style="display: flex; flex-direction: column; justify-content: center; align-items: center"> 
                <input type="text" value="<%= atividadeId%>" style="display: none" name="cod_atividade" />
                <h2 for="statusAtividade">Status Atividade</h2>
                <select id="statusAtividade" name="status_atividade">
                    <option name="">-</option>
                    <option value="Corrigida" >Corrigida</option>
                </select>
                <br>
                <textarea rows="3" cols="60" style="resize: none" name="comentario_professor">Digite Aqui Algum Comentário sobre a Resposta do Aluno</textarea>
                <br>
                <button type="submit">Encerrar Correção</button>
            </div>
            </form>
            <div class="containerCenter">                
                <div class="containerProfessorConteudo">  

                    <%for (Questao questao : listaQuestao) {
                            if ("-".equals(valorAlternativa)) {

                    %>
                    <table> 
                        <thead>
                        <th>Numero da Questão</th>
                        <th>Enunciado da Questão</th>
                        <th>Resposta Esperada</th>
                        <th>Resposta Cadastrada</th>
                        </thead>

                        <tbody> 
                        <td><% out.write(questao.getNumero_questao()); %></td>
                        <td><% out.write(questao.getEnunciado_questao()); %></td>
                        <td><% out.write(questao.getResposta_esperada()); %></td>
                        <td><% out.write(questao.getResposta_cadastrada()); %></td>
                        </tbody>
                    </table>

                    <%
                    } else {%>
                    <table> 
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
        <script src="js/main.js"></script>
    </body>
</html>