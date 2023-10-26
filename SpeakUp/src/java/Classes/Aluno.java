package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Util.Conexao;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Aluno {

    int cod_aluno;
    String nome_aluno;
    String email_aluno;
    Date dataNscAluno;
    String usu_aluno;
    String senha_aluno;

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

    public String getEmail_aluno() {
        return email_aluno;
    }

    public void setEmail_aluno(String email_aluno) {
        this.email_aluno = email_aluno;
    }

    public Date getDataNscAluno() {
        return dataNscAluno;
    }

    public void setDataNscAluno(Date dataNscAluno) {
        this.dataNscAluno = dataNscAluno;
    }

    public String getUsu_aluno() {
        return usu_aluno;
    }

    public void setUsu_aluno(String usu_aluno) {
        this.usu_aluno = usu_aluno;
    }

    public String getSenha_aluno() {
        return senha_aluno;
    }

    public void setSenha_aluno(String senha_aluno) {
        this.senha_aluno = senha_aluno;
    }

    public boolean cadastrarAluno() {
        Connection con = Conexao.conectar();
        String sql = "insert into Aluno ";
        sql += "(nome_aluno, email_aluno, dataNascAluno, usu_aluno, senha_aluno ) ";
        sql += "values (?,?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome_aluno);
            stm.setString(2, this.email_aluno);
            stm.setDate(3, this.dataNscAluno);
            stm.setString(4, this.usu_aluno);
            stm.setString(5, this.senha_aluno);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarSenhaAluno() {
        Connection con = Conexao.conectar();
        String sql = "update Aluno set senha_aluno = ? where email_aluno = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.senha_aluno);
            stm.setString(2, this.email_aluno);
            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }

        return false;
    }

    public boolean excluirAluno() {
        Connection con = Conexao.conectar();
        String sql = "delete from Aluno ";
        sql += "where cod_aluno = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_aluno);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Aluno consultarAluno() {
        Connection con = Conexao.conectar();
        String sql = "select cod_aluno, nome_aluno, email_aluno, dataNascAluno, usu_aluno, senha_aluno ";
        sql += "from Aluno ";
        sql += "where usu_aluno = ? and senha_aluno = ? ";
        Aluno alu = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_aluno);
            stm.setString(2, this.senha_aluno);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                alu = new Aluno();
                alu.setCod_aluno(rs.getInt("cod_aluno"));
                alu.setNome_aluno(rs.getString("nome_aluno"));
                alu.setEmail_aluno(rs.getString("email_aluno"));
                alu.setDataNscAluno(rs.getDate("dataNascAluno"));
                alu.setUsu_aluno(rs.getString("usu_aluno"));
                alu.setSenha_aluno(rs.getString("senha_aluno"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Aluno: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return alu;
    }

    public List<Aluno> consultarAlunos() {
        Connection con = Conexao.conectar();
        List<Aluno> listaAlunos = new ArrayList<>();
        String sql = "select cod_aluno, nome_aluno, email_aluno ";
        sql += "from aluno ";
        sql += "order by cod_aluno";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Aluno alu = new Aluno();
                alu.setCod_aluno(rs.getInt("cod_aluno"));
                alu.setNome_aluno(rs.getString("nome_aluno"));
                alu.setEmail_aluno(rs.getString("email_aluno"));
                listaAlunos.add(alu);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAlunos;
    }

    public Aluno loginAluno() {
        Connection con = Conexao.conectar();
        String sql = "select usu_aluno, senha_aluno ";
        sql += "from Aluno ";
        sql += "where usu_aluno = ? and senha_aluno = ?";
        Aluno alu = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_aluno);
            stm.setString(2, this.senha_aluno);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                alu = new Aluno();
                alu.setUsu_aluno(rs.getString("usu_aluno"));
                alu.setSenha_aluno(rs.getString("senha_aluno"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Aluno: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return alu;
    }

    public static int autenticarAluno(String usu_aluno, String senha_aluno) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_aluno ";
        sql += "FROM aluno ";
        sql += "WHERE usu_aluno = ? AND senha_aluno = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, usu_aluno);
            stm.setString(2, senha_aluno);
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

    public boolean validaRedefinicaoSenha() {
        Connection con = Conexao.conectar();
        String sql = "select 1 ";
        sql += "from Aluno ";
        sql += "where email_aluno = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email_aluno);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Aluno: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return false;
    }
}
