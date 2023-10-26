<%-- 
    Document   : alunoRecebeDados
    Created on : 18 de ago. de 2023, 11:41:53
    Author     : joao_ponchiroli
--%>
<%@page import="java.sql.Date"%>
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
        //recebe os valores da tela anterior
        String nome_aluno    = request.getParameter("nome_aluno");
        String email_aluno   = request.getParameter("email_aluno");
        Date dataNscAluno   = Date.valueOf(request.getParameter("dataNscAluno"));
        String usu_aluno   = request.getParameter("usu_aluno");
        String senha_aluno  = request.getParameter("senha_aluno");
        
        Aluno alu = new Aluno();
        alu.setNome_aluno(nome_aluno);
        alu.setEmail_aluno(email_aluno);
        alu.setDataNscAluno(dataNscAluno);
        alu.setUsu_aluno(usu_aluno);
        alu.setSenha_aluno(senha_aluno);
		
        if (alu.cadastrarAluno()) {
           response.sendRedirect("index.html?pmensagem=Usuario salvo com sucesso");
        }
        else
        {
            response.sendRedirect("loginEscolhaCadastro.html?pmensagem=Problemas ao salvar Usuario");
        }
        %>  
    </body>
</html>
