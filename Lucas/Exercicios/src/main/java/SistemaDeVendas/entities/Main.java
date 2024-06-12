package SistemaDeVendas.entities;

public class Main {
    public static void main(String[] args) {
        CarrinhoDeCompras carrinho1 = new CarrinhoDeCompras();
        CarrinhoDeCompras carrinho2 = new CarrinhoDeCompras();

        carrinho1.adicionarItem(new Eletronico("TV", 2300.00, 1, 12));
        carrinho1.adicionarItem(new Roupa("Camisola", 120.00, 2, "M", "Vermelho"));
        carrinho1.adicionarItem(new Alimento("Arroz", 35.90, 3, "04/2025"));

        carrinho2.adicionarItem(new Eletronico("Microondas", 840.00, 1, 12));
        carrinho2.adicionarItem(new Roupa("Calça", 220.00, 2, "M", "Preto"));

        carrinho1.listarItens();
        System.out.println();
        carrinho2.listarItens();

    }

}
