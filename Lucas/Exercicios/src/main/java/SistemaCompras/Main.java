package SistemaCompras;

public class Main {
    public static void main(String[] args) {
    Carrinho carrinho = new Carrinho();

    Produto produto1 = new Produto("Calça", 145.99, 2);
    Produto produto2 = new Produto("Tênis", 349.99, 1);
    Produto produto3 = new Produto("Camisa", 98.49, 3);

    carrinho.adicionarProduto(produto1);
    carrinho.adicionarProduto(produto2);
    carrinho.adicionarProduto(produto3);

    System.out.println("Subtotal");
    System.out.printf(carrinho.subTotal());

    System.out.printf("\nTotal: %.2f", carrinho.total());
    }
}
