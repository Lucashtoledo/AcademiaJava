package jdbc;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {
    private static String url = "jdbc:postgresql://localhost:5432/locadora";                // define a conexãop com o postgres
    private static String user = "postgres";                                                // Usuário postgres
    private static String password = "postgres";
    private static Connection con;

    public static Connection getConnection() {
        try{

            if (con == null || con.isClosed()) {
                con = DriverManager.getConnection(url, user, password);
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return con;
    }

    public static void closeConnection() {
        try {
            if (con != null || con.isClosed()) {
                con.close();
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static List<Enderecos> getEndereco(){
        PreparedStatement ps = null;
        List<Enderecos> enderecos = new ArrayList<Enderecos>();
        try{
            ps = con.prepareStatement("SELECT * FROM enderecos");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Enderecos endereco = new Enderecos();
                endereco.setCod_end(rs.getInt("cod_end"));
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setTipo_log(rs.getString("tipo_log"));
                endereco.setComplemento(rs.getString("complemento"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setUf(rs.getString("uf"));
                endereco.setCep(rs.getString("cep"));
                endereco.setBairro(rs.getString("bairro"));
                enderecos.add(endereco);
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return enderecos;
    }

    public static int inserirEndereco(Enderecos endereco){
        PreparedStatement ps = null;
        try{
            ps = con.prepareStatement("INSERT INTO enderecos (logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, endereco.getLogradouro());
            ps.setString(2, endereco.getTipo_log());
            ps.setString(3, endereco.getComplemento());
            ps.setString(4, endereco.getCidade());
            ps.setString(5, endereco.getUf());
            ps.setString(6, endereco.getCep());
            ps.setString(7, endereco.getNumero());
            ps.setString(8, endereco.getBairro());

            return ps.executeUpdate();

        }catch (SQLException e){
            throw new RuntimeException("Erro ao incluir o endereço. " + e.getMessage());
        }
    }

    public static List<Categorias> getAllCategorias(){
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("SELECT * FROM categorias");
            ResultSet rs = ps.executeQuery();
            List<Categorias> categorias = new ArrayList<Categorias>();
            while (rs.next()) {
                Categorias categoria = new Categorias();
                categoria.setCod_cat(rs.getInt("cod_cat"));
                categoria.setNome(rs.getString("nome"));

                String valorString = rs.getString("valor").replaceAll("[^0-9.,]", "");

                valorString = valorString.replace(',', '.');
                BigDecimal valor = new BigDecimal(valorString);

                categoria.setValor(valor);
                categorias.add(categoria);
            }

            return categorias;
        }catch (SQLException e){
            throw new RuntimeException("Erro ao obter os dados da tabela. " + e);
        }
    }

    public static int inserirCategoria(Categorias categoria){
        PreparedStatement ps = null;
        try{
            ps = con.prepareStatement("INSERT INTO categorias (nome, valor) VALUES (?, ?)");
            ps.setString(1, categoria.getNome());
            ps.setBigDecimal(2, categoria.getValor());
            return ps.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException("Erro ao incluir categoria. " + e.getMessage());
        }
    }

}
