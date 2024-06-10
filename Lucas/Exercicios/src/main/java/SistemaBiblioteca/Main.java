package SistemaBiblioteca;

public class Main {
    public static void main(String[] args) {
        Livro livro1 = new Livro("Orgulho e Preconceito", 1813, "Jane Austen" );
        Livro livro2 = new Livro("Cem Anos de Solidão", 1967, "Gabriel García Márquez");
        Livro livro3 = new Livro("1984", 1949, "George Orwell");

        Biblioteca biblioteca = new Biblioteca();

        biblioteca.addLivros(livro1);
        biblioteca.addLivros(livro2);
        biblioteca.addLivros(livro3);

        System.out.println(biblioteca.listarLivros());

    }
}