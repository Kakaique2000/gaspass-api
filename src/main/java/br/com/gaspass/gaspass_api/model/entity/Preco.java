package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.Instant;

@Entity
@Table(name = "preco")
public class Preco {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "posto_id", nullable = false)
    private Integer postoId;

    @Column(name = "combustivel_id", nullable = false)
    private Integer combustivelId;

    @Column(name = "preco_compra")
    private Double precoCompra;

    @Column(name = "preco_venda")
    private Double precoVenda;

    @Column(name = "modalidade_compra", length = 3)
    private String modalidadeCompra;

    @Column(name = "editor_id")
    private Integer editorId;

    @Column(name = "perfil_de_usuario_id", nullable = false)
    private Integer perfilDeUsuarioId;

    @Column(name = "data_coleta")
    private Instant dataColeta;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Column(name = "variacao_preco_anterior")
    private Double variacaoPrecoAnterior;

    @Column(name = "positive", nullable = false)
    private Integer positive;

    @Column(name = "negative", nullable = false)
    private Integer negative;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPostoId() {
        return postoId;
    }

    public void setPostoId(Integer postoId) {
        this.postoId = postoId;
    }

    public Integer getCombustivelId() {
        return combustivelId;
    }

    public void setCombustivelId(Integer combustivelId) {
        this.combustivelId = combustivelId;
    }

    public Double getPrecoCompra() {
        return precoCompra;
    }

    public void setPrecoCompra(Double precoCompra) {
        this.precoCompra = precoCompra;
    }

    public Double getPrecoVenda() {
        return precoVenda;
    }

    public void setPrecoVenda(Double precoVenda) {
        this.precoVenda = precoVenda;
    }

    public String getModalidadeCompra() {
        return modalidadeCompra;
    }

    public void setModalidadeCompra(String modalidadeCompra) {
        this.modalidadeCompra = modalidadeCompra;
    }

    public Integer getEditorId() {
        return editorId;
    }

    public void setEditorId(Integer editorId) {
        this.editorId = editorId;
    }

    public Integer getPerfilDeUsuarioId() {
        return perfilDeUsuarioId;
    }

    public void setPerfilDeUsuarioId(Integer perfilDeUsuarioId) {
        this.perfilDeUsuarioId = perfilDeUsuarioId;
    }

    public Instant getDataColeta() {
        return dataColeta;
    }

    public void setDataColeta(Instant dataColeta) {
        this.dataColeta = dataColeta;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Double getVariacaoPrecoAnterior() {
        return variacaoPrecoAnterior;
    }

    public void setVariacaoPrecoAnterior(Double variacaoPrecoAnterior) {
        this.variacaoPrecoAnterior = variacaoPrecoAnterior;
    }

    public Integer getPositive() {
        return positive;
    }

    public void setPositive(Integer positive) {
        this.positive = positive;
    }

    public Integer getNegative() {
        return negative;
    }

    public void setNegative(Integer negative) {
        this.negative = negative;
    }

}