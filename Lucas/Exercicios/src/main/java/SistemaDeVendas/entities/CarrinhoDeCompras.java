package SistemaDeVendas.entities;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CarrinhoDeCompras {
    private List<Produto> itens;
    public CarrinhoDeCompras() {
        itens = new ArrayList<Produto>();
    }
    public void adicionarItem(Produto produto) {
        itens.add(produto);
    }
    public void removerItem(Produto produto) {
        itens.remove(produto);
    }

    public void listarItens(){
        int count = 0;
        System.out.println("item:     Qtd:     nome:     Preço:     SubTotal:");
        for (Produto produto : itens) {
            count ++;
            System.out.printf("%d          %d       %s     %.2f      %.2f\n", count, produto.getQuantidade(), produto.getNome(),  produto.getPreco(), produto.getQuantidade() * produto.getPreco());
        }
    }

    public List<Produto> exportarListaProdutos(){
        return itens;
    }

    public double calcularTotal(){
        double total = 0;
        for (Produto produto : itens) {
            total += produto.getPreco();
        }
        return total;
    }
    public void gerarArquivoTexto(String nomeArquivo) {

        try(BufferedWriter bw = new BufferedWriter(new FileWriter(nomeArquivo))){
            for (Produto produto : itens) {
                bw.write(produto.exibirDetalhes());
            }

        } catch (IOException e) {
            System.out.println("Erro" + e.getMessage() + "ao gerar arquivo " + nomeArquivo);
        }
        System.out.println("Arquivo gerado com sucesso!");

    }
}
