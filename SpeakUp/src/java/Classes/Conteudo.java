package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Util.Conexao;
import java.util.ArrayList;
import java.util.List;

public class Conteudo {

    int cod_cont;
    String nome_cont;
    String desc_cont;
    int cod_aluno;

    public int getCod_aluno() {
        return cod_aluno;
    }

    public void setCod_aluno(int cod_aluno) {
        this.cod_aluno = cod_aluno;
    }

    public int getCod_cont() {
        return cod_cont;
    }

    public void setCod_cont(int cod_cont) {
        this.cod_cont = cod_cont;
    }

    public String getNome_cont() {
        return nome_cont;
    }

    public void setNome_cont(String nome_cont) {
        this.nome_cont = nome_cont;
    }

    public String getDesc_cont() {
        return desc_cont;
    }

    public void setDesc_cont(String desc_cont) {
        this.desc_cont = desc_cont;
    }

    public boolean cadastrarConteudo() {
        Connection con = Conexao.conectar();
        String sql = "insert into Conteudo ";
        sql += "(cod_aluno, nome_cont, desc_cont) ";
        sql += "values (?,?,?) ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_aluno);
            stm.setString(2, this.nome_cont);
            stm.setString(3, this.desc_cont);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarConteudo() {
        Connection con = Conexao.conectar();
        String sql = "update Conteudo ";
        sql += "set nome_cont =       ?, ";
        sql += "    desc_cont =       ?  ";
        sql += "where cod_cont =      ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome_cont);
            stm.setString(2, this.desc_cont);
            stm.setInt(3, this.cod_cont);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirConteudo() {
        Connection con = Conexao.conectar();
        String sql = "delete from Conteudo       ";
        sql += "where cod_cont = ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_cont);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Conteudo consultarConteudo() {
        Connection con = Conexao.conectar();
        String sql = "select nome_cont, desc_cont ";
        sql += "from Conteudo ";
        sql += "where cod_cont = ? ";
        Conteudo cont = new Conteudo();
        cont.setCod_cont(this.cod_cont);
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_cont);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cont = new Conteudo();
                cont.setNome_cont(rs.getString("nome_cont"));
                cont.setDesc_cont(rs.getString("desc_cont"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Conteudo: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return cont;
    }

    public List<Conteudo> consultarConteudos() {
        Connection con = Conexao.conectar();
        List<Conteudo> listaConteudo = new ArrayList<>();
        String sql = "select cod_cont, nome_cont, desc_cont ";
        sql += "from conteudo ";
        sql += "where cod_aluno = ? ";
        sql += "order by cod_cont ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_aluno);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Conteudo cont = new Conteudo();
                cont.setCod_cont(rs.getInt("cod_cont"));
                cont.setNome_cont(rs.getString("nome_cont"));
                cont.setDesc_cont(rs.getString("desc_cont"));
                listaConteudo.add(cont);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaConteudo;
    }

    public String consultarUltimoConteudoPorCodAluno(int vCodAluno) {
        Connection con = Conexao.conectar();
        String sql =  "SELECT nome_cont ";
               sql += "FROM conteudo ";
               sql += "WHERE cod_aluno = ? ";
               sql += "ORDER BY nome_cont DESC ";
               sql += "LIMIT 1 ";
        String ultimoConteudoVisto = null;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, vCodAluno);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                ultimoConteudoVisto = rs.getString("nome_cont");
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Conteudo: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return ultimoConteudoVisto;
    }

}
