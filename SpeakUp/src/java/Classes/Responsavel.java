package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Util.Conexao;

public class Responsavel {

    int cod_resp;
    String nome_resp;
    String email_resp;
    String usu_resp;
    String senha_resp;
    Integer cod_aluno;
    String nome_aluno;

    public String getNome_aluno() {
        return nome_aluno;
    }

    public void setNome_aluno(String nome_aluno) {
        this.nome_aluno = nome_aluno;
    }

    public int getCod_resp() {
        return cod_resp;
    }

    public void setCod_resp(int cod_resp) {
        this.cod_resp = cod_resp;
    }

    public String getNome_resp() {
        return nome_resp;
    }

    public void setNome_resp(String nome_resp) {
        this.nome_resp = nome_resp;
    }

    public String getEmail_resp() {
        return email_resp;
    }

    public void setEmail_resp(String email_resp) {
        this.email_resp = email_resp;
    }

    public String getUsu_resp() {
        return usu_resp;
    }

    public void setUsu_resp(String usu_resp) {
        this.usu_resp = usu_resp;
    }

    public String getSenha_resp() {
        return senha_resp;
    }

    public void setSenha_resp(String senha_resp) {
        this.senha_resp = senha_resp;
    }

    public Integer getCod_aluno() {
        return cod_aluno;
    }

    public void setCod_aluno(Integer cod_aluno) {
        this.cod_aluno = cod_aluno;
    }

    public boolean cadastrarResponsavel() {
        Connection con = Conexao.conectar();
        String sql = "insert into Responsavel ";
        sql += "(nome_resp, email_resp, usu_resp, senha_resp, cod_aluno  ) ";
        sql += "values (?,?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome_resp);
            stm.setString(2, this.email_resp);
            stm.setString(3, this.usu_resp);
            stm.setString(4, this.senha_resp);
            stm.setInt(5, this.cod_aluno);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarResponsavel() {
        Connection con = Conexao.conectar();
        String sql = "update Responsavel ";
        sql += "set cod_resp =        ?, ";
        sql += "    nome_resp =       ?, ";
        sql += "    email_resp =      ?, ";
        sql += "    usu_resp =        ?, ";
        sql += "    senha_resp =      ?, ";
        sql += "    cod_aluno =       ?  ";
        sql += "where cod_resp =      ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_resp);
            stm.setString(2, this.nome_resp);
            stm.setString(3, this.email_resp);
            stm.setString(4, this.usu_resp);
            stm.setString(5, this.senha_resp);
            stm.setInt(6, this.cod_aluno);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirResponsavel() {
        Connection con = Conexao.conectar();
        String sql = "delete from Responsavel       ";
        sql += "where cod_resp = ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_resp);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Responsavel consultarResponsavel() {
        Connection con = Conexao.conectar();
        String sql = "select cod_resp, nome_resp, email_resp, usu_resp, senha_resp, cod_aluno ";
        sql += "from Responsavel ";
        sql += "where usu_resp = ? and senha_resp = ? ";
        Responsavel resp = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_resp);
            stm.setString(2, this.senha_resp);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                resp = new Responsavel();
                resp.setCod_resp(rs.getInt("cod_resp"));
                resp.setNome_resp(rs.getString("nome_resp"));
                resp.setEmail_resp(rs.getString("email_resp"));
                resp.setUsu_resp(rs.getString("usu_resp"));
                resp.setSenha_resp(rs.getString("senha_resp"));
                resp.setCod_aluno(rs.getInt("cod_resp"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Responsavel: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return resp;
    }

    public Responsavel loginResp() {
        Connection con = Conexao.conectar();
        String sql = "select usu_resp, senha_resp ";
        sql += "from Responsavel ";
        sql += "where usu_resp = ? and senha_resp = ?";
        Responsavel resp = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_resp);
            stm.setString(2, this.senha_resp);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                resp = new Responsavel();
                resp.setUsu_resp(rs.getString("usu_resp"));
                resp.setSenha_resp(rs.getString("senha_resp"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return resp;
    }

    public static int autenticarResponsavel(String usu_resp, String senha_resp) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_resp ";
        sql += "FROM responsavel ";
        sql += "WHERE usu_resp = ? AND senha_resp = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, usu_resp);
            stm.setString(2, senha_resp);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Autenticação bem-sucedida, retornar o código do professor.
                return rs.getInt("cod_resp");
            }
        } catch (SQLException ex) {
            System.out.println("Erro na autenticação do responsavel: " + ex.getMessage());
        }
        // Autenticação falhou.
        return -1;
    }

    public static int consultarCodAluno(String usu_resp, String senha_resp) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_aluno ";
        sql += "FROM responsavel ";
        sql += "WHERE usu_resp = ? AND senha_resp = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, usu_resp);
            stm.setString(2, senha_resp);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Autenticação bem-sucedida, retornar o código do professor.
                return rs.getInt("cod_aluno");
            }
        } catch (SQLException ex) {
            System.out.println("Erro na autenticação do responsavel: " + ex.getMessage());
        }
        // Autenticação falhou.
        return -1;
    }

    public boolean alterarSenhaResponsavel() {
        Connection con = Conexao.conectar();
        String sql = "update Responsavel set senha_resp = ? where email_resp = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.senha_resp);
            stm.setString(2, this.email_resp);
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
        sql += "from Responsavel ";
        sql += "where email_resp = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email_resp);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return false;
    }

}
