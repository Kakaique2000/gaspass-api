package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "estado")
public class Estado {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "pais_id", nullable = false)
    private Integer paisId;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "nome_anp", nullable = false)
    private String nomeAnp;

    @Column(name = "sigla", length = 30)
    private String sigla;

    @Column(name = "id_ibge")
    private Integer idIbge;

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

    public Integer getIdIbge() {
        return idIbge;
    }

    public void setIdIbge(Integer idIbge) {
        this.idIbge = idIbge;
    }

}