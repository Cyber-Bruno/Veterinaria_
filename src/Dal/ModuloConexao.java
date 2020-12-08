package Dal;

// Para o java trabalhar com o SQL
import java.sql.*;
// ____________

public class ModuloConexao {

    // Método responsavel por estabelcer a conexão com o banco.
    public static Connection conector() {
        java.sql.Connection conexao = null;
        // A linha abaixo chama o driver que ta na "libraries". 
        String driver = "com.mysql.jdbc.Driver";
        // Armazenando informações referente ao banco
        String url = "jdbc:mysql://localhost:3306/Vet";
        String user = "root";
        String password = "";
        // Estabelencendo a conexão com o Banco de Dados
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            // A linha abaixo serve de apoio para esclarecer o erro
            //System.out.println(e);
            
            return null;
        }
    }

}
