<%@page import="Classes.Administrador"%>
<%@page import="Classes.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SpeakUp</title>

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="styles/style.css" />
        <link rel="stylesheet" href="stylesAluno/media-query.css" />

        <link
            rel="shortcut icon"
            href="images/favicon-32x32.png"
            type="image/x-icon"
            />
    </head>
    <body id="professor">
        <%
            String vUsuAdmin = request.getParameter("admin");
            String vSenhaAdmin = request.getParameter("senha");
            int vCodAdmin = Integer.parseInt(request.getParameter("codigo"));
            Administrador admin1 = new Administrador();
            admin1.setUsu_admin(vUsuAdmin);
            admin1.setSenha_admin(vSenhaAdmin);
            admin1.setCod_admin(vCodAdmin);
            admin1 = admin1.consultarAdministrador();
        %>
        <nav class="navProfessor">
            <img
                src="images/professorLogo.png"
                alt="Logo SpeakUp"
                class="professorLogo"
                />
            <ul class="navbar-list">
                <li>
                    <a href="adminTurmas.jsp?pmensagem=&admin=<%= vUsuAdmin%>&senha=<%= vSenhaAdmin%>&codigo=<%= vCodAdmin%>" class="opcoes">
                        <i class="fa-solid fa-user-group"></i>
                        Turmas
                    </a>
                </li>
                <li class="user">
                    <a href="adminConta.jsp?pmensagem=&admin=<%= vUsuAdmin%>&senha=<%= vSenhaAdmin%>&codigo=<%= vCodAdmin%>">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <main id="mainProfessor">
            <h3 class="titulo">Adicionar Turma</h3>
            <form method="post" action="adminCriarTurma.jsp?pmensagem=Login feito com sucesso&admin=<%out.write(vUsuAdmin);%>&senha=<%out.write(vSenhaAdmin);%>&codigo=<%out.write(""+vCodAdmin);%>">
                <div class="AdminContainerCenter">
                    <div class="containerAdminAdicionarTurma">
                        <form> 
                            <div class="conteudoAdminAdicionarTurma">
                                <div class="descConteudoAdminAdicionarTurma">
                                    <h2>Professores</h2>
                                    <h4>Selecione um Professor</h4>
                                    <table> 
                                        <thead>
                                        <th>Número Professor</th>
                                        <th>Nome Professor</th>
                                        <th>Email Professor</th>
                                        </thead>

                                        <% Professor prof = new Professor();
                                            List<Professor> listaProfessor = new ArrayList<>();
                                            listaProfessor = prof.consultarProfessores();
                                            for (Professor professor : listaProfessor) {
                                        %>


                                        <tbody> 
                                            <tr>
                                                <td><input type="radio" name="opcaoProfessor" value= <%out.write(Integer.toString(professor.getCod_professor()));%> > <%out.write(Integer.toString(professor.getCod_professor()));%> </td>
                                                <td><%out.write(professor.getNome_professor()); %></td>
                                                <td><%out.write(professor.getEmail_professor()); %></td>
                                            </tr>
                                        </tbody>


                                        <%
                                            }
                                        %>  
                                    </table>                                    
                                </div>
                            </div>   
                            <div class="conteudoAdminAdicionarTurma">
                                <div class="descConteudoAdminAdicionarTurma">
                                    <h2>Alunos</h2>
                                    <h4>Selecione um Aluno</h4>
                                    <table> 
                                        <thead>
                                        <th>Número Aluno</th>
                                        <th>Nome Aluno</th>
                                        <th>Email Aluno</th>
                                        </thead>

                                        <% Aluno alu = new Aluno();
                                            List<Aluno> listaAluno = new ArrayList<>();
                                            listaAluno = alu.consultarAlunos();
                                            for (Aluno aluno : listaAluno) {
                                        %>


                                        <tbody> 
                                            <tr>
                                                <td><input type="radio" name="opcaoAluno" value= <%out.write(Integer.toString(aluno.getCod_aluno()));%> > <%out.write(Integer.toString(aluno.getCod_aluno()));%> </td>
                                                <td><%out.write(aluno.getNome_aluno()); %></td>
                                                <td><%out.write(aluno.getEmail_aluno()); %></td> 
                                            </tr>
                                        </tbody>


                                        <%
                                            }
                                        %>  
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="containerBotao">
                        <button type="submit" class="botaoAdicionarTurma">Criar Turma</button>
                    </div>
                </div>
            </form>
        </main>
        <script
            src="https://kit.fontawesome.com/87c9f9014b.js"
            crossorigin="anonymous"
        ></script>
        <script src="js/main.js"></script>
    </body>
</html>
