package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "posto")
public class Posto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "bairro_id")
    private Integer bairroId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "cidade_id", nullable = false)
    private Cidade cidade;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "estado_id", nullable = false)
    private Estado estado;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "pais_id", nullable = false)
    private Pai pais;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "regiao_id", nullable = false)
    private Regiao regiao;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "bandeira_id", nullable = false)
    private Bandeira bandeira;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "geocode_id")
    private Geocode geocode;

    @Column(name = "lat_lng_original", length = 100)
    private String latLngOriginal;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bandeira_fornecedor_id")
    private Bandeira bandeiraFornecedor;

    @Column(name = "rede_posto_id")
    private Integer redePostoId;

    @Column(name = "razao_social", nullable = false, length = 100)
    private String razaoSocial;

    @Column(name = "razao_social_anp", length = 100)
    private String razaoSocialAnp;

    @Column(name = "telefone")
    private String telefone;

    @Column(name = "endereco")
    private String endereco;

    @Column(name = "endereco_anp")
    private String enderecoAnp;

    @Column(name = "cep", length = 9)
    private String cep;

    @Column(name = "ultimo_preco_gasolina")
    private Double ultimoPrecoGasolina;

    @Column(name = "ultimo_preco_alcool")
    private Double ultimoPrecoAlcool;

    @Column(name = "ultimo_preco_diesel")
    private Double ultimoPrecoDiesel;

    @Column(name = "ultimo_preco_gnv")
    private Double ultimoPrecoGnv;

    @Column(name = "cnpj", length = 18)
    private String cnpj;

    @Column(name = "nome_fantasia", length = 100)
    private String nomeFantasia;

    @Column(name = "nome_fantasia_anp", length = 100)
    private String nomeFantasiaAnp;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "preco_gasolina_id")
    private Preco precoGasolina;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "preco_alcool_id")
    private Preco precoAlcool;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "preco_diesel_id")
    private Preco precoDiesel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "preco_gnv_id")
    private Preco precoGnv;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ultimo_editor_id")
    private SfGuardUser ultimoEditor;

    @Column(name = "parceiro_id")
    private Integer parceiroId;

    @Column(name = "perfil_de_usuario_id", nullable = false)
    private Integer perfilDeUsuarioId;

    @Column(name = "data_preco_mais_recente")
    private Instant dataPrecoMaisRecente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "preco_diesel_s10_id")
    private Preco precoDieselS10;

    @Column(name = "ultimo_preco_diesel_s10")
    private Double ultimoPrecoDieselS10;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "preco_gasolina_adt_id")
    private Preco precoGasolinaAdt;

    @Column(name = "ultimo_preco_gasolina_adt")
    private Double ultimoPrecoGasolinaAdt;

    @Column(name = "disponibilidade_combustivel", nullable = false)
    private Integer disponibilidadeCombustivel;

    @Column(name = "status")
    private Integer status;

    @Column(name = "verificado", nullable = false)
    private Integer verificado;

    @Column(name = "place_id")
    private String placeId;

    @Column(name = "anp_id")
    private Integer anpId;

    @Column(name = "created_at")
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Column(name = "link_maps", length = 1024)
    private String linkMaps;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBairroId() {
        return bairroId;
    }

    public void setBairroId(Integer bairroId) {
        this.bairroId = bairroId;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Pai getPais() {
        return pais;
    }

    public void setPais(Pai pais) {
        this.pais = pais;
    }

    public Regiao getRegiao() {
        return regiao;
    }

    public void setRegiao(Regiao regiao) {
        this.regiao = regiao;
    }

    public Bandeira getBandeira() {
        return bandeira;
    }

    public void setBandeira(Bandeira bandeira) {
        this.bandeira = bandeira;
    }

    public Geocode getGeocode() {
        return geocode;
    }

    public void setGeocode(Geocode geocode) {
        this.geocode = geocode;
    }

    public String getLatLngOriginal() {
        return latLngOriginal;
    }

    public void setLatLngOriginal(String latLngOriginal) {
        this.latLngOriginal = latLngOriginal;
    }

    public Bandeira getBandeiraFornecedor() {
        return bandeiraFornecedor;
    }

    public void setBandeiraFornecedor(Bandeira bandeiraFornecedor) {
        this.bandeiraFornecedor = bandeiraFornecedor;
    }

    public Integer getRedePostoId() {
        return redePostoId;
    }

    public void setRedePostoId(Integer redePostoId) {
        this.redePostoId = redePostoId;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getRazaoSocialAnp() {
        return razaoSocialAnp;
    }

    public void setRazaoSocialAnp(String razaoSocialAnp) {
        this.razaoSocialAnp = razaoSocialAnp;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getEnderecoAnp() {
        return enderecoAnp;
    }

    public void setEnderecoAnp(String enderecoAnp) {
        this.enderecoAnp = enderecoAnp;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public Double getUltimoPrecoGasolina() {
        return ultimoPrecoGasolina;
    }

    public void setUltimoPrecoGasolina(Double ultimoPrecoGasolina) {
        this.ultimoPrecoGasolina = ultimoPrecoGasolina;
    }

    public Double getUltimoPrecoAlcool() {
        return ultimoPrecoAlcool;
    }

    public void setUltimoPrecoAlcool(Double ultimoPrecoAlcool) {
        this.ultimoPrecoAlcool = ultimoPrecoAlcool;
    }

    public Double getUltimoPrecoDiesel() {
        return ultimoPrecoDiesel;
    }

    public void setUltimoPrecoDiesel(Double ultimoPrecoDiesel) {
        this.ultimoPrecoDiesel = ultimoPrecoDiesel;
    }

    public Double getUltimoPrecoGnv() {
        return ultimoPrecoGnv;
    }

    public void setUltimoPrecoGnv(Double ultimoPrecoGnv) {
        this.ultimoPrecoGnv = ultimoPrecoGnv;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getNomeFantasia() {
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia) {
        this.nomeFantasia = nomeFantasia;
    }

    public String getNomeFantasiaAnp() {
        return nomeFantasiaAnp;
    }

    public void setNomeFantasiaAnp(String nomeFantasiaAnp) {
        this.nomeFantasiaAnp = nomeFantasiaAnp;
    }

    public Preco getPrecoGasolina() {
        return precoGasolina;
    }

    public void setPrecoGasolina(Preco precoGasolina) {
        this.precoGasolina = precoGasolina;
    }

    public Preco getPrecoAlcool() {
        return precoAlcool;
    }

    public void setPrecoAlcool(Preco precoAlcool) {
        this.precoAlcool = precoAlcool;
    }

    public Preco getPrecoDiesel() {
        return precoDiesel;
    }

    public void setPrecoDiesel(Preco precoDiesel) {
        this.precoDiesel = precoDiesel;
    }

    public Preco getPrecoGnv() {
        return precoGnv;
    }

    public void setPrecoGnv(Preco precoGnv) {
        this.precoGnv = precoGnv;
    }

    public SfGuardUser getUltimoEditor() {
        return ultimoEditor;
    }

    public void setUltimoEditor(SfGuardUser ultimoEditor) {
        this.ultimoEditor = ultimoEditor;
    }

    public Integer getParceiroId() {
        return parceiroId;
    }

    public void setParceiroId(Integer parceiroId) {
        this.parceiroId = parceiroId;
    }

    public Integer getPerfilDeUsuarioId() {
        return perfilDeUsuarioId;
    }

    public void setPerfilDeUsuarioId(Integer perfilDeUsuarioId) {
        this.perfilDeUsuarioId = perfilDeUsuarioId;
    }

    public Instant getDataPrecoMaisRecente() {
        return dataPrecoMaisRecente;
    }

    public void setDataPrecoMaisRecente(Instant dataPrecoMaisRecente) {
        this.dataPrecoMaisRecente = dataPrecoMaisRecente;
    }

    public Preco getPrecoDieselS10() {
        return precoDieselS10;
    }

    public void setPrecoDieselS10(Preco precoDieselS10) {
        this.precoDieselS10 = precoDieselS10;
    }

    public Double getUltimoPrecoDieselS10() {
        return ultimoPrecoDieselS10;
    }

    public void setUltimoPrecoDieselS10(Double ultimoPrecoDieselS10) {
        this.ultimoPrecoDieselS10 = ultimoPrecoDieselS10;
    }

    public Preco getPrecoGasolinaAdt() {
        return precoGasolinaAdt;
    }

    public void setPrecoGasolinaAdt(Preco precoGasolinaAdt) {
        this.precoGasolinaAdt = precoGasolinaAdt;
    }

    public Double getUltimoPrecoGasolinaAdt() {
        return ultimoPrecoGasolinaAdt;
    }

    public void setUltimoPrecoGasolinaAdt(Double ultimoPrecoGasolinaAdt) {
        this.ultimoPrecoGasolinaAdt = ultimoPrecoGasolinaAdt;
    }

    public Integer getDisponibilidadeCombustivel() {
        return disponibilidadeCombustivel;
    }

    public void setDisponibilidadeCombustivel(Integer disponibilidadeCombustivel) {
        this.disponibilidadeCombustivel = disponibilidadeCombustivel;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getVerificado() {
        return verificado;
    }

    public void setVerificado(Integer verificado) {
        this.verificado = verificado;
    }

    public String getPlaceId() {
        return placeId;
    }

    public void setPlaceId(String placeId) {
        this.placeId = placeId;
    }

    public Integer getAnpId() {
        return anpId;
    }

    public void setAnpId(Integer anpId) {
        this.anpId = anpId;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getLinkMaps() {
        return linkMaps;
    }

    public void setLinkMaps(String linkMaps) {
        this.linkMaps = linkMaps;
    }

}