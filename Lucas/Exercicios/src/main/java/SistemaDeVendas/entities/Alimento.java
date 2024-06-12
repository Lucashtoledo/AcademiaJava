package SistemaDeVendas.entities;

public class Alimento extends ProdutoBase{

    private String dataValidade;

    public Alimento() {
    }

    public Alimento(String nome, double preco, int quantidade, String dataValidade) {
        super(nome, preco, quantidade);
        this.dataValidade = dataValidade;
    }

    public String getDataValidade() {
        return dataValidade;
    }
    public void setDataValidade(String dataValidade) {
        this.dataValidade = dataValidade;
    }
    public String getTipo(){
        return "Alimento";
    }

    @Override
    public String exibirDetalhes() {
        return "Nome: " + getNome()
                + ", preço: " + getPreco()
                + ", quantidade: " + getQuantidade()
                + ", data de validade= " + dataValidade;
    }
}
