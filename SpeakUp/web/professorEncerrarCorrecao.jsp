<%@page import="Classes.Atividade"%>
<%@page import="Classes.Questao"%>
<page import="Classes.Questao"%>
<%@page import="Classes.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            
            String vUsuProfessor = request.getParameter("professor");
            String vSenhaProfessor = request.getParameter("senha");
            int vCodProfessor = Integer.parseInt(request.getParameter("codigo"));
            int vCodAluno = Integer.parseInt(request.getParameter("codAluno"));
            int atividadeId = Integer.parseInt(request.getParameter("atividadeId"));
            
            //----------------------------------------------------------
            
            String status_atividade = request.getParameter("status_atividade");
            String comentario_professor = request.getParameter("comentario_professor");
            String cod_atividade = request.getParameter("cod_atividade");
            
            int codAtividade = Integer.parseInt(cod_atividade);
            
            Atividade ati = new Atividade();
            ati.setStatus_atividade(status_atividade);
            ati.setCod_atividade(codAtividade);
            
            Questao ques = new Questao();
            ques.setComentario_professor(comentario_professor);
            ques.setCod_atividade(codAtividade);
            
            
            if(ati.alterarStatusAtividade() && ques.alterarQuestao()){
                response.sendRedirect("professorAtividades.jsp?pmensagem=Login%20feito%20com%20sucesso&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + vCodAluno + "&atividadeId=" + atividadeId);
            } else{
                response.sendRedirect("professorRevisarQuestao.jsp?pmensagem=Problema-ao-Corrigir-Questao&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + vCodAluno + "&atividadeId=" + atividadeId);
            }
        %>
    </body>
</html>
