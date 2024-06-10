package CalculoIMC;

public class main  {
    public static void main(String[] args) {
        Paciente paciente1 = new Paciente(80.0, 1.8, "Lucas");
        Paciente paciente2 = new Paciente(70.0, 1.6, "Gabriela");
        Paciente paciente3 = new Paciente(100.0, 1.7, "Rafael");
        System.out.println(paciente1);
        System.out.println(paciente2);
        System.out.println(paciente3);
    }
}
