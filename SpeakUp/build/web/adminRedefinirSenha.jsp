<%@page import="Classes.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email_admin = request.getParameter("email_admin");
            String senha_admin = request.getParameter("senha_admin");
            String confirmar_senha = request.getParameter("confirmar_senha");

            Administrador admin = new Administrador();
            admin.setEmail_admin(email_admin);
            admin.setSenha_admin(senha_admin);
            
            
            if (admin.validaRedefinicaoSenha()) {    
                if (senha_admin.equals(confirmar_senha)) {
                    admin.alterarSenhaAdmin();
                    response.sendRedirect("adminLogin.html?pmensagem=Senha Alterada com Sucesso");
                } else {
                    response.sendRedirect("adminEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha");
                }
            } else {
                response.sendRedirect("adminEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha: Aluno não encontrado");
            }
        %>
    </body>
</html>
