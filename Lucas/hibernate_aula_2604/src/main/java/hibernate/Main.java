package hibernate;

import hibernate.DAO.DepartamentoDAO;
import hibernate.DAO.FuncionarioDAO;
import hibernate.model.Departamento;
import hibernate.model.Funcionario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.cfg.Configuration;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        FuncionarioDAO dao = new FuncionarioDAO();
        for (Funcionario funcionario : dao.findAll()) {
            System.out.println(funcionario);
        }
    }
}