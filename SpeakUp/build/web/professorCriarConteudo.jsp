<%@page import="Classes.Professor"%>
<%@page import="Classes.Conteudo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String vUsuProfessor = request.getParameter("professor");
            String vSenhaProfessor = request.getParameter("senha");
            int vCodProfessor = Integer.parseInt(request.getParameter("codigo"));
            int vCodAluno = Integer.parseInt(request.getParameter("codAluno"));

            //recebe os valores da tela anterior
            String cod_aluno = request.getParameter("cod_aluno");
            String nome_cont = request.getParameter("nome_cont");
            String desc_cont = request.getParameter("desc_cont");

            int codAluno = Integer.parseInt(cod_aluno.trim());

            Conteudo cont = new Conteudo();
            cont.setCod_aluno(codAluno);
            cont.setNome_cont(nome_cont);
            cont.setDesc_cont(desc_cont);

            if (cont.cadastrarConteudo()) {
                response.sendRedirect("professorConteudo.jsp?pmensagem=Teste&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + vCodAluno);
            } else {
                response.sendRedirect("professorAdicionarConteudo.jsp?pmensagem=Problemas ao Salvar Conteudo&professor=" + vUsuProfessor + "&senha=" + vSenhaProfessor + "&codigo=" + vCodProfessor + "&codAluno=" + vCodAluno);
            }
        %>
    </body>
</html>
