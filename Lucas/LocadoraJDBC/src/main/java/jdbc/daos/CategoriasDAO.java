package jdbc.daos;

import jdbc.configs.Database;
import jdbc.model.Categorias;
import jdbc.model.Enderecos;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriasDAO {
    public void insert(Categorias categorias) {
        String sql = "INSERT INTO categorias (nome, valor) VALUES (?, ?)";
        try{
            Connection con = Database.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public List<Categorias> getAll(){
        String sql = "SELECT * FROM categorias";
        PreparedStatement ps = null;
        List<Categorias> categorias = new ArrayList<Categorias>();
        try{
            ps = Database.con.prepareStatement(sql);
            Categorias categoria;
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                categoria = new Categorias();
                categoria.setNome(rs.getString("nome"));
                String valorString = rs.getString("valor").replaceAll("[^0-9.,]","");
                valorString = valorString.replace(",", ".");
                BigDecimal valor = new BigDecimal(valorString);
                categoria.setValor(valor);
                categorias.add(categoria);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return categorias;
    }
}
