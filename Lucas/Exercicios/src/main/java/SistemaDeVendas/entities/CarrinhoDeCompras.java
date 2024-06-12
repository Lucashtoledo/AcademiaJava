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
        for (Produto produto : itens) {
            System.out.println(produto.exibirDetalhes());
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
    public void gerarArquivoTexto(String nomeArquivo) throws IOException {
        File file = new File(nomeArquivo);

        file.createNewFile();

        FileWriter fw = new FileWriter(file.getAbsoluteFile());

        BufferedWriter bw = new BufferedWriter(fw);

        for (Produto produto : itens) {
            bw.write(produto.exibirDetalhes());
        }
        bw.write(String.format("\nTotal: %.2f", calcularTotal()));
        bw.close();
        System.out.println("Arquivo gerado com sucesso!");
    }
}
