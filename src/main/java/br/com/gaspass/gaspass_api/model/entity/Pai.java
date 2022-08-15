package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pais")
public class Pai {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "codigo_ddi", nullable = false)
    private Integer codigoDdi;

    @Column(name = "codigo_iso", nullable = false)
    private String codigoIso;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "codigo_dinheiro", nullable = false, length = 5)
    private String codigoDinheiro;

    @Column(name = "price_decimal_places", nullable = false)
    private Integer priceDecimalPlaces;

    @Column(name = "status", nullable = false)
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCodigoDdi() {
        return codigoDdi;
    }

    public void setCodigoDdi(Integer codigoDdi) {
        this.codigoDdi = codigoDdi;
    }

    public String getCodigoIso() {
        return codigoIso;
    }

    public void setCodigoIso(String codigoIso) {
        this.codigoIso = codigoIso;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCodigoDinheiro() {
        return codigoDinheiro;
    }

    public void setCodigoDinheiro(String codigoDinheiro) {
        this.codigoDinheiro = codigoDinheiro;
    }

    public Integer getPriceDecimalPlaces() {
        return priceDecimalPlaces;
    }

    public void setPriceDecimalPlaces(Integer priceDecimalPlaces) {
        this.priceDecimalPlaces = priceDecimalPlaces;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}