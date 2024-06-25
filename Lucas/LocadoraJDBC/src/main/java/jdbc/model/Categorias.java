package jdbc.model;

import org.postgresql.util.PGmoney;

import java.math.BigDecimal;

public class Categorias {
    public int cod_cat;
    public String nome;
    public BigDecimal valor;

    public Categorias() {}

    public Categorias(int cod_cat, String nome, BigDecimal valor) {
        this.cod_cat = cod_cat;
        this.nome = nome;
        this.valor = valor;
    }
    public Categorias(String nome, BigDecimal valor) {
        this.nome = nome;
        this.valor = valor;
    }



    public int getCod_cat() {
        return cod_cat;
    }

    public void setCod_cat(int cod_cat) {
        this.cod_cat = cod_cat;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "Categorias{" +
                "cod_cat=" + cod_cat +
                ", nome='" + nome + '\'' +
                ", valor=" + valor +
                '}';
    }
}
