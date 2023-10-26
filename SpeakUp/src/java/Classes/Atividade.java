package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Util.Conexao;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Atividade {

    int cod_atividade;
    int cod_aluno;
    int cod_professor;
    String titulo_atividade;
    Date data_inicio;
    Date data_encerramento;
    String status_atividade;
    String numAtividade;
    String numAtividadeCorrigida;

    public String getNumAtividadeCorrigida() {
        return numAtividadeCorrigida;
    }

    public void setNumAtividadeCorrigida(String numAtividadeCorrigida) {
        this.numAtividadeCorrigida = numAtividadeCorrigida;
    }

    public String getNumAtividade() {
        return numAtividade;
    }

    public void setNumAtividade(String numAtividade) {
        this.numAtividade = numAtividade;
    }

    public String getStatus_atividade() {
        return status_atividade;
    }

    public void setStatus_atividade(String status_atividade) {
        this.status_atividade = status_atividade;
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

    public String getTitulo_atividade() {
        return titulo_atividade;
    }

    public void setTitulo_atividade(String titulo_atividade) {
        this.titulo_atividade = titulo_atividade;
    }

    public int getCod_atividade() {
        return cod_atividade;
    }

    public void setCod_atividade(int cod_atividade) {
        this.cod_atividade = cod_atividade;
    }

    public Date getData_inicio() {
        return data_inicio;
    }

    public void setData_inicio(Date data_inicio) {
        this.data_inicio = data_inicio;
    }

    public Date getData_encerramento() {
        return data_encerramento;
    }

    public void setData_encerramento(Date data_encerramento) {
        this.data_encerramento = data_encerramento;
    }

    public boolean cadastrarAtividade() {
        Connection con = Conexao.conectar();
        String sql = "insert into Atividade ";
        sql += "(cod_aluno, cod_professor, titulo_atividade, data_inicio, data_encerramento, status_atividade ) ";
        sql += "values (?,?,?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, (this.cod_aluno));
            stm.setInt(2, (this.cod_professor));
            stm.setString(3, (this.titulo_atividade));
            stm.setDate(4, (this.data_inicio));
            stm.setDate(5, (this.data_encerramento));
            stm.setString(6, (this.status_atividade));
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean alterarStatusAtividade() {
        Connection con = Conexao.conectar();
        String sql = "update Atividade ";
        sql += "set status_atividade   =       ? ";
        sql += "where cod_atividade    =       ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.status_atividade);
            stm.setInt(2, this.cod_atividade);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public boolean excluirAtividade() {
        Connection con = Conexao.conectar();
        String sql = "delete from Atividade ";
        sql += "where cod_atividade = ?  ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_atividade);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + "\n Comando SQL : " + sql);
            return false;
        }
        return true;
    }

    public Atividade consultarAtividade() {
        Connection con = Conexao.conectar();
        String sql = "select cod_atividade, data_inicio, data_encerramento, status_atividade ";
        sql += "from Atividade ";
        sql += "where cod_atividade = ?  ";
        Atividade ati = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_atividade);
            stm.setDate(2, this.data_inicio);
            stm.setDate(3, this.data_encerramento);
            stm.setString(4, this.status_atividade);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Alternativa: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return ati;
    }

    public List<Atividade> consultarAtividades() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividade = new ArrayList<>();
        String sql = "select cod_atividade, titulo_atividade, data_inicio, data_encerramento, status_atividade ";
        sql += "from atividade ";
        sql += "where cod_aluno = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_aluno);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setData_inicio(rs.getDate("data_inicio"));
                ati.setData_encerramento(rs.getDate("data_encerramento"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividade.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividade;
    }

    public Atividade consultarTitulo(String titulo) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_atividade, titulo_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE titulo_atividade LIKE ? ";
        Atividade ati = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + titulo + "%"); // Use a variável "titulo" aqui
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade")); // Configure o código da atividade

                // Você pode configurar outros atributos da atividade aqui, se necessário
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Alternativa: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return ati;
    }

    public String ConsultarTituloAtividade() {
        Connection con = Conexao.conectar();
        String sql = "select titulo_atividade ";
        sql += "from Atividade ";
        sql += "where cod_atividade = ?  ";
        String tituloAtividade = null;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_atividade);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                tituloAtividade = rs.getString("titulo_atividade");
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Título da Atividade: " + ex.getMessage() + "\n Comando SQL: " + sql);
        }
        return tituloAtividade;
    }

    public String ConsultarCodProfessor() {
        Connection con = Conexao.conectar();
        String sql = "select cod_professor ";
        sql += "from Atividade ";
        sql += "where cod_atividade = ?  ";
        String codProfessor = null; // Vamos armazenar o título em uma variável String

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.cod_atividade); // Use cod_atividade em vez de titulo_atividade
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                codProfessor = rs.getString("cod_professor"); // Obtenha o título da coluna no ResultSet
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Título da Atividade: " + ex.getMessage() + "\n Comando SQL: " + sql);
        }
        return codProfessor;
    }

    public int consultarCodAtividade(String titulo) {
        Connection con = Conexao.conectar();
        String sql = "SELECT cod_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE titulo_atividade LIKE ? ";
        int codAtividade = 0;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + titulo + "%"); // Use a variável "titulo" aqui
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                codAtividade = rs.getInt("cod_atividade"); // Configure o código da atividade

                // Você pode configurar outros atributos da atividade aqui, se necessário
            }
        } catch (SQLException ex) {
            System.out.println("Erro Consulta Alternativa: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return codAtividade;
    }

    public String contadorAtividade() {
        Connection con = Conexao.conectar();
        String sql = "SELECT COUNT(*) FROM Atividade";
        String contadorAtividade = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                contadorAtividade = String.valueOf(rs.getInt(1));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return contadorAtividade;
    }

    public String contadorAtividadeCorrigida() {
        Connection con = Conexao.conectar();
        String sql = "SELECT COUNT(*) FROM Atividade ";
        sql += "WHERE status_atividade LIKE 'Corrigida' ";
        String contadorAtividadeCorrigida = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                contadorAtividadeCorrigida = String.valueOf(rs.getInt(1));
            }
        } catch (SQLException ex) {
            System.out.println("Erro Login Professor: " + ex.getMessage() + "\n Comando SQL : " + sql);
        }
        return contadorAtividadeCorrigida;
    }

    public List<Atividade> consultarAtividadeDomingo() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividadeDomingo = new ArrayList<>();
        String sql = "SELECT cod_atividade, titulo_atividade, status_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE DAYOFWEEK(data_encerramento) = 1 ";
        sql += "AND YEARWEEK(data_encerramento) >= YEARWEEK(NOW()) ";
        sql += "AND YEARWEEK(data_encerramento) <= YEARWEEK(NOW()) ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividadeDomingo.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividadeDomingo;
    }

    public List<Atividade> consultarAtividadeSegunda() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividadeSegunda = new ArrayList<>();
        String sql = "SELECT cod_atividade, titulo_atividade, status_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE DAYOFWEEK(data_encerramento) = 2 ";
        sql += "AND YEARWEEK(data_encerramento) >= YEARWEEK(NOW()) ";
        sql += "AND YEARWEEK(data_encerramento) <= YEARWEEK(NOW()) ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividadeSegunda.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividadeSegunda;
    }

    public List<Atividade> consultarAtividadeTerca() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividadeTerca = new ArrayList<>();
        String sql = "SELECT cod_atividade, titulo_atividade, status_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE DAYOFWEEK(data_encerramento) = 3 ";
        sql += "AND YEARWEEK(data_encerramento) >= YEARWEEK(NOW()) ";
        sql += "AND YEARWEEK(data_encerramento) <= YEARWEEK(NOW()) ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividadeTerca.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividadeTerca;
    }

    public List<Atividade> consultarAtividadeQuarta() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividadeQuarta = new ArrayList<>();
        String sql = "SELECT cod_atividade, titulo_atividade, status_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE DAYOFWEEK(data_encerramento) = 4 ";
        sql += "AND YEARWEEK(data_encerramento) >= YEARWEEK(NOW()) ";
        sql += "AND YEARWEEK(data_encerramento) <= YEARWEEK(NOW()) ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividadeQuarta.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividadeQuarta;
    }

    public List<Atividade> consultarAtividadeQuinta() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividadeQuinta = new ArrayList<>();
        String sql = "SELECT cod_atividade, titulo_atividade, status_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE DAYOFWEEK(data_encerramento) = 5 ";
        sql += "AND YEARWEEK(data_encerramento) >= YEARWEEK(NOW()) ";
        sql += "AND YEARWEEK(data_encerramento) <= YEARWEEK(NOW()) ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividadeQuinta.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividadeQuinta;
    }

    public List<Atividade> consultarAtividadeSexta() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividadeSexta = new ArrayList<>();
        String sql = "SELECT cod_atividade, titulo_atividade, status_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE DAYOFWEEK(data_encerramento) = 6 ";
        sql += "AND YEARWEEK(data_encerramento) >= YEARWEEK(NOW()) ";
        sql += "AND YEARWEEK(data_encerramento) <= YEARWEEK(NOW()) ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividadeSexta.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividadeSexta;
    }
    
    public List<Atividade> consultarAtividadeSabado() {
        Connection con = Conexao.conectar();
        List<Atividade> listaAtividadeSabado = new ArrayList<>();
        String sql = "SELECT cod_atividade, titulo_atividade, status_atividade ";
        sql += "FROM atividade ";
        sql += "WHERE DAYOFWEEK(data_encerramento) = 7 ";
        sql += "AND YEARWEEK(data_encerramento) >= YEARWEEK(NOW()) ";
        sql += "AND YEARWEEK(data_encerramento) <= YEARWEEK(NOW()) ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Atividade ati = new Atividade();
                ati.setCod_atividade(rs.getInt("cod_atividade"));
                ati.setTitulo_atividade(rs.getString("titulo_atividade"));
                ati.setStatus_atividade(rs.getString("status_atividade"));
                listaAtividadeSabado.add(ati);
            }
        } catch (SQLException ex) {
            System.out.println("Erro no Select Único: " + ex.getMessage() + " \nComando SQL : " + sql);
        }
        return listaAtividadeSabado;
    }

}
