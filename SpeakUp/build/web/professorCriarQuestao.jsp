<%@page import="Classes.Professor"%>
<%@page import="Classes.Questao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String vUsuProfessor = request.getParameter("professor");
            String vSenhaProfessor = request.getParameter("senha");
            int vCodProfessor = Integer.parseInt(request.getParameter("codigo"));
            String vCodAluno = request.getParameter("codAluno");
            String vCodAtividade = request.getParameter("codAtividade");

            //----------------------------------------------------------
            String cod_atividade = request.getParameter("cod_atividade");
            String numero_questao = request.getParameter("numero_questao");
            String enunciado_questao = request.getParameter("enunciado_questao");
            String alternativaA = request.getParameter("alternativaA");
            String alternativaB = request.getParameter("alternativaB");
            String alternativaC = request.getParameter("alternativaC");
            String alternativaD = request.getParameter("alternativaD");
            String alternativa_correta = request.getParameter("alternativa_correta");
            String resposta_esperada = request.getParameter("resposta_esperada");

            int codAtividade = Integer.parseInt(cod_atividade);

            Questao ques = new Questao();
            ques.setCod_atividade(codAtividade);
            ques.setNumero_questao(numero_questao);
            ques.setEnunciado_questao(enunciado_questao);
            ques.setAlternativaA(alternativaA);
            ques.setAlternativaB(alternativaB);
            ques.setAlternativaC(alternativaC);
            ques.setAlternativaD(alternativaD);
            ques.setAlternativa_correta(alternativa_correta);
            ques.setResposta_esperada(resposta_esperada);

            boolean cadastroQuestao = ques.cadastrarQuestao();

            if (cadastroQuestao) {
                
                boolean cadastroQuestaoAluno = ques.cadastrarQuestaoAluno();

                if (cadastroQuestaoAluno) {
                    response.sendRedirect("professorAdicionarQuestao.jsp?pmensagem=Questão salva com sucesso&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + vCodAluno + "&codAtividade=" + codAtividade);
                } else {
                    response.sendRedirect("professorAdicionarQuestao.jsp?pmensagem=Problemas ao salvar Questão do Aluno&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + vCodAluno + "&codAtividade=" + codAtividade);
                }
            } else {
                response.sendRedirect("professorAdicionarQuestao.jsp?pmensagem=Problemas ao salvar Questão&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + vCodAluno + "&codAtividade=" + codAtividade);
            }
        %>
    </body>
</html>
