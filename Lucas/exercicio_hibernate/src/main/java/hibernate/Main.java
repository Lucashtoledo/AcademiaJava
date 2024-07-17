package hibernate;

import hibernate.DAO.DepartamentoDAO;
import hibernate.DAO.FuncionarioDAO;
import hibernate.model.Departamento;
import hibernate.model.Funcionario;

public class Main {
    public static void main(String[] args) {
        DepartamentoDAO depDAO = new DepartamentoDAO();
        FuncionarioDAO funcDAO = new FuncionarioDAO();
        try {
            for(Funcionario funcionario : funcDAO.getAllFuncionarios()){
                System.out.println(funcionario);
            }
        }catch (RuntimeException e){
            System.out.println(e);
        }


    }
}