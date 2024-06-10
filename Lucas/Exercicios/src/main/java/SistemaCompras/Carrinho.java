package SistemaCompras;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {
    private List<Produto> carrinho;

    public Carrinho() {
        carrinho = new ArrayList<Produto>();
    }

    public void adicionarProduto(Produto produto) {
        carrinho.add(produto);
    }

    public String subTotal(){
        StringBuilder sb = new StringBuilder();
        for (Produto produto : carrinho) {
            sb.append(produto.getNome());
            sb.append("   ");
            sb.append(produto.getPreco());
            sb.append("   ");
            sb.append(produto.getQuantidade());
            sb.append("   ");
            sb.append(String.format("%.2f", produto.getQuantidade() * produto.getPreco()));
            sb.append("\n");
        }
        return sb.toString();
    }

    public Double total(){
        Double soma = 0.0;
        for (Produto produto : carrinho) {
            soma += produto.getPreco() * produto.getQuantidade();
        }
        return soma;
    }
}
