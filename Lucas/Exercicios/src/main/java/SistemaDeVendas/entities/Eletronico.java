package SistemaDeVendas.entities;

public class Eletronico extends ProdutoBase{

    private int garantiaMeses;

    public Eletronico(String nome, double preco, int quantidade, int garantiaMeses) {
        super(nome, preco, quantidade);
        this.garantiaMeses = garantiaMeses;
    }

    public Eletronico() {
    }

    public int getGarantiaMeses() {
        return garantiaMeses;
    };
    public void setGarantiaMeses(int garantiaMeses) {
        this.garantiaMeses = garantiaMeses;
    }

    public String getTipo(){
        return "Eletronico";
    };

    @Override
    public String exibirDetalhes() {

        return "Nome: " + getNome()
                + ", preço: " + getPreco()
                + ", quantidade: " + getQuantidade()
                + ", Meses de Garantia: " + getGarantiaMeses() +"\n";
    }
}
