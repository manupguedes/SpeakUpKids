<%@page import="Classes.Responsavel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email_resp = request.getParameter("email_resp");
            String senha_resp = request.getParameter("senha_resp");
            String confirmar_senha = request.getParameter("confirmar_senha");

            Responsavel resp = new Responsavel();
            resp.setEmail_resp(email_resp);
            resp.setSenha_resp(senha_resp);
            
            
            if (resp.validaRedefinicaoSenha()) {    
                if (senha_resp.equals(confirmar_senha)) {
                    resp.alterarSenhaResponsavel();
                    response.sendRedirect("responsavelLogin.html?pmensagem=Senha Alterada com Sucesso");
                } else {
                    response.sendRedirect("responsavelEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha");
                }
            } else {
                response.sendRedirect("responsavelEsqueceuSenha.jsp?pmensagem=Erro ao Alterar Senha: Aluno não encontrado");
            }
        %>
    </body>
</html>
