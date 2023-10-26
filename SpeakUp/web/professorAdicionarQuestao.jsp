<%@page import="Classes.Professor"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Atividade"%>
<%@page session="true"%>
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
            String vCodAluno = request.getParameter("codAluno");
            String vCodAtividade = request.getParameter("codAtividade");
            
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
                action="professorCriarQuestao.jsp?pmensagem=TesteQuestao&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>&codAtividade=<%= vCodAtividade%>"
                class="formQuestoes"
                id="formNovaQuestao"
                method="post"
                >
                <div class="questao">
                    <input type="text" class="numQuestao" value="Questao" name="numero_questao"></input>
                </div> 
                <input type="text" name="cod_atividade" value="<%= vCodAtividade%>" style="display: none">
                <input type="radio" id="dissertativa" checked />
                <label for="dissertativa" class="op">Dissertativa</label>
                <input type="radio" id="alternativa" />
                <label for="alternativa" class="op">Alternativa</label>
                <div class="enunciado">
                    <label for="texto">Enunciado da Questão</label>
                    <textarea id="texto" rows="3" cols="40" name="enunciado_questao" required="required"></textarea>
                </div>
                <h1>Resposta Esperada</h1>
                <textarea
                    id="respostaDissertativa"
                    name="resposta_esperada"
                    rows="3"
                    cols="40"
                    style="resize: none"
                    class="respostaAluno"
                    ></textarea>

                <div class="alternativa">
                    <label for="opcaoA">Opção A:</label>
                    <input type="text" id="opcaoA" name="alternativaA" value=""/><br />

                    <label for="opcaoB">Opção B: </label>
                    <input type="text" id="opcaoB" name="alternativaB" value=""/><br />

                    <label for="opcaoC">Opção C:</label>
                    <input type="text" id="opcaoC" name="alternativaC" value=""/><br />

                    <label for="opcaoD">Opção D:</label>
                    <input type="text" id="opcaoD" name="alternativaD" value=""/><br />

                    <label for="alternativaCorreta">Alternativa Correta:</label>
                    <select id="alternativaCorreta" name="alternativa_correta">
                        <option name="">-</option>
                        <option value="A" name="">A</option>
                        <option value="B" name="">B</option>
                        <option value="C" name="">C</option>
                        <option value="D" name="">D</option>
                    </select
                    ><br />
                </div>
                <button type="submit" class="botao"> Adicionar Questão </button>
            </form>
            <div class="containerCenter">
                <a href="professorAtividades.jsp?pmensagem=TesteQuestao&professor=<%= vUsuProfessor%>&senha=<%= vSenhaProfessor%>&codigo=<%= vCodProfessor%>&codAluno=<%= vCodAluno%>"><button class="botaoEncerrarAtividade" style="margin-top: 10px">Encerrar Atividade</button></a>
            </div>
        </main>
        <script
            src="https://kit.fontawesome.com/87c9f9014b.js"
            crossorigin="anonymous"
        ></script>
        <script src="js/index.js"></script>
    </body>
</html>
