package br.com.gaspass.gaspass_api.model.entity;

import lombok.*;
import org.hibernate.Hibernate;
import org.hibernate.annotations.Immutable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Objects;

/**
 * Mapping for DB view
 */
@Entity
@Immutable
@Getter
@Setter
@ToString
@Table(name = "postos_proximos")
public class PostoProximo {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "cidade_id", nullable = false)
    private Integer cidadeId;

    @Column(name = "nome_fantasia", length = 100)
    private String nomeFantasia;

    @Column(name = "razao_social", nullable = false, length = 100)
    private String razaoSocial;

    @Column(name = "nome_exibicao", length = 100)
    private String nomeExibicao;

    @Column(name = "endereco")
    private String endereco;

    @Column(name = "verificado", nullable = false)
    private Integer verificado;

    @Column(name = "rede_posto_id")
    private Integer redePostoId;

    @Column(name = "status")
    private Integer status;

    @Column(name = "logo", length = 45)
    private String logo;

    @Column(name = "moeda", nullable = false, length = 5)
    private String moeda;

    @Column(name = "casas_decimais", nullable = false)
    private Integer casasDecimais;

    @Column(name = "latitude", nullable = false)
    private Double latitude;

    @Column(name = "longitude", nullable = false)
    private Double longitude;

    @Column(name = "p_gasolina")
    private Double pGasolina;

    @Column(name = "gasolina_id")
    private Integer gasolinaId;

    @Column(name = "p_alcool")
    private Double pAlcool;

    @Column(name = "alcool_id")
    private Integer alcoolId;

    @Column(name = "p_diesel")
    private Double pDiesel;

    @Column(name = "diesel_id")
    private Integer dieselId;

    @Column(name = "p_gnv")
    private Double pGnv;

    @Column(name = "gnv_id")
    private Integer gnvId;

    @Column(name = "p_diesel_s10")
    private Double pDieselS10;

    @Column(name = "diesel_s10_id")
    private Integer dieselS10Id;

    @Column(name = "p_gasolina_aditivada")
    private Double pGasolinaAditivada;

    @Column(name = "gasolina_aditivada_id")
    private Integer gasolinaAditivadaId;

    @Column(name = "updated", length = 10)
    private String updated;

    protected PostoProximo() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        PostoProximo that = (PostoProximo) o;
        return id != null && Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}