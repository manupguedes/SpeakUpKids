<%@page import="Classes.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usu_professor = request.getParameter("usu_professor");
            String senha_professor = request.getParameter("senha_professor");
            if (usu_professor != null && senha_professor != null) {
                Professor prof = new Professor();
                prof.setUsu_professor(usu_professor);
                prof.setSenha_professor(senha_professor);

                Professor professorBandoDados = prof.loginProfessor();

                if (professorBandoDados != null) {
                    boolean usuarioValido = professorBandoDados.getUsu_professor().equals(prof.getUsu_professor());
                    boolean senhaValida = professorBandoDados.getSenha_professor().equals(prof.getSenha_professor());
                    int codProfessor = Professor.autenticarProfessor(usu_professor, senha_professor);


                    if (usuarioValido && senhaValida) {
                        response.sendRedirect("professorAlunos.jsp?pmensagem=Login feito com sucesso&professor=" + usu_professor + "&senha=" + senha_professor + "&codigo=" + codProfessor);
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
