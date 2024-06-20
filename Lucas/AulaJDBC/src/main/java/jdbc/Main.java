package jdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        try {
            Database.getConnection();
            System.out.println("Conectado com sucesso.");
        }catch (RuntimeException e){
            System.out.println(e);
        }
/*
        try{
            Database.updatePerson(new Person(1, "Gabriela", "gabi@mail.com") );
        }catch (RuntimeException e){
            System.out.println(e);
        }finally {
            for(Person person : Database.getAllPerson()){
                System.out.println(person);
            }
        }

        try{
            Database.insertPerson(new Person("Gabriela", "gabi@mail.com") );
        }catch (RuntimeException e){
            System.out.println(e);
        }finally {
            for(Person person : Database.getAllPerson()){
                System.out.println(person);
            }
        }

        try{
            Database.deletePerson(5);
        }catch (RuntimeException e){
            System.out.println(e);
        }finally {
            for(Person person : Database.getAllPerson()){
                System.out.println(person);
            }
        }

        try{
            System.out.println(Database.getPerson(10));
        }catch (RuntimeException e){
            System.out.println(e);
            System.out.println();
            for(Person person : Database.getAllPerson()){
                System.out.println(person);
            }
        }


 */
        try {
            Database.disconnect();
            System.out.println("Desconectado com sucesso.");
        }catch (RuntimeException e){
            System.out.println(e);
        }

    }


}