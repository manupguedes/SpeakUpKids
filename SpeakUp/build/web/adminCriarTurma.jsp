<%@page import="Classes.Administrador"%>
<%@page import="Classes.Turma"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String vUsuAdmin = request.getParameter("admin");
            String vSenhaAdmin = request.getParameter("senha");
            int vCodAdmin = Integer.parseInt(request.getParameter("codigo"));
            
            Administrador admin1 = new Administrador();
            admin1.setUsu_admin(vUsuAdmin);
            admin1.setSenha_admin(vSenhaAdmin);
            admin1.setCod_admin(vCodAdmin);
            admin1 = admin1.consultarAdministrador();
            
            
            String cod_professor = request.getParameter("opcaoProfessor");
            String cod_aluno = request.getParameter("opcaoAluno");

            int codProfessor = Integer.parseInt(cod_professor);
            int codAluno = Integer.parseInt(cod_aluno);

            Turma tur = new Turma();
            tur.setCod_professor(codProfessor);
            tur.setCod_aluno(codAluno);

            if (tur.cadastrarTurma()) {
                response.sendRedirect("adminTurmas.jsp?pmensagem=Conteudo salvo com sucesso&admin=" + vUsuAdmin + "&senha=" + vSenhaAdmin + "&codigo=" + vCodAdmin);
            } else {
                response.sendRedirect("adminAdicionarTurma.jsp?pmensagem=Problemas ao salvar Conteudo");
            }
        %>
    </body>
</html>
