package CalculoImposto;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        List<Pessoa> pessoas = new ArrayList<>();

        //Recebe os dados das pessoas
        for (int i = 0; i < 2; i++){
            System.out.println("Nome:");
            String nome = sc.nextLine();
            System.out.println("Salario");
            double salario = sc.nextDouble();
            sc.nextLine();
            pessoas.add(new Pessoa(nome, salario));
        }
        //Instancia o imposto de renda por loop recebendo como parâmetro cada pessoa da list
        for (Pessoa p : pessoas){
            ImpostoDeRenda impostoDeRenda = new ImpostoDeRenda(p);
            FaixaImpostoDeRenda faixaImpostoDeRenda = new FaixaImpostoDeRenda(p.getSalario());
            System.out.printf("%s seu salário é R$%.2f, sua faixa de imposto é %d e o valor do imposto de renda a ser pago é R$%.2f", p.getNome(), p.getSalario(), faixaImpostoDeRenda.calcularFaixa(), impostoDeRenda.calcular());
            System.out.println();
        }

    }
}
