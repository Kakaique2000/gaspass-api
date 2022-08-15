package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "grupo_usuario")
public class GrupoUsuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "comprador_id", nullable = false)
    private Integer compradorId;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "codigo_indicacao", length = 20)
    private String codigoIndicacao;

    @Lob
    @Column(name = "grupo_usuario_validacao")
    private String grupoUsuarioValidacao;

    @Column(name = "product_name", nullable = false, length = 128)
    private String productName;

    @Column(name = "value_per_year", nullable = false)
    private Double valuePerYear;

    @Column(name = "telefone_contato", length = 50)
    private String telefoneContato;

    @Column(name = "img", length = 512)
    private String img;

    @Column(name = "plan")
    private Integer plan;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Column(name = "exclusivo")
    private Integer exclusivo;

    @Column(name = "status", nullable = false)
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCompradorId() {
        return compradorId;
    }

    public void setCompradorId(Integer compradorId) {
        this.compradorId = compradorId;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCodigoIndicacao() {
        return codigoIndicacao;
    }

    public void setCodigoIndicacao(String codigoIndicacao) {
        this.codigoIndicacao = codigoIndicacao;
    }

    public String getGrupoUsuarioValidacao() {
        return grupoUsuarioValidacao;
    }

    public void setGrupoUsuarioValidacao(String grupoUsuarioValidacao) {
        this.grupoUsuarioValidacao = grupoUsuarioValidacao;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getValuePerYear() {
        return valuePerYear;
    }

    public void setValuePerYear(Double valuePerYear) {
        this.valuePerYear = valuePerYear;
    }

    public String getTelefoneContato() {
        return telefoneContato;
    }

    public void setTelefoneContato(String telefoneContato) {
        this.telefoneContato = telefoneContato;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getPlan() {
        return plan;
    }

    public void setPlan(Integer plan) {
        this.plan = plan;
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

    public Integer getExclusivo() {
        return exclusivo;
    }

    public void setExclusivo(Integer exclusivo) {
        this.exclusivo = exclusivo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}