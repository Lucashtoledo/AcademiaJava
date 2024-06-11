package SistemaDeVendas.entities;

import CalculoImposto.Pessoa;

public class Roupa extends ProdutoBase {

    private String tamanho;
    private String cor;

    public Roupa(String nome, double preco, int quantidade, String tamanho, String cor) {
        super(nome, preco, quantidade);
        this.tamanho = tamanho;
        this.cor = cor;
    }
    public Roupa() {
    }

    public String getTamanho() {
        return tamanho;
    }
    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }
    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getTipo(){
        return "Roupa";
    }

    @Override
    public String exibirDetalhes() {
        return "Nome: " + getNome()
                + ", preço: " + getPreco()
                + ", quantidade: " + getQuantidade()
                + ", tamanho='" + tamanho
                + ", cor='" + cor;
    }
}
