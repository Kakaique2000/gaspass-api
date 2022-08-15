package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cidade")
public class Cidade {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "nome_anp", nullable = false)
    private String nomeAnp;

    @Column(name = "tem_coleta_anp", nullable = false)
    private Boolean temColetaAnp = false;

    @Column(name = "cod_anp")
    private Integer codAnp;

    @Column(name = "id_ibge")
    private Integer idIbge;

    @Column(name = "capital", nullable = false)
    private Boolean capital = false;

    @Column(name = "total_habitantes")
    private Long totalHabitantes;

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

    public Boolean getTemColetaAnp() {
        return temColetaAnp;
    }

    public void setTemColetaAnp(Boolean temColetaAnp) {
        this.temColetaAnp = temColetaAnp;
    }

    public Integer getCodAnp() {
        return codAnp;
    }

    public void setCodAnp(Integer codAnp) {
        this.codAnp = codAnp;
    }

    public Integer getIdIbge() {
        return idIbge;
    }

    public void setIdIbge(Integer idIbge) {
        this.idIbge = idIbge;
    }

    public Boolean getCapital() {
        return capital;
    }

    public void setCapital(Boolean capital) {
        this.capital = capital;
    }

    public Long getTotalHabitantes() {
        return totalHabitantes;
    }

    public void setTotalHabitantes(Long totalHabitantes) {
        this.totalHabitantes = totalHabitantes;
    }

}