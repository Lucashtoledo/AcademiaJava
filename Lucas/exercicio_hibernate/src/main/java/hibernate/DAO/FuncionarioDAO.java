package hibernate.DAO;

import hibernate.model.Departamento;
import hibernate.model.Funcionario;
import hibernate.util.TransacaoUtil;
import org.hibernate.PropertyValueException;

import java.util.List;

public class FuncionarioDAO {
    List<Funcionario> funcionarios;
    Funcionario funcionario = new Funcionario();
    TransacaoUtil transacaoUtil = new TransacaoUtil();

    public List<Funcionario> getAllFuncionarios() {
        TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
            funcionarios = entityManager.createQuery("select d from Funcionario d", Funcionario.class).getResultList();
        });
        return funcionarios;
    }

    public void addFuncionario(Funcionario funcionario) {
        try {
            TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
                entityManager.persist(funcionario);
            });
        }catch (PropertyValueException e){
            throw new RuntimeException(e);
        }
    }

    public void delete(Funcionario funcionario) {
        TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
            entityManager.remove(funcionario);
        });
    }

    public Funcionario findById(int id) {
        TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
            funcionario = entityManager.find(Funcionario.class, id);
        });
        return funcionario;
    }
}

