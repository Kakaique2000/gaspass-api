package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "combustivel")
public class Combustivel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nome", nullable = false, length = 18)
    private String nome;

    @Column(name = "nome_anp", nullable = false, length = 18)
    private String nomeAnp;

    @Column(name = "sigla", nullable = false, length = 3)
    private String sigla;

    @Column(name = "cod_anp")
    private Integer codAnp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNomeAnp() {
        return nomeAnp;
    }

    public void setNomeAnp(String nomeAnp) {
        this.nomeAnp = nomeAnp;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public Integer getCodAnp() {
        return codAnp;
    }

    public void setCodAnp(Integer codAnp) {
        this.codAnp = codAnp;
    }

}