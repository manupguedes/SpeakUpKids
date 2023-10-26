<%@page import="java.sql.Date"%>
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
        //recebe os valores da tela anterior
        String nome_resp = request.getParameter("nome_resp");
        String email_resp   = request.getParameter("email_resp");
        String usu_resp   = request.getParameter("usu_resp");
        String senha_resp  = request.getParameter("senha_resp");
        Integer cod_aluno   = Integer.valueOf(request.getParameter("cod_aluno")); 
        
        Responsavel resp = new Responsavel();
        resp.setNome_resp(nome_resp);
        resp.setEmail_resp(email_resp);
        resp.setUsu_resp(usu_resp);
        resp.setSenha_resp(senha_resp);
        resp.setCod_aluno(cod_aluno);
		
        if (resp.cadastrarResponsavel()) {
           response.sendRedirect("index.html?pmensagem=Usuario salvo com sucesso");
        }
        else{
            response.sendRedirect("loginEscolhaCadastro.html?pmensagem=Problemas ao salvar Usuario");
        }
        %>  
    </body>
</html>
