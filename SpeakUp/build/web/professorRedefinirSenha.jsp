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
            String email_professor = request.getParameter("email_professor");
            String senha_professor = request.getParameter("senha_professor");
            String confirmar_senha = request.getParameter("confirmar_senha");

            Professor prof = new Professor();
            prof.setEmail_professor(email_professor);
            prof.setSenha_professor(senha_professor);
            
            
            if (prof.validaRedefinicaoSenha()) {    
                if (senha_professor.equals(confirmar_senha)) {
                    prof.alterarSenhaProfessor();
                    response.sendRedirect("professorLogin.html?pmensagem=Senha Alterada com Sucesso");
                } else {
                    response.sendRedirect("professorEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha");
                }
            } else {
                response.sendRedirect("professorEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha: Aluno não encontrado");
            }
        %>

    </body>
</html>
