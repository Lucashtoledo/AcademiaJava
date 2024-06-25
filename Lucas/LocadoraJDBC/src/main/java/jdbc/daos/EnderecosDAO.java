package jdbc.daos;

import jdbc.configs.Database;
import jdbc.model.Enderecos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EnderecosDAO {
    public void insert(Enderecos endereco) {
        String sql = "INSERT INTO enderecos (logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            Connection con = Database.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public List<Enderecos> getAll(){
        String sql = "SELECT * FROM enderecos";
        PreparedStatement ps = null;
        List<Enderecos> enderecos = new ArrayList<Enderecos>();
        try{
            ps = Database.con.prepareStatement(sql);
            Enderecos endereco;
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                endereco = new Enderecos();
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setTipo_log(rs.getString("tipo_log"));
                endereco.setComplemento(rs.getString("complemento"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setUf(rs.getString("uf"));
                endereco.setCep(rs.getString("cep"));
                endereco.setNumero(rs.getString("numero"));
                endereco.setBairro(rs.getString("bairro"));
                enderecos.add(endereco);
            }


        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return enderecos;
    }
}
