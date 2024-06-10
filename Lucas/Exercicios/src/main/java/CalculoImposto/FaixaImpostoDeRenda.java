package CalculoImposto;

public class FaixaImpostoDeRenda {
    private Double salario;

    public FaixaImpostoDeRenda(Double salario) {
        this.salario = salario;
    }

    public int calcularFaixa() {
        this.salario = salario;
        int faixa = 0;
        if (salario <= 2112.0) {
            faixa = 1;
        }else if (salario > 2500.0 && salario <= 2826.66) {
            faixa = 2;
        }else if (salario > 2826.66 && salario <= 3751.06) {
            faixa = 3;
        }else if (salario > 3751.06 && salario <= 4664.68) {
            faixa = 4;
        }else if (salario > 4664.68) {
            faixa = 5;
        }
        return faixa;
    }

}
