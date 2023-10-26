<%-- 
    Document   : alunoRecebeDados
    Created on : 18 de ago. de 2023, 11:41:53
    Author     : joao_ponchiroli
--%>
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
        //recebe os valores da tela anterior
        String nome_professor = request.getParameter("nome_professor");
        String email_professor   = request.getParameter("email_professor");
        String usu_professor   = request.getParameter("usu_professor");
        String senha_professor  = request.getParameter("senha_professor");
        
        Professor prof = new Professor();
        prof.setNome_professor(nome_professor);
        prof.setEmail_professor(email_professor);
        prof.setUsu_professor(usu_professor);
        prof.setSenha_professor(senha_professor);
		
        if (prof.cadastrarProfessor()) {
           response.sendRedirect("index.html?pmensagem=Professor salvo com sucesso");
        }
        else
        {
            response.sendRedirect("loginEscolhaFuncionario.html?pmensagem=Problemas ao salvar Professor");
        }
        %>  
        // bloco de uso de parâmetros
        <input type="hidden" name ="nome_professor" value ="<%out.write(nome_professor);%>">
        
    </body>
</html>
