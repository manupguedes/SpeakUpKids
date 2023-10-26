<%-- 
    Document   : alunoRecebeDados
    Created on : 18 de ago. de 2023, 11:41:53
    Author     : joao_ponchiroli
--%>
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
        //recebe os valores da tela anterior
        String nome_admin = request.getParameter("nome_admin");
        String email_admin   = request.getParameter("email_admin");
        String usu_admin   = request.getParameter("usu_admin");
        String senha_admin  = request.getParameter("senha_admin");
        
        Administrador admin = new Administrador();
        admin.setNome_admin(nome_admin);
        admin.setEmail_admin(email_admin);
        admin.setUsu_admin(usu_admin);
        admin.setSenha_admin(senha_admin);
		
        if (admin.cadastrarAdministrador()) {
           response.sendRedirect("index.html?pmensagem=Administrador salvo com sucesso");
        }
        else
        {
            response.sendRedirect("loginEscolhaFuncionario.html?pmensagem=Problemas ao salvar Administrador");
        }
        %>  
    </body>
</html>
