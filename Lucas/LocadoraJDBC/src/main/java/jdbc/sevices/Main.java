package jdbc.sevices;

import jdbc.configs.Database;
import jdbc.daos.CategoriasDAO;
import jdbc.daos.EnderecosDAO;
import jdbc.model.Categorias;
import jdbc.model.Enderecos;

import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        Database.getConnection();
        CategoriasDAO categoriasDAO = new CategoriasDAO();

        try {
            Categorias categorias = new Categorias();
            for (Categorias categoria : categoriasDAO.getAll()) {
                System.out.println(categoria.toString());
            }
        }catch (RuntimeException re) {
            System.out.println(re.getMessage());
        }
    }
}
