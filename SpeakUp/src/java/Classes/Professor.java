package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Util.Conexao;
import java.util.ArrayList;
import java.util.List;

public class Professor {

    int cod_professor;
    String nome_professor;
    String email_professor;
    String usu_professor;
    String senha_professor;
    int cod_aluno;
    String nome_aluno;

    public int getCod_aluno() {
        return cod_aluno;
    }

    public void setCod_aluno(int cod_aluno) {
        this.cod_aluno = cod_aluno;
    }

    public String getNome_aluno() {
        return nome_aluno;
    }

    public void setNome_aluno(String nome_aluno) {
        this.nome_aluno = nome_aluno;
    }

    public int getCod_professor() {
        return cod_professor;
    }

    public void setCod_professor(int cod_professor) {
        this.cod_professor = cod_professor;
    }

    public String getNome_professor() {
        return nome_professor;
    }

    public void setNome_professor(String nome_professor) {
        this.nome_professor = nome_professor;
    }

    public String getEmail_professor() {
        return email_professor;
    }

    public void setEmail_professor(String email_professor) {
        this.email_professor = email_professor;
    }

    public String getUsu_professor() {
        return usu_professor;
    }

    public void setUsu_professor(String usu_professor) {
        this.usu_professor = usu_professor;
    }

    public String getSenha_professor() {
        return senha_professor;
    }

    public void setSenha_professor(String senha_professor) {
        this.senha_professor = senha_professor;
    }

    public boolean cadastrarProfessor() {
        Connection con = Conexao.conectar();
        String sql = "insert into Professor ";
        sql += "(nome_professor, email_professor, usu_professor, senha_professor  ) ";
        sql += "values (?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome_professor);
            stm.setString(2, this.email_professor);
            stm.setString(3, this.usu_professor);
            stm.setString(4, this.senha_professor);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarProfessor() {
        Connection con = Conexao.conectar();
        String sql = "update Professor ";
        sql += "set cod_professor =        ?, ";
        sql += "    nome_professor =       ?, ";
        sql += "    email_professor =      ?, ";
        sql += "    usu_professor =        ?, ";
        sql += "    senha_professor =      ?  ";
        sql += "where cod_professor =      ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_professor);
            stm.setString(2, this.nome_professor);
            stm.setString(3, this.email_professor);
            stm.setString(4, this.usu_professor);
            stm.setString(5, this.senha_professor);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirProfessor() {
        Connection con = Conexao.conectar();
        String sql = "delete from Professor       ";
        sql += "where cod_professor = ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_professor);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Professor consultarProfessor() {
        Connection con = Conexao.conectar();
        String sql = "select cod_professor, nome_professor, email_professor, usu_professor, senha_professor ";
        sql += "from Professor ";
        sql += "where usu_professor = ? and senha_professor = ? ";
        Professor prof = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_professor);
            stm.setString(2, this.senha_professor);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                prof = new Professor();
                prof.setCod_professor(rs.getInt("cod_professor"));
                prof.setNome_professor(rs.getString("nome_professor"));
                prof.setEmail_professor(rs.getString("email_professor"));
                prof.setUsu_professor(rs.getString("usu_professor"));
                prof.setSenha_professor(rs.getString("senha_professor"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return prof;
    }

    public List<Professor> consultarProfessores() {
        Connection con = Conexao.conectar();
        List<Professor> listaProfessor = new ArrayList<>();
        String sql = "select cod_professor, nome_professor, email_professor ";
        sql += "from professor ";
        sql += "order by cod_professor";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Professor prof = new Professor();
                prof.setCod_professor(rs.getInt("cod_professor"));
                prof.setNome_professor(rs.getString("nome_professor"));
                prof.setEmail_professor(rs.getString("email_professor"));
                listaProfessor.add(prof);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaProfessor;
    }

    public Professor loginProfessor() {
        Connection con = Conexao.conectar();
        String sql = "select usu_professor, senha_professor ";
        sql += "from Professor ";
        sql += "where usu_professor = ? and senha_professor = ?";
        Professor prof = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_professor);
            stm.setString(2, this.senha_professor);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                prof = new Professor();
                prof.setUsu_professor(rs.getString("usu_professor"));
                prof.setSenha_professor(rs.getString("senha_professor"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return prof;
    }

    public static int autenticarProfessor(String usu_professor, String senha_professor) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_professor ";
        sql += "FROM professor ";
        sql += "WHERE usu_professor = ? AND senha_professor = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, usu_professor);
            stm.setString(2, senha_professor);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Autenticação bem-sucedida, retornar o código do professor.
                return rs.getInt("cod_professor");
            }
        } catch (SQLException ex) {
            System.out.println("Erro na autenticação do professor: " + ex.getMessage());
        }
        // Autenticação falhou.
        return -1;
    }

    public static int recuperarCodAluno(String nome_aluno) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_aluno ";
        sql += "FROM aluno ";
        sql += "WHERE nome_aluno = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nome_aluno);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Autenticação bem-sucedida, retornar o código do professor.
                return rs.getInt("cod_aluno");
            }
        } catch (SQLException ex) {
            System.out.println("Erro na autenticação do aluno: " + ex.getMessage());
        }
        // Autenticação falhou.
        return -1;
    }

    public boolean alterarSenhaProfessor() {
        Connection con = Conexao.conectar();
        String sql = "update Professor set senha_professor = ? where email_professor = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.senha_professor);
            stm.setString(2, this.email_professor);
            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return false;
    }

    public boolean validaRedefinicaoSenha() {
        Connection con = Conexao.conectar();
        String sql = "select 1 ";
        sql += "from Professor ";
        sql += "where email_professor = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email_professor);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return false;
    }

    public String consultarNomeAluno(int cod_aluno) {
        Connection con = Conexao.conectar();
        String sql = "SELECT nome_aluno ";
        sql += "FROM aluno ";
        sql += "WHERE cod_aluno = ? ";
        String nomeAluno = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, cod_aluno); // Use a variável "titulo" aqui
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                nomeAluno = rs.getString("nome_aluno"); // Configure o código da atividade

            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Alternativa: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return nomeAluno;
    }
    
}
