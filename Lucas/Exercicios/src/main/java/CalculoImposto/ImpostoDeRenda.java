package CalculoImposto;

public class ImpostoDeRenda {
    private Pessoa pessoa;
    private FaixaImpostoDeRenda faixa;
    public ImpostoDeRenda(Pessoa pessoa) {
        this.pessoa = pessoa;
        faixa = new FaixaImpostoDeRenda(pessoa.getSalario());
    }

    public Double calcular(){
        Double desconto = 0.0;
        Double porcentagem = 0.0;
        Double totalImposto = 0.0;
        switch (faixa.calcularFaixa()){
            case 1:
                desconto = 0.0;
                porcentagem = 0.0;
                break;
            case 2:
                desconto = 158.40;
                porcentagem = 0.075;
                break;
            case 3:
                desconto = 370.40;
                porcentagem = 0.15;
                break;
            case 4:
                desconto = 651.73;
                porcentagem = 0.225;
                break;
            case 5:
                desconto = 884.96;
                porcentagem = 0.275;
                break;
        }
        totalImposto = (pessoa.getSalario() * porcentagem) - desconto;
        return totalImposto;
    }
}
