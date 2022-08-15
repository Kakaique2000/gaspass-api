package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "regiao")
public class Regiao {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "pais_id", nullable = false)
    private Integer paisId;

    @Column(name = "nome", nullable = false, length = 15)
    private String nome;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPaisId() {
        return paisId;
    }

    public void setPaisId(Integer paisId) {
        this.paisId = paisId;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}