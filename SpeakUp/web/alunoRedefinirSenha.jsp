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
            String email_aluno = request.getParameter("email_aluno");
            String senha_aluno = request.getParameter("senha_aluno");
            String confirmar_senha = request.getParameter("confirmar_senha");

            Aluno alu = new Aluno();
            alu.setEmail_aluno(email_aluno);
            alu.setSenha_aluno(senha_aluno);
            
            
            if (alu.validaRedefinicaoSenha()) {    
                if (senha_aluno.equals(confirmar_senha)) {
                    alu.alterarSenhaAluno();
                    response.sendRedirect("alunoLogin.html?pmensagem=Senha Alterada com Sucesso");
                } else {
                    response.sendRedirect("alunoEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha");
                }
            } else {
                response.sendRedirect("alunoEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha: Aluno não encontrado");
            }
        %>

    </body>
</html>
