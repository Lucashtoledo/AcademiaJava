package jdbc;


import org.postgresql.util.PGmoney;

import java.math.BigDecimal;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        Database.getConnection();
/*
        BigDecimal bd = new BigDecimal(15.5);
        Database.inserirCategoria(new Categorias("Romance", bd));
        System.out.println();
*/
        for(Categorias categoria: Database.getAllCategorias()){
            System.out.println(categoria);
        }
    }
}