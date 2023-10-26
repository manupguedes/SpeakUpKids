<%@page import="Classes.Aluno"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usu_aluno = request.getParameter("usu_aluno");
            String senha_aluno = request.getParameter("senha_aluno");

            if (usu_aluno != null && senha_aluno != null) {
                Aluno alu = new Aluno();
                alu.setUsu_aluno(usu_aluno);
                alu.setSenha_aluno(senha_aluno);

                Aluno alunoBancoDados = alu.loginAluno();

                if (alunoBancoDados != null) {
                    boolean usuarioValido = alunoBancoDados.getUsu_aluno().equals(alu.getUsu_aluno());
                    boolean senhaValida = alunoBancoDados.getSenha_aluno().equals(alu.getSenha_aluno());
                    int codAluno = Aluno.autenticarAluno(usu_aluno, senha_aluno);

                    if (usuarioValido && senhaValida) {
                        response.sendRedirect("alunoMinhaSemana.jsp?pmensagem=Login feito com sucesso&aluno=" + usu_aluno + "&senha=" + senha_aluno + "&codigo=" + codAluno);
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
