package Util;

import java.sql.*;

public class Conexao {

    public static Connection conectar() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/SpeakUpKids1";
        String user = "Spk";
        String password = "123";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro ao conectar com o banco");
        }
        return con;
    }
}
