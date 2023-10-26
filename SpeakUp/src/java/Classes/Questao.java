package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.Conexao;
import java.util.ArrayList;
import java.util.List;

public class Questao {

    int cod_questao;
    int cod_atividade;
    String titulo_atividade;
    String numero_questao;
    String enunciado_questao;
    String alternativaA;
    String alternativaB;
    String alternativaC;
    String alternativaD;
    String alternativa_correta;
    String resposta_esperada;

    //---------QuestaoAluno----------------
    int cod_aluno;
    int cod_professor;
    String resposta_cadastrada;
    String comentario_professor;

    public String getNumero_questao() {
        return numero_questao;
    }

    public void setNumero_questao(String numero_questao) {
        this.numero_questao = numero_questao;
    }

    public String getComentario_professor() {
        return comentario_professor;
    }

    public void setComentario_professor(String comentario_professor) {
        this.comentario_professor = comentario_professor;
    }

    public int getCod_professor() {
        return cod_professor;
    }

    public void setCod_professor(int cod_professor) {
        this.cod_professor = cod_professor;
    }

    public String getResposta_cadastrada() {
        return resposta_cadastrada;
    }

    public void setResposta_cadastrada(String resposta_cadastrada) {
        this.resposta_cadastrada = resposta_cadastrada;
    }

    public int getCod_aluno() {
        return cod_aluno;
    }

    public void setCod_aluno(int cod_aluno) {
        this.cod_aluno = cod_aluno;
    }

    public String getTitulo_atividade() {
        return titulo_atividade;
    }

    public void setTitulo_atividade(String titulo_atividade) {
        this.titulo_atividade = titulo_atividade;
    }

    public int getCod_questao() {
        return cod_questao;
    }

    public void setCod_questao(int cod_questao) {
        this.cod_questao = cod_questao;
    }

    public int getCod_atividade() {
        return cod_atividade;
    }

    public void setCod_atividade(int cod_atividade) {
        this.cod_atividade = cod_atividade;
    }

    public String getEnunciado_questao() {
        return enunciado_questao;
    }

    public void setEnunciado_questao(String enunciado_questao) {
        this.enunciado_questao = enunciado_questao;
    }

    public String getAlternativaA() {
        return alternativaA;
    }

    public void setAlternativaA(String alternativaA) {
        this.alternativaA = alternativaA;
    }

    public String getAlternativaB() {
        return alternativaB;
    }

    public void setAlternativaB(String alternativaB) {
        this.alternativaB = alternativaB;
    }

    public String getAlternativaC() {
        return alternativaC;
    }

    public void setAlternativaC(String alternativaC) {
        this.alternativaC = alternativaC;
    }

    public String getAlternativaD() {
        return alternativaD;
    }

    public void setAlternativaD(String alternativaD) {
        this.alternativaD = alternativaD;
    }

    public String getAlternativa_correta() {
        return alternativa_correta;
    }

    public void setAlternativa_correta(String alternativa_correta) {
        this.alternativa_correta = alternativa_correta;
    }

    public String getResposta_esperada() {
        return resposta_esperada;
    }

    public void setResposta_esperada(String resposta_esperada) {
        this.resposta_esperada = resposta_esperada;
    }

