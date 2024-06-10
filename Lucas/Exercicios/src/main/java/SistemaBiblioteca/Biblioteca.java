package SistemaBiblioteca;

import java.util.ArrayList;
import java.util.List;

public class Biblioteca {
    private List<Livro> livros;

    public Biblioteca(){
        livros = new ArrayList<Livro>();
    }

    public void addLivros(Livro livro){
        livros.add(livro);
    }

    public String listarLivros(){
        StringBuilder sb = new StringBuilder();
        int contador = 1;
        for (Livro livro : livros) {
            sb.append("Livro " + contador + ": ");
            sb.append("\n");
            sb.append(livro.getTitulo());
            sb.append("\n\n");
            contador++;
        }
        return sb.toString();
    }
}
