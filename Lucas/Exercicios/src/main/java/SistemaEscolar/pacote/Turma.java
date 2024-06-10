package SistemaEscolar.pacote;

import java.util.ArrayList;
import java.util.List;

public class Turma {
    private String nome, codigo;
    private List<Aluno> turma;

    public Turma(String nome, String codigo){
        turma = new ArrayList<Aluno>();
        this.nome = nome;
        this.codigo = codigo;
    }

    public void addAluno(Aluno aluno){
        turma.add(aluno);
    }

    public String listarAlunos(){
        StringBuilder sb = new StringBuilder();
        for(Aluno aluno : turma){
            sb.append(aluno.getNome());
            sb.append("\n");
        }
        return sb.toString();
    }
}