    public boolean cadastrarQuestao() {
        Connection con = Conexao.conectar();
        String sql = "insert into Questao ";
        sql += "(cod_atividade, numero_questao, enunciado_questao, alternativaA, alternativaB, alternativaC, alternativaD, alternativa_correta, resposta_esperada  ) ";
        sql += "values (?,?,?,?,?,?,?,?,? )";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_atividade));
            stm.setString(2, this.numero_questao);
            stm.setString(3, (this.enunciado_questao));
            stm.setString(4, (this.alternativaA));
            stm.setString(5, (this.alternativaB));
            stm.setString(6, (this.alternativaC));
            stm.setString(7, (this.alternativaD));
            stm.setString(8, (this.alternativa_correta));
            stm.setString(9, (this.resposta_esperada));
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarQuestao() {
        Connection con = Conexao.conectar();
        String sql = "update questaoaluno ";
        sql += "set comentario_professor = ? ";
        sql += "where cod_atividade = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, (this.comentario_professor));
            stm.setInt(2, (this.cod_atividade));
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirQuestao() {
        Connection con = Conexao.conectar();
        String sql = "delete from Questao       ";
        sql += "where cod_questao = ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_questao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Questao consultarQuestao() {
        Connection con = Conexao.conectar();
        String sql = "select cod_questao, desc_atividade, tipo_questao, enun_questao, descritiva, objetiva ";
        sql += "from Questao ";
        sql += "where cod_questao = ?  ";
        Questao ques = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_questao));
            stm.setInt(2, (this.cod_atividade));
            stm.setString(3, (this.enunciado_questao));
            stm.setString(4, (this.alternativaA));
            stm.setString(5, (this.alternativaB));
            stm.setString(6, (this.alternativaC));
            stm.setString(7, (this.alternativaD));
            stm.setString(8, (this.alternativa_correta));
            stm.setString(9, (this.resposta_esperada));
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ques = new Questao();
                ques.setCod_questao(rs.getInt("cod_questao"));
                ques.setCod_atividade(rs.getInt("cod_atividade"));
                ques.setEnunciado_questao(rs.getString("enunciado_questao"));
                ques.setAlternativaA(rs.getString("alternativaA"));
                ques.setAlternativaB(rs.getNString("alternativaB"));
                ques.setAlternativaC(rs.getString("alternativaC"));
                ques.setAlternativaD(rs.getString("alternativaD"));
                ques.setAlternativa_correta(rs.getString("alternativa_correta"));
                ques.setResposta_esperada(rs.getString("resposta_esperada"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Questao: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return ques;
    }

    public Questao consultarQuestoes(String numQuestao, int vCodAtividade) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_questao, numero_questao, enunciado_questao, alternativaA, alternativaB, alternativaC, alternativaD, alternativa_correta ";
        sql += "FROM questao ";
        sql += "WHERE numero_questao LIKE ? AND ";
        sql += "cod_atividade = ? ";
        Questao ques = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + numQuestao + "%");
            stm.setInt(2, vCodAtividade);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ques = new Questao();
                ques.setCod_questao(rs.getInt("cod_questao"));
                ques.setNumero_questao(rs.getString("numero_questao"));
                ques.setEnunciado_questao(rs.getString("enunciado_questao"));
                ques.setAlternativaA(rs.getString("alternativaA"));
                ques.setAlternativaB(rs.getNString("alternativaB"));
                ques.setAlternativaC(rs.getString("alternativaC"));
                ques.setAlternativaD(rs.getString("alternativaD"));
                ques.setAlternativa_correta(rs.getString("alternativa_correta"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + "\nComando SQL : " + sql);
        }

        return ques;
    }

    public List<Questao> consultarNumeroQuestao(int atividadeId) {
        Connection con = Conexao.conectar();
        List<Questao> listaNumeroQuestoes = new ArrayList<>();
        String sql = "SELECT numero_questao ";
        sql += "FROM questao ";
        sql += "WHERE cod_atividade = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, atividadeId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Questao questao = new Questao();
                questao.setNumero_questao(rs.getString("numero_questao"));
                listaNumeroQuestoes.add(questao);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + "\nComando SQL : " + sql);
        }

        return listaNumeroQuestoes;
    }

    public String consultarNumQuestaoAtividade(int atividadeId) {
        Connection con = Conexao.conectar();
        String sql = "SELECT numero_questao ";
        sql += "FROM questao ";
        sql += "WHERE cod_atividade = ? ";
        sql += "ORDER BY numero_questao ASC ";
        sql += "LIMIT 1 ";
        String numQuestao = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, atividadeId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                numQuestao = rs.getString("numero_questao");
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + "\nComando SQL : " + sql);
        }

        return numQuestao;
    }

    //---------QuestaoAluno----------------
    public boolean cadastrarQuestaoAluno() {
        Connection con = Conexao.conectar();
        String sql  =  "INSERT INTO QuestaoAluno " ;
               sql +=  "(cod_atividade, cod_questao) ";
               sql +=  "VALUES (?,?) ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_atividade));
            stm.setInt(2, this.cod_questao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarQuestaoAluno() {
        Connection con = Conexao.conectar();
        String sql = "UPDATE QuestaoAluno ";
        sql += "SET ";
        sql += "  cod_aluno = ?, ";
        sql += "  cod_professor = ?, ";
        sql += "  cod_questao = ?, ";
        sql += "  resposta_cadastrada = ? ";
        sql += "  WHERE cod_atividade = ? AND ";
        sql += "  cod_questao = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_aluno));
            stm.setInt(2, (this.cod_professor));
            stm.setInt(3, (this.cod_questao));
            stm.setString(4, (this.resposta_cadastrada));
            stm.setInt(5, (this.cod_atividade));
            stm.setInt(6, (this.cod_questao));
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public List<Questao> consultarQuestoesPorAtividade(int atividadeId) {
        Connection con = Conexao.conectar();
        List<Questao> listaQuestoes = new ArrayList<>();
        String  sql  = "SELECT q.numero_questao, q.enunciado_questao, q.alternativa_correta, q.resposta_esperada, qa.resposta_cadastrada ";
                sql += "FROM questao q ";
                sql += "INNER JOIN questaoaluno qa ON q.cod_atividade = qa.cod_atividade ";
                sql += "AND q.cod_questao = qa.cod_questao ";
                sql += "WHERE q.cod_atividade = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, atividadeId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Questao questao = new Questao();
                questao.setNumero_questao(rs.getString("numero_questao"));
                questao.setEnunciado_questao(rs.getString("enunciado_questao"));
                questao.setAlternativa_correta(rs.getString("alternativa_correta"));
                questao.setResposta_esperada(rs.getString("resposta_esperada"));
                questao.setResposta_cadastrada(rs.getString("resposta_cadastrada"));
                listaQuestoes.add(questao);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + "\nComando SQL : " + sql);
        }

        return listaQuestoes;
    }

    public String ConsultarComentarioProfessor() {
        Connection con = Conexao.conectar();
        String sql = "select comentario_professor ";
        sql += "from QuestaoAluno ";
        sql += "where cod_atividade = ?  ";
        String comentarioProfessor = null;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_atividade);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                comentarioProfessor = rs.getString("comentario_professor");
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Título da Atividade: " + ex.getMessage() + "\n Comando SQL: " + sql);
        }
        return comentarioProfessor;
    }

    public Questao consultarResposataCadastrada(int codAtividade,String numQuestao) {
        Connection con = Conexao.conectar();
        String sql = "SELECT tq.numero_questao, tqa.resposta_cadastrada ";
        sql += "FROM questao tq ";
        sql += "LEFT JOIN questaoAluno tqa ON tq.cod_questao = tqa.cod_questao ";
        sql += "WHERE tq.cod_atividade = ? AND tq.numero_questao LIKE ? ";
        Questao ques = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, codAtividade);
            stm.setString(2, "%" + numQuestao + "%");
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ques = new Questao();
                ques.setNumero_questao(rs.getString("numero_questao"));
                ques.setResposta_cadastrada(rs.getString("resposta_cadastrada"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + "\nComando SQL : " + sql);
        }

        return ques;
    }
}
