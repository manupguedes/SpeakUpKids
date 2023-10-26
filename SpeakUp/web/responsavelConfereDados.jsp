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
            String usu_resp = request.getParameter("usu_resp");
            String senha_resp = request.getParameter("senha_resp");

            if (usu_resp != null && senha_resp != null) {
                Responsavel resp = new Responsavel();
                resp.setUsu_resp(usu_resp);
                resp.setSenha_resp(senha_resp);

                Responsavel adminBandoDados = resp.loginResp();

                if (adminBandoDados != null) {
                    boolean usuarioValido = adminBandoDados.getUsu_resp().equals(resp.getUsu_resp());
                    boolean senhaValida = adminBandoDados.getSenha_resp().equals(resp.getSenha_resp());
                    int codResp = Responsavel.autenticarResponsavel(usu_resp, senha_resp);
                    int codAluno = Responsavel.consultarCodAluno(usu_resp, senha_resp);

                    if (usuarioValido && senhaValida) {                  
                        response.sendRedirect("responsavelAcompanharAluno.jsp?pmensagem=Login feito com sucesso&responsavel=" + usu_resp + "&senha=" + senha_resp + "&codigo=" + codResp + "&codAluno=" + codAluno);
                    } else {
                        response.sendRedirect("index.html?pmensagem=Credenciais inválidas");
                    }
                } else {
                    response.sendRedirect("index.html?pmensagem=Aluno não encontrado");
                }
            } else {
                response.sendRedirect("index.html?pmensagem=Parâmetros ausentes");
            }
        %> 
    </body>
</html>
