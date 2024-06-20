package jdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {
    private static String url = "jdbc:postgresql://localhost:5432/postgres";                // define a conexãop com o postgres
    private static String user = "postgres";                                                // Usuário postgres
    private static String password = "postgres";                                            // Senha configurada na database
    private static Connection con = null;                                                   // Declaração do objeto de conexão

    public static Connection getConnection() {                                              // método para conectar

        try {                                                                               // tenta executar o código abaixo
            if (con == null || con.isClosed()) {                                            // verifica se há conexão com o banco de dados
                con = DriverManager.getConnection(url, user, password);                     // instancia um novo objeto do tipo "Connection" com o banco recebendo os parâmetros
            }
        } catch (SQLException e) {                                                          // trata a exceção
            throw new RuntimeException("Não foi possível conectar: " + e.getMessage());     // gera uma exceção "artificial" para ser utilizada em outro momento
        }
        return con;                                                                         // realiza a conexão quando o método for chamado
    }

    public static List<Person> getAllPerson() {                                 // método para retornar os dados do banco
        PreparedStatement ps = null;                                            // declara um objeto que irá receber as instruções SQL
        List<Person> persons = new ArrayList<Person>();                         // Cria uma lista que será utilizada como retorno do método
        try {
            ps = con.prepareStatement("SELECT * FROM person");              // adiciona as instruções no objeto "ps", essas instruções dependem de qual banco está trabalhando
            ResultSet rs = ps.executeQuery();                                   // executa uma consulta no SQL e retorna algum valor
            while (rs.next()) {                                                 // laço while para verificar se possúi mais alguma linha, se houver, continua executando
                Person person = new Person();
                person.setpersonId(rs.getInt("personid"));           //adiciona o id ao objeto person
                person.setName(rs.getString("name"));                //adiciona o nome ao objeto person
                person.setEmail(rs.getString("email"));              //adiciona o email ao objeto person
                persons.add(person);                                            //adiciona o objeto person a lista persons
            }
        } catch (SQLException e) {
            throw new RuntimeException("Não foi possível obter os dados. " + e.getMessage());
        }
        return persons;
    }

    public static int updatePerson(Person person) {                                                      // Método para atualizar os dados de uma Pessoa da tabela person
        PreparedStatement ps = null;
        try{
            ps = con.prepareStatement("UPDATE person SET name = ?, email = ? WHERE personid = ?");   // recebe o parâmetro "con.prepareStatement", onde os 3 "?" são os dados que vai receber para atualizar
            ps.setString(1, person.getName());                                              // Adiciona as informações obtidas com o método get da classe Person na posição 1
            ps.setString(2, person.getEmail());                                             // Adiciona as informações obtidas com o método get da classe Person na posição 2
            ps.setInt(3, person.getpersonId());                                             // Adiciona as informações obtidas com o método get da classe Person na posição 2
            return ps.executeUpdate();                                                                   // executa o update com o método executeUpdate()
        }catch (SQLException e){
            throw new RuntimeException("Não foi possível atualizar a tabela. " + e.getMessage());
        }
    }

    public static int insertPerson(Person person) {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("INSERT INTO person (name, email) VALUES (?,?)");
            ps.setString(1, person.getName());
            ps.setString(2, person.getEmail());
            return ps.executeUpdate();
        }catch (SQLException e){
            throw  new RuntimeException("Não foi possível adicionar a pessoa. " + e.getMessage());
        }
    }

    public static int deletePerson(int personId) {
        PreparedStatement ps = null;
        try{
            ps = con.prepareStatement("DELETE FROM person WHERE personid = ?");
            ps.setInt(1, personId);
            if (ps.executeUpdate() <= 0) {
                throw new RuntimeException("O ID informado não foi encontrado.");
            }
            return ps.executeUpdate();

        }catch (SQLException e){
            throw  new RuntimeException("Não foi possível excluir a pessoa. " + e.getMessage());
        }
    }

    public static Person getPerson(int personId) {
        PreparedStatement ps = null;
        try{
            ps = con.prepareStatement("SELECT * FROM person WHERE personid = ?");
            ps.setInt(1, personId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Person person = new Person();
                person.setpersonId(rs.getInt("personid"));
                person.setName(rs.getString("name"));
                person.setEmail(rs.getString("email"));
                return person;
            }else {
                throw new RuntimeException("Esse usuário não foi encontrado.");
            }

        }catch (SQLException e){
            throw new RuntimeException("Não foi possível obter os dados. " + e.getMessage());
        }
    }

    public static void  disconnect(){
        try{
            if (con != null || con.isClosed()) {    // verifica se a database está desconectada
                con.close();                        // desconecta o data base
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}

