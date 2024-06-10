package CalculoIMC;

public class Paciente {
    private String nome;
    private Double peso;
    private Double altura;

    public Paciente(Double peso, Double altura, String nome) {
        this.nome = nome;
        this.peso = peso;
        this.altura = altura;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Paciente(){
    }

    public Double calcularIMC() {
        return peso / (altura*altura);
    }

    public String diagnostico() {
        Double imc = calcularIMC();
        String resposta = "";
        if (imc < 16) {
            resposta = "Baixo preço muito grave";
        }else if (imc >= 16 && imc <= 16.99) {
            resposta = "Baixo peso grave";
        }else if (imc >= 17 && imc <= 18.49) {
            resposta = "Baixo peso";
        }else if (imc >= 18.50 && imc <= 24.99) {
            resposta = "Peso normal";
        }else if (imc >= 25 && imc <= 29.99) {
            resposta = "Sobrepeso";
        }else if (imc >= 30 && imc <= 34.99) {
            resposta = "Obesidade grau I";
        }else if (imc >= 35 && imc < 39.99) {
            resposta = "Obesidade grau II";
        }else if (imc >= 40) {
            resposta = "Obesidade grau III";
        }
        return resposta;
    }

    @Override
    public String toString() {
        return "O diagnóstico do(a) paciente " + nome + " é " + diagnostico() + ", Com " + String.format("%.2f", calcularIMC()) + " de IMC";
    }
}
