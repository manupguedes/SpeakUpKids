<%@page import="Classes.Professor"%>
<%@page import="java.sql.Date"%>
<%@page import="Classes.Atividade"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SpeakUp</title>
    </head>
    <body>
        <%  
            String vUsuProfessor = request.getParameter("professor");
            String vSenhaProfessor = request.getParameter("senha");
            int vCodProfessor = Integer.parseInt(request.getParameter("codigo"));
            int vCodAluno = Integer.parseInt(request.getParameter("codAluno"));

            //----------------------------------------------------------
            String cod_aluno = request.getParameter("cod_aluno");
            String cod_professor = request.getParameter("cod_professor");
            String titulo_atividade = request.getParameter("titulo_atividade");
            Date data_inicio = Date.valueOf(request.getParameter("data_inicio"));
            Date data_encerramento = Date.valueOf(request.getParameter("data_encerramento"));
            String status_atividade = request.getParameter("status_atividade");

            int codAluno = Integer.parseInt(cod_aluno.trim());
            int codProfessor = Integer.parseInt(cod_professor.trim());
            
            Atividade ati = new Atividade();
            ati.setCod_aluno(codAluno);
            ati.setCod_professor(codProfessor);
            ati.setTitulo_atividade(titulo_atividade);
            ati.setData_inicio(data_inicio);
            ati.setData_encerramento(data_encerramento);
            ati.setStatus_atividade(status_atividade);

            if (ati.cadastrarAtividade()) {
               int codAtividade = ati.consultarCodAtividade(titulo_atividade);
                response.sendRedirect("professorAdicionarQuestao.jsp?pmensagem=Atividade Criada com Sucesso&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + codAluno + "&codAtividade=" + codAtividade);
            } else {
                response.sendRedirect("professorAtividades.jsp?pmensagem=Problemas ao salvar Atividade&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + codAluno);
            }
        %>
    </body>
</html>
