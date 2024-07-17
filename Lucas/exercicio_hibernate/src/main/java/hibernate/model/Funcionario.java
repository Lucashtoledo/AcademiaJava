package hibernate.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Funcionario {
    @Id //Define coluna como id
    @Column(unique = true, nullable = false) // Define o atributo como uma coluna da tabela
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Gera o valor automático
    private Long id;
    @Column(nullable = false)
    private String nome;
    @Column(nullable = false)
    private String cargo;
    @ManyToOne(fetch = FetchType.EAGER)
    private Departamento departamento;
    @ManyToOne(fetch = FetchType.EAGER)
    private Projeto projeto;

    public Funcionario(String nome, String cargo){
        this.nome = nome;
        this.cargo = cargo;
    }

    @Override
    public String toString() {
        return "Funcionario{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", cargo='" + cargo + '\'' +
                ", departamento=" + departamento +
                ", projeto=" + projeto +
                '}';
    }

}
