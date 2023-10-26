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
            String usu_admin = request.getParameter("usu_admin");
            String senha_admin = request.getParameter("senha_admin");

            if (usu_admin != null && senha_admin != null) {
                Administrador admin = new Administrador();
                admin.setUsu_admin(usu_admin);
                admin.setSenha_admin(senha_admin);

                Administrador adminBancoDados = admin.loginAdmin();

                if (adminBancoDados != null) {
                    boolean usuarioValido = adminBancoDados.getUsu_admin().equals(admin.getUsu_admin());
                    boolean senhaValida = adminBancoDados.getSenha_admin().equals(admin.getSenha_admin());
                    int codAdmin = Administrador.autenticarAdministrador(usu_admin, senha_admin);

                    if (usuarioValido && senhaValida) {
                        response.sendRedirect("adminTurmas.jsp?pmensagem=Login feito com sucesso&admin=" + usu_admin + "&senha=" + senha_admin + "&codigo=" + codAdmin);
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
