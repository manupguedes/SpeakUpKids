<%@page import="Classes.Questao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Atividade"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Classes.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SpeakUp</title>

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
            <div class="boasVindas">
                <h3>Olá <%out.write(alu1.getNome_aluno());%> :)</h3>
                <h4>Essas são suas Atividade desta Semana</h4>
            </div>
            <br><br>               
            <%
                Atividade ati = new Atividade();
                Questao ques = new Questao();

                List<Atividade> listaAtividadeDomingo = new ArrayList<>();
                listaAtividadeDomingo = ati.consultarAtividadeDomingo();
                if (listaAtividadeDomingo.size() == 0) {
            %>
            <div class="diaSemana">
                <h3>Dom</h3>
                <div class="atividade">Sem atividades agendadas até o momento.</div>
            </div>
            <br>
            <%
            } else {
                for (int attDomingo = 0; attDomingo < listaAtividadeDomingo.size(); attDomingo++) {
                    Atividade atividadeDomingo = listaAtividadeDomingo.get(attDomingo);
                    int codAtividadeDomingo = atividadeDomingo.getCod_atividade();
                    String numeroQuestaoDomingo = ques.consultarNumQuestaoAtividade(codAtividadeDomingo);
                    String statusAtividade = atividadeDomingo.getStatus_atividade();
                    if ("Em Andamento".equals(statusAtividade)) {
            %>

            <div class="diaSemana">
                <% if (attDomingo == 0) { %>
                <h3>Dom</h3>
                <% } %>
                <div class="atividade" <% if (attDomingo > 0) { %>style="margin-left: 4.8rem;"<% } %> onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeDomingo.getCod_atividade()%>&numeroQuestao=<%= numeroQuestaoDomingo%>'">
                    <h4><% out.write(atividadeDomingo.getTitulo_atividade()); %></h4><span><% out.write(atividadeDomingo.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>
            <br>

            <%
            } else {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeDomingo.getCod_atividade()%>'">
                <% if (attDomingo == 0) { %>
                <h3>Dom</h3>
                <% } %>
                <div class="atividade" <% if (attDomingo > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeDomingo.getTitulo_atividade()); %></h4><span><% out.write(atividadeDomingo.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
                        }
                    }
                }
            %>

            <%---------------------------------------------------------------------------------------%>

            </div>
            <br>
            <%
                List<Atividade> listaAtividadeSegunda = new ArrayList<>();
                listaAtividadeSegunda = ati.consultarAtividadeSegunda();
                if (listaAtividadeSegunda.size() == 0) {
            %>
            <div class="diaSemana">
                <h3>Seg</h3>
                <div class="atividade">Sem atividades agendadas até o momento.</div>
            </div>
            <%
            } else {

                for (int attSegunda = 0; attSegunda < listaAtividadeSegunda.size(); attSegunda++) {
                    Atividade atividadeSegunda = listaAtividadeSegunda.get(attSegunda);
                    int codAtividadeSegunda = atividadeSegunda.getCod_atividade();
                    String numeroQuestaoSegunda = ques.consultarNumQuestaoAtividade(codAtividadeSegunda);
                    String statusAtividade = atividadeSegunda.getStatus_atividade();
                    if ("Em Andamento".equals(statusAtividade)) {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeSegunda.getCod_atividade()%>&numeroQuestao=<%= numeroQuestaoSegunda%>'">
                <% if (attSegunda == 0) { %>
                <h3>Seg</h3>
                <% } %>
                <div class="atividade" <% if (attSegunda > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeSegunda.getTitulo_atividade()); %></h4><span><% out.write(atividadeSegunda.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
            } else {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeSegunda.getCod_atividade()%>'">
                <% if (attSegunda == 0) { %>
                <h3>Seg</h3>
                <% } %>
                <div class="atividade" <% if (attSegunda > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeSegunda.getTitulo_atividade()); %></h4><span><% out.write(atividadeSegunda.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
                        }
                    }
                }
            %>

            <%---------------------------------------------------------------------------------------%>

            <br>
            <br>
            <%
                List<Atividade> listaAtividadeTerca = new ArrayList<>();
                listaAtividadeTerca = ati.consultarAtividadeTerca();
                if (listaAtividadeTerca.size() == 0) {
            %>
            <div class="diaSemana">
                <h3>Ter</h3>
                <div class="atividade">Sem atividades agendadas até o momento.</div>
            </div>
            <%
            } else {

                for (int attTerca = 0; attTerca < listaAtividadeTerca.size(); attTerca++) {
                    Atividade atividadeTerca = listaAtividadeTerca.get(attTerca);
                    int codAtividadeTerca = atividadeTerca.getCod_atividade();
                    String numeroQuestaoTerca = ques.consultarNumQuestaoAtividade(codAtividadeTerca);
                    String statusAtividade = atividadeTerca.getStatus_atividade();
                    if ("Em Andamento".equals(statusAtividade)) {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeTerca.getCod_atividade()%>&numeroQuestao=<%= numeroQuestaoTerca%>'">
                <% if (attTerca == 0) { %>
                <h3>Ter</h3>
                <% } %>
                <div class="atividade" <% if (attTerca > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeTerca.getTitulo_atividade()); %></h4><span><% out.write(atividadeTerca.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
            } else {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeTerca.getCod_atividade()%>'">
                <% if (attTerca == 0) { %>
                <h3>Ter</h3>
                <% } %>
                <div class="atividade" <% if (attTerca > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeTerca.getTitulo_atividade()); %></h4><span><% out.write(atividadeTerca.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
                        }
                    }
                }
            %>

            <%---------------------------------------------------------------------------------------%>

            <br>
            <br>
            <%
                List<Atividade> listaAtividadeQuarta = new ArrayList<>();
                listaAtividadeQuarta = ati.consultarAtividadeQuarta();
                if (listaAtividadeQuarta.size() == 0) {
            %>
            <div class="diaSemana">
                <h3>Qua</h3>
                <div class="atividade">Sem atividades agendadas até o momento.</div>
            </div>
            <%
            } else {

                for (int attQuarta = 0; attQuarta < listaAtividadeQuarta.size(); attQuarta++) {
                    Atividade atividadeQuarta = listaAtividadeQuarta.get(attQuarta);
                    int codAtividadeQuarta = atividadeQuarta.getCod_atividade();
                    String numeroQuestaoQuarta = ques.consultarNumQuestaoAtividade(codAtividadeQuarta);
                    String statusAtividade = atividadeQuarta.getStatus_atividade();
                    if ("Em Andamento".equals(statusAtividade)) {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeQuarta.getCod_atividade()%>&numeroQuestao=<%= numeroQuestaoQuarta%>'">
                <% if (attQuarta == 0) { %>
                <h3>Qua</h3>
                <% } %>
                <div class="atividade" <% if (attQuarta > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeQuarta.getTitulo_atividade()); %></h4><span><% out.write(atividadeQuarta.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
            } else {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeQuarta.getCod_atividade()%>'">
                <% if (attQuarta == 0) { %>
                <h3>Qua</h3>
                <% } %>
                <div class="atividade" <% if (attQuarta > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeQuarta.getTitulo_atividade()); %></h4><span><% out.write(atividadeQuarta.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
                        }
                    }
                }
            %>

            <%---------------------------------------------------------------------------------------%>

            <br>
            <br>
            <%
                List<Atividade> listaAtividadeQuinta = new ArrayList<>();
                listaAtividadeQuinta = ati.consultarAtividadeQuinta();
                if (listaAtividadeQuinta.size() == 0) {
            %>
            <div class="diaSemana">
                <h3>Qui</h3>
                <div class="atividade">Sem atividades agendadas até o momento.</div>
            </div>
            <%
            } else {

                for (int attQuinta = 0; attQuinta < listaAtividadeQuinta.size(); attQuinta++) {
                    Atividade atividadeQuinta = listaAtividadeQuinta.get(attQuinta);
                    int codAtividadeQuinta = atividadeQuinta.getCod_atividade();
                    String numeroQuestaoQuinta = ques.consultarNumQuestaoAtividade(codAtividadeQuinta);
                    String statusAtividade = atividadeQuinta.getStatus_atividade();
                    if ("Em Andamento".equals(statusAtividade)) {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeQuinta.getCod_atividade()%>&numeroQuestao=<%= numeroQuestaoQuinta%>'">
                <% if (attQuinta == 0) { %>
                <h3>Qui</h3>
                <% } %>
                <div class="atividade" <% if (attQuinta > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeQuinta.getTitulo_atividade()); %></h4><span><% out.write(atividadeQuinta.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
            } else {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeQuinta.getCod_atividade()%>'">
                <% if (attQuinta == 0) { %>
                <h3>Qui</h3>
                <% } %>
                <div class="atividade" <% if (attQuinta > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeQuinta.getTitulo_atividade()); %></h4><span><% out.write(atividadeQuinta.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
                        }
                    }
                }
            %>

            <%---------------------------------------------------------------------------------------%>

            <br>
            <br>
            <%
                List<Atividade> listaAtividadeSexta = new ArrayList<>();
                listaAtividadeSexta = ati.consultarAtividadeSexta();
                if (listaAtividadeSexta.size() == 0) {
            %>
            <div class="diaSemana">
                <h3>Sex</h3>
                <div class="atividade">Sem atividades agendadas até o momento.</div>
            </div>
            <%
            } else {

                for (int attSexta = 0; attSexta < listaAtividadeSexta.size(); attSexta++) {
                    Atividade atividadeSexta = listaAtividadeSexta.get(attSexta);
                    int codAtividadeSexta = atividadeSexta.getCod_atividade();
                    String numeroQuestaoSexta = ques.consultarNumQuestaoAtividade(codAtividadeSexta);
                    String statusAtividade = atividadeSexta.getStatus_atividade();
                    if ("Em Andamento".equals(statusAtividade)) {
            %>
            <div class="diaSemana" onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeSexta.getCod_atividade()%>&numeroQuestao=<%= numeroQuestaoSexta%>'">
                <% if (attSexta == 0) { %>
                <h3>Sex</h3>
                <% } %>
                <div class="atividade" <% if (attSexta > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeSexta.getTitulo_atividade()); %></h4><span><% out.write(atividadeSexta.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>
            <%
            } else {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeSexta.getCod_atividade()%>'">
                <% if (attSexta == 0) { %>
                <h3>Sex</h3>
                <% } %>
                <div class="atividade" <% if (attSexta > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeSexta.getTitulo_atividade()); %></h4><span><% out.write(atividadeSexta.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
                        }
                    }
                }
            %>


            <%---------------------------------------------------------------------------------------%>

            <br>
            <br>
            <%
                List<Atividade> listaAtividadeSabado = new ArrayList<>();
                listaAtividadeSabado = ati.consultarAtividadeSabado();
                if (listaAtividadeSabado.size() == 0) {
            %>
            <div class="diaSemana">
                <h3>Sab</h3>
                <div class="atividade">Sem atividades agendadas até o momento.</div>
            </div>
            <%
            } else {

                for (int attSabado = 0; attSabado < listaAtividadeSabado.size(); attSabado++) {
                    Atividade atividadeSabado = listaAtividadeSabado.get(attSabado);
                    int codAtividadeSabado = atividadeSabado.getCod_atividade();
                    String numeroQuestaoSabado = ques.consultarNumQuestaoAtividade(codAtividadeSabado);
                    String statusAtividade = atividadeSabado.getStatus_atividade();
                    if ("Em Andamento".equals(statusAtividade)) {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoFazerAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeSabado.getCod_atividade()%>&numeroQuestao=<%= numeroQuestaoSabado%>'">
                <% if (attSabado == 0) { %>
                <h3>Sab</h3>
                <% } %>
                <div class="atividade" <% if (attSabado > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeSabado.getTitulo_atividade()); %></h4><span><% out.write(atividadeSabado.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
            } else {
            %>

            <div class="diaSemana" onclick="window.location.href = 'alunoRevisarAtividade.jsp?pmensagem=Login%20feito%20com%20sucesso&aluno=<%= vUsuAluno%>&senha=<%= vSenhaAluno%>&codigo=<%= vCodAluno%>&atividadeId=<%= atividadeSabado.getCod_atividade()%>'">
                <% if (attSabado == 0) { %>
                <h3>Sex</h3>
                <% } %>
                <div class="atividade" <% if (attSabado > 0) { %>style="margin-left: 4.8rem;"<% } %>>
                    <h4><% out.write(atividadeSabado.getTitulo_atividade()); %></h4><span><% out.write(atividadeSabado.getStatus_atividade()); %></span>
                </div>
            </div>
            <br>

            <%
                        }
                    }
                }
            %>
        </main>
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
        <script src="js/index.js"></script>
    </body>
</html>