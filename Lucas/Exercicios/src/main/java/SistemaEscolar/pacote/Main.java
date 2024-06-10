package SistemaEscolar.pacote;

public class Main {
    public static void main(String[] args) {
        Turma turma1 = new Turma("Turma 1", "T1");
        Turma turma2 = new Turma("Turma 2", "T2");
        Aluno aluno1 = new Aluno("Bob", 23, 001);
        Aluno aluno2 = new Aluno("Jose", 23, 002);
        Aluno aluno3 = new Aluno("Francisco", 23, 003);
        Aluno aluno4 = new Aluno("Michelle", 23, 004);
        Aluno aluno5 = new Aluno("David", 23, 005);

        turma2.addAluno(aluno1);
        turma2.addAluno(aluno2);
        turma2.addAluno(aluno3);
        turma1.addAluno(aluno4);
        turma1.addAluno(aluno5);

        System.out.println("turma 1:");
        System.out.println(turma1.listarAlunos());
        System.out.println("turma 2:");
        System.out.println(turma2.listarAlunos());

    }
}
