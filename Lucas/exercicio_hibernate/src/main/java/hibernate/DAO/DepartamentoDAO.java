package hibernate.DAO;

import hibernate.model.Departamento;

import hibernate.util.TransacaoUtil;
import org.hibernate.PropertyValueException;

import java.util.List;

public class DepartamentoDAO {
    List<Departamento> departamentos;
    Departamento departamento = new Departamento();
    TransacaoUtil transacaoUtil = new TransacaoUtil();

    public List<Departamento> getAllDepartamentos() {
        TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
            departamentos = entityManager.createQuery("select d from Departamento d", Departamento.class).getResultList();
        });
        return departamentos;
    }

    public void addDepartamento(Departamento departamento) {
        try {
            TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
                entityManager.persist(departamento);
            });
        }catch (PropertyValueException e){
            throw new RuntimeException(e);
        }

    }

    public void delete(Departamento departamento) {
        TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
            entityManager.remove(departamento);
        });
    }

    public Departamento findById(int id) {
        TransacaoUtil.inSession(transacaoUtil.getFactory(), entityManager -> {
            departamento = entityManager.find(Departamento.class, id);
        });
        return departamento;
    }
}
