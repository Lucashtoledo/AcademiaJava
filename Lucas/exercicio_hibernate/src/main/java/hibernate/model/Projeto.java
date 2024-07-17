package hibernate.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Projeto {

    @Id
    @Column(name="id", nullable=false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private String nome;
    @OneToMany(mappedBy = "projeto", fetch = FetchType.EAGER)
    private List<Funcionario> funcionario;

    @Override
    public String toString() {
        return "Projeto{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", funcionario=" + funcionario +
                '}';
    }
}
