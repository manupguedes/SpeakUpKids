<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Atividade"%>
<%@page import="Classes.Questao"%>
<%@page import="Classes.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <body>
        <%
            String vUsuAluno = request.getParameter("aluno");
            String vSenhaAluno = request.getParameter("senha");
            int vCodAluno = Integer.parseInt(request.getParameter("codigo"));
            String vCodAtividade = request.getParameter("atividadeId");
            String numeroQuestao = request.getParameter("numeroQuestao");
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
            <%
                int atividadeId = Integer.parseInt(request.getParameter("atividadeId"));
                Atividade ati = new Atividade();
                Questao ques = new Questao();
                ati.setCod_atividade(atividadeId);
                String codProfessor = ati.ConsultarCodProfessor();
                int codAtividade = Integer.parseInt(vCodAtividade.trim());

                List<Questao> listaNumeroQuestoes = new ArrayList<>();
                listaNumeroQuestoes = ques.consultarNumeroQuestao(atividadeId);

                Questao questao1 = ques.consultarQuestoes(numeroQuestao, codAtividade);

            %>

            <div class="containerCenter">
                <div class="containerProfessorConteudo">
                    <div class="containerCenter">
                    </div>

                    <select id="selecioneOpcao" name="numeroQuestao">
                        <option value="">Selecione uma Questão</option>
                        <%        for (Questao questao : listaNumeroQuestoes) {
                        %>
                        <option value="alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeId%>&numeroQuestao=<%= questao.getNumero_questao()%>"><%= questao.getNumero_questao()%></option>
                        <%
                            }
                        %>
                    </select>


                    <script>
                        document.getElementById("selecioneOpcao").addEventListener("change", function () {
                            var selectedOption = this.value;
                            if (selectedOption) {
                                window.location.href = selectedOption;
                            }
                        });
                    </script>

                    <h1><%= questao1.getNumero_questao()%></h1>
                    <h1><%= questao1.getEnunciado_questao()%></h1>

                    <%
                        Questao questao2 = ques.consultarResposataCadastrada(codAtividade, numeroQuestao);
                        String alternativaCorreta = questao1.getAlternativa_correta();
                        if ("-".equals(alternativaCorreta)) {
                    %>

                    <form method="post" class="formEntregarAtividade" action="alunoCadastrarQuestao.jsp?pmensagem&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= vCodAtividade%>&numeroQuestao=<%= numeroQuestao%>">
                        <input type="text" value="<%= vCodAluno%>" style="display: none" name="cod_aluno" />
                        <input type="text" value="<%= codProfessor%>" style="display: none" name="cod_professor" />
                        <input type="text" value="<%= atividadeId%>" style="display: none" name="cod_atividade" /> 
                        <input type="text" value="<%= questao1.getCod_questao()%>" style="display: none" name="cod_questao" />
                        <%
                            if (questao2.getResposta_cadastrada() != null) {

                        %>
                        <input type="text" class="numQuestao" placeholder="Digite a Resposta Aqui" name="resposta_cadastrada" required="true" value="<%= questao2.getResposta_cadastrada()%>" />
                        <%} else { %>
                        <input type="text" class="numQuestao" placeholder="Digite a Resposta Aqui" name="resposta_cadastrada" required="true" />
                        <%
                            }
                        %>
                        <button type="submit" class="botaoFazerQuestao">Salvar Resposta</button>      
                        </form>
                        <a href=alunoMinhaSemana.jsp?pmensagem=&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>>
                            <button class="botaoFazerQuestao">Entregar Atividade</button> 
                        </a>
                    <%
                    } else {
                    %>
                    <form method="post" class="formEntregarAtividade" action="alunoCadastrarQuestao.jsp?pmensagem&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= vCodAtividade%>&numeroQuestao=<%= numeroQuestao%>">
                        <input type="text" value="<%= vCodAluno%>" style="display: none" name="cod_aluno" />
                        <input type="text" value="<%= codProfessor%>" style="display: none" name="cod_professor" />
                        <input type="text" value="<%= atividadeId%>" style="display: none" name="cod_atividade" />
                        <input type="text" value="<%= questao1.getCod_questao()%>" style="display: none" name="cod_questao" />
                        <div class="questao"> 
                            <input type="checkbox" id="alternativaA" value="A" name="resposta_cadastrada" />
                            <label for="alternativaA">
                                <span class="alternativa">A</span>
                                <%= questao1.getAlternativaA()%>
                            </label>
                        </div>
                        <div class="questao">
                            <input type="checkbox" id="alternativaB" value="B" name="resposta_cadastrada" />
                            <label for="alternativaB">
                                <span class="alternativa">B</span>
                                <%= questao1.getAlternativaB()%>
                            </label>
                        </div>
                        <div class="questao">
                            <input type="checkbox" id="alternativaC" value="C" name="resposta_cadastrada" />
                            <label for="alternativaC">
                                <span class="alternativa">C</span>
                                <%= questao1.getAlternativaC()%>
                            </label>
                        </div>
                        <div class="questao">
                            <input type="checkbox" id="alternativaD" value="D" name="resposta_cadastrada" />
                            <label for="alternativaD">
                                <span class="alternativa">D</span>
                                <%= questao1.getAlternativaD()%>
                            </label>
                        </div>
                        <button type="submit">Salvar Resposta</button>
                    </form>
                    <%
                        }
                    %>
                </div>
        </main>  
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
        <script src="js/index.js"></script>
    </body>
</html>
