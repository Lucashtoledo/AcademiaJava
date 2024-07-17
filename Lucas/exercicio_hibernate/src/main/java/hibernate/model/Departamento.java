package hibernate.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Departamento {
    @Id
    @Column(unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private String nome;
    @OneToMany(mappedBy = "departamento", fetch = FetchType.EAGER)
    private List<Funcionario> funcionario;

    public Departamento(String nome){
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Departamento{" +
                "id=" + id +
                ", nome='" + nome + '\'';

    }
}
