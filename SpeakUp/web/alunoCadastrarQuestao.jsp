<%@page import="Classes.Questao"%>
<%@page import="Classes.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String vUsuAluno = request.getParameter("aluno");
            String vSenhaAluno = request.getParameter("senha");
            int vCodAluno = Integer.parseInt(request.getParameter("codigo"));
            String vCodAtividade = request.getParameter("atividadeId");
            String numeroQuestao = request.getParameter("numeroQuestao");
            
            String cod_aluno = request.getParameter("cod_aluno");
            String cod_professor = request.getParameter("cod_professor");
            String cod_atividade = request.getParameter("cod_atividade");
            String cod_questao = request.getParameter("cod_questao");
            String resposta_cadastrada = request.getParameter("resposta_cadastrada");
            
            int codAluno = Integer.parseInt(cod_aluno);
            int codProfessor = Integer.parseInt(cod_professor);
            int codAtividade = Integer.parseInt(cod_atividade);
            int codQuestao = Integer.parseInt(cod_questao);
            
            Questao ques = new Questao();
            ques.setCod_aluno(codAluno);
            ques.setCod_professor(codProfessor);
            ques.setCod_questao(codQuestao);
            ques.setResposta_cadastrada(resposta_cadastrada);   
            ques.setCod_atividade(codAtividade);
            ques.setCod_questao(codQuestao);
            
            
             if (ques.cadastrarQuestaoAluno() && ques.alterarQuestaoAluno()) {
                response.sendRedirect("alunoFazerAtividade.jsp?pmensagem=Questão salva com sucesso&aluno=" + vUsuAluno + "&senha=" + vSenhaAluno + "&codigo=" + vCodAluno + "&atividadeId=" + vCodAtividade + "&numeroQuestao=" + numeroQuestao);
            } else {
                response.sendRedirect("alunoFazerAtividade.jsp?pmensagem=Problemas ao salvar Questão&aluno=" + vUsuAluno + "&senha=" + vSenhaAluno + "&codigo=" + vCodAluno + "&atividadeId=" + vCodAtividade + "&numeroQuestao=" + numeroQuestao);
            }
            
        %>
    </body>
</html>
