<%@page import="java.text.DecimalFormat"%>
<%@page import="Classes.Atividade"%>
<%@page import="Classes.Professor"%>
<%@page import="Classes.Responsavel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SpeakUp</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="stylesAluno/media-query.css">

        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
    </head>
    <body id="professor">
        <%
            String vUsuResp = request.getParameter("responsavel");
            String vSenhaResp = request.getParameter("senha");
            int vCodResp = Integer.parseInt(request.getParameter("codigo"));
            int vCodAluno = Integer.parseInt(request.getParameter("codAluno"));
            Responsavel resp1 = new Responsavel();
            resp1.setUsu_resp(vUsuResp);
            resp1.setSenha_resp(vSenhaResp);
            resp1.setCod_resp(vCodResp);
            resp1 = resp1.consultarResponsavel();
            
            //-----------------------
  
            
        %>
        <nav class="navProfessor">
            <img src="images/responsavelLogo.png" alt="Logo SpeakUp" class="professorLogo">
            <ul class="navbar-list">

                <li>
                    <a href="responsavelAcompanharAluno.jsp?pmensagem=&responsavel=<%= vUsuResp %>&senha=<%= vSenhaResp %>&codigo=<%= vCodResp %>&codAluno=<%= vCodAluno%>" class="opcoes">
                        <i class="fa-solid fa-file-circle-check"></i>
                        Acompanhamento
                    </a>
                </li>
                <li class="user">
                    <a href="responsavelConta.jsp?pmensagem=&responsavel=<%= vUsuResp %>&senha=<%= vSenhaResp %>&codigo=<%= vCodResp %>&codAluno=<%= vCodAluno%>">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <main id="mainProfessor">
            <section class="containerProfessorAcompanhar">
                <div class="acompanhamento">
                    <%
                    Professor prof = new Professor();
                    Atividade ati = new Atividade();
                    String nomeAluno = prof.consultarNomeAluno(vCodAluno);
                    String numZero = "0";
                    String contadorAtividade = ati.contadorAtividade();
                    String contadorAtividadeCorrigida = ati.contadorAtividadeCorrigida();
                    
                    float numContadorAtividade = Integer.parseInt(contadorAtividade);
                    float numContadorAtividadeCorrigida = Integer.parseInt(contadorAtividadeCorrigida);
                    
                    float media = ((numContadorAtividadeCorrigida / numContadorAtividade) * 100);
                    
                    DecimalFormat df = new DecimalFormat("0");
                    
                    String numeroFormatado = df.format(media);
                    
                    %>
                    <h1>Visão Geral - <%= nomeAluno%></h1>
                    <div class="titles">
                        <h3>Exercícios e Trabalhos</h3>
                    </div>
                    <div class="exercicios">
                        <%
                        
                        if(contadorAtividade != null || contadorAtividade != numZero){
                        %>
                        
                        <h1><%= contadorAtividade%></h1><span>Atividades <br> Enviadas</span>
                        
                        <%} else {%>
                        
                        <h1><%= numZero%></h1><span>Atividades <br> Enviadas</span>
                        <%
                            }
                        %>
                        
                        <%
                        if(contadorAtividadeCorrigida != null || contadorAtividadeCorrigida != numZero){
                        %>
                        
                        <h1><%= contadorAtividadeCorrigida%></h1><span>Atividades <br> Corrigidas</span>
                        
                        <%} else {%>
                        
                        <h1><%= numZero%></h1><span>Atividades <br> Corrigidas</span>
                        <%
                            }
                        %>
                        <%
                        
                        if(Float.isNaN(media)){
                   
                        %>
                        <h1><%= numZero + "%"%></h1><span>Participação <br> Média</span>  
                        <% } else {%>
                        <h1><%= numeroFormatado + "%"%></h1><span>Participação <br> Média</span>      
                        <% 
                            }
                        %>
                    </div>
                </div>
            </section>
        </main>
        <script src="https://kit.fontawesome.com/87c9f9014b.js" crossorigin="anonymous"></script>
        <script src="js/main.js"></script>
    </body>
</html>