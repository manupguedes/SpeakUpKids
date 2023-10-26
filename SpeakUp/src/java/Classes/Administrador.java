package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Util.Conexao;

public class Administrador {

    int cod_admin;
    String nome_admin;
    String email_admin;
    String usu_admin;
    String senha_admin;

    public int getCod_admin() {
        return cod_admin;
    }

    public void setCod_admin(int cod_admin) {
        this.cod_admin = cod_admin;
    }

    public String getNome_admin() {
        return nome_admin;
    }

    public void setNome_admin(String nome_admin) {
        this.nome_admin = nome_admin;
    }

    public String getEmail_admin() {
        return email_admin;
    }

    public void setEmail_admin(String email_admin) {
        this.email_admin = email_admin;
    }

    public String getUsu_admin() {
        return usu_admin;
    }

    public void setUsu_admin(String usu_admin) {
        this.usu_admin = usu_admin;
    }

    public String getSenha_admin() {
        return senha_admin;
    }

    public void setSenha_admin(String senha_admin) {
        this.senha_admin = senha_admin;
    }

    public boolean cadastrarAdministrador() {
        Connection con = Conexao.conectar();
        String sql = "insert into Administrador ";
        sql += "(nome_admin, email_admin, usu_admin, senha_admin  ) ";
        sql += "values (?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome_admin);
            stm.setString(2, this.email_admin);
            stm.setString(3, this.usu_admin);
            stm.setString(4, this.senha_admin);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarAdministrador() {
        Connection con = Conexao.conectar();
        String sql = "update Administrador ";
        sql += "set cod_admin =        ?, ";
        sql += "    nome_admin =       ?, ";
        sql += "    email_admin =      ?, ";
        sql += "    usu_admin =        ?, ";
        sql += "    senha_admin =      ?  ";
        sql += "where cod_admin =      ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_admin);
            stm.setString(2, this.nome_admin);
            stm.setString(3, this.email_admin);
            stm.setString(4, this.usu_admin);
            stm.setString(5, this.senha_admin);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirAdministrador() {
        Connection con = Conexao.conectar();
        String sql = "delete from Administrador       ";
        sql += "where cod_admin = ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_admin);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Administrador consultarAdministrador() {
        Connection con = Conexao.conectar();
        String sql = "select cod_admin, nome_admin, email_admin, usu_admin, senha_admin ";
        sql += "from Administrador ";
        sql += "where usu_admin = ? and senha_admin = ?  ";
        Administrador admin = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_admin);
            stm.setString(2, this.senha_admin);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                admin = new Administrador();
                admin.setCod_admin(rs.getInt("cod_admin"));
                admin.setNome_admin(rs.getString("nome_admin"));
                admin.setEmail_admin(rs.getString("email_admin"));
                admin.setUsu_admin(rs.getString("usu_admin"));
                admin.setSenha_admin(rs.getString("senha_admin"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Administrador: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return admin;
    }

    public Administrador loginAdmin() {
        Connection con = Conexao.conectar();
        String sql = "select usu_admin, senha_admin ";
        sql += "from Administrador ";
        sql += "where usu_admin = ? and senha_admin = ?";
        Administrador admin = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usu_admin);
            stm.setString(2, this.senha_admin);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                admin = new Administrador();
                admin.setUsu_admin(rs.getString("usu_admin"));
                admin.setSenha_admin(rs.getString("senha_admin"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return admin;
    }

    public static int autenticarAdministrador(String usu_admin, String senha_admin) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_admin ";
        sql += "FROM administrador ";
        sql += "WHERE usu_admin = ? AND senha_admin = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, usu_admin);
            stm.setString(2, senha_admin);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Autenticação bem-sucedida, retornar o código do professor.
                return rs.getInt("cod_admin");
            }
        } catch (SQLException ex) {
            System.out.println("Erro na autenticação do administrador: " + ex.getMessage());
        }
        // Autenticação falhou.
        return -1;
    }

    public boolean alterarSenhaAdmin() {
        Connection con = Conexao.conectar();
        String sql = "update Administrador set senha_admin = ? where email_admin = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.senha_admin);
            stm.setString(2, this.email_admin);
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
        sql += "from Administrador ";
        sql += "where email_admin = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email_admin);
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
