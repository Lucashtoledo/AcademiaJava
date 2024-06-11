package SistemaDeVendas.entities;

public abstract class ProdutoBase implements Produto{
    private String nome;
    private double preco;
    private int quantidade;

    public ProdutoBase() {
    }
    public ProdutoBase(String nome, double preco, int quantidade) {
        this.nome = nome;
        this.preco = preco;
        this.quantidade = quantidade;
    }

    @Override
    public String getTipo() {
        return "";
    }

    @Override
    public String getNome() {
        return "";
    }

    @Override
    public double getPreco() {
        return 0;
    }

    @Override
    public void setNome(String nome) {

    }

    @Override
    public void setPreco(double preco) {

    }

    @Override
    public void setQuantidade(int quantidade) {

    }

    @Override
    public int getQuantidade() {
        return 0;
    }

    @Override
    public abstract String exibirDetalhes();
}
