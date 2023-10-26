package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Util.Conexao;
import java.util.ArrayList;
import java.util.List;

public class Turma {

    int cod_turma;
    int cod_professor;
    int cod_aluno;
    String nome_professor;
    String nome_aluno;

    public String getNome_professor() {
        return nome_professor;
    }

    public void setNome_professor(String nome_professor) {
        this.nome_professor = nome_professor;
    }

    public String getNome_aluno() {
        return nome_aluno;
    }

    public void setNome_aluno(String nome_aluno) {
        this.nome_aluno = nome_aluno;
    }

    public int getCod_turma() {
        return cod_turma;
    }

    public void setCod_turma(int cod_turma) {
        this.cod_turma = cod_turma;
    }

    public int getCod_professor() {
        return cod_professor;
    }

    public void setCod_professor(int cod_professor) {
        this.cod_professor = cod_professor;
    }

    public int getCod_aluno() {
        return cod_aluno;
    }

    public void setCod_aluno(int cod_aluno) {
        this.cod_aluno = cod_aluno;
    }

    public boolean cadastrarTurma() {
        Connection con = Conexao.conectar();
        String sql = "insert into Turma ";
        sql += "(cod_professor, cod_aluno  ) ";
        sql += "values (?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_professor));
            stm.setInt(2, (this.cod_aluno));
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarTurma() {
        Connection con = Conexao.conectar();
        String sql = "update Turma ";
        sql += "set cod_professor      =       ?, ";
        sql += "    cod_aluno          =       ?  ";
        sql += "where cod_turma  =       ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_professor));
            stm.setInt(2, (this.cod_aluno));
            stm.setInt(3, (this.cod_turma));
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirTurma() {
        Connection con = Conexao.conectar();
        String sql = "delete from Turma       ";
        sql += "where cod_turma = ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_turma);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Turma consultarTurma() {
        Connection con = Conexao.conectar();
        String sql = "select cod_turma, cod_professor, cod_aluno ";
        sql += "from Turma ";
        sql += "where cod_turma = ?  ";
        Turma tur = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_turma));
            stm.setInt(2, (this.cod_professor));
            stm.setInt(3, (this.cod_aluno));
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                tur = new Turma();
                tur.setCod_turma(rs.getInt("cod_turma"));
                tur.setCod_professor(rs.getInt("cod_professor"));
                tur.setCod_aluno(rs.getInt("cod_aluno"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Turma: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return tur;
    }

    public List<Turma> consultarTurmas() {
        Connection con = Conexao.conectar();
        List<Turma> listaTurma = new ArrayList<>();
        String sql = "SELECT cod_turma, b.nome_professor, c.nome_aluno "
                + "FROM turma a "
                + "INNER JOIN professor b ON a.cod_professor = b.cod_professor "
                + "INNER JOIN aluno c ON a.cod_aluno = c.cod_aluno";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Turma tur = new Turma();
                tur.setCod_turma(rs.getInt("cod_turma"));
                tur.setNome_professor(rs.getString("nome_professor"));
                tur.setNome_aluno(rs.getString("nome_aluno"));
                listaTurma.add(tur);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        } finally {
            // Certifique-se de fechar a conexão no bloco finally para garantir que seja fechada, mesmo em caso de exceção.
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listaTurma;
    }

    public List<Turma> consultarAlunos(int pCod_professor) {
        Connection con = Conexao.conectar();
        String sql =  "SELECT a.cod_aluno, a.nome_aluno ";
               sql += "FROM turma t, aluno a ";
               sql += "WHERE t.cod_aluno = a.cod_aluno ";
               sql += "AND t.cod_professor = ?";
        List<Turma> alunosTurma = new ArrayList();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCod_professor);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Turma tur = new Turma();
                tur.setCod_aluno(rs.getInt("cod_aluno"));
                tur.setNome_aluno(rs.getString("nome_aluno"));
                alunosTurma.add(tur);
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        System.out.println("Número de alunos filtrados: " + alunosTurma.size());
        return alunosTurma;
    }
}
