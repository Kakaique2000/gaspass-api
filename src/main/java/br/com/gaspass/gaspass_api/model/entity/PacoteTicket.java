package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "pacote_ticket")
public class PacoteTicket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "comprador_id", nullable = false)
    private Integer compradorId;

    @Column(name = "grupo_usuario_id", nullable = false)
    private Integer grupoUsuarioId;

    @Column(name = "rede_posto_id", nullable = false)
    private Integer redePostoId;

    @Column(name = "posto_id", nullable = false)
    private Integer postoId;

    @Column(name = "tipo_pacote_ticket_id", nullable = false)
    private Integer tipoPacoteTicketId;

    @Column(name = "pagamento", nullable = false)
    private Integer pagamento;

    @Column(name = "limit_per_user")
    private Integer limitPerUser;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @Column(name = "valid_until")
    private Instant validUntil;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "nome", nullable = false)
    private String nome;

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

    public Integer getGrupoUsuarioId() {
        return grupoUsuarioId;
    }

    public void setGrupoUsuarioId(Integer grupoUsuarioId) {
        this.grupoUsuarioId = grupoUsuarioId;
    }

    public Integer getRedePostoId() {
        return redePostoId;
    }

    public void setRedePostoId(Integer redePostoId) {
        this.redePostoId = redePostoId;
    }

    public Integer getPostoId() {
        return postoId;
    }

    public void setPostoId(Integer postoId) {
        this.postoId = postoId;
    }

    public Integer getTipoPacoteTicketId() {
        return tipoPacoteTicketId;
    }

    public void setTipoPacoteTicketId(Integer tipoPacoteTicketId) {
        this.tipoPacoteTicketId = tipoPacoteTicketId;
    }

    public Integer getPagamento() {
        return pagamento;
    }

    public void setPagamento(Integer pagamento) {
        this.pagamento = pagamento;
    }

    public Integer getLimitPerUser() {
        return limitPerUser;
    }

    public void setLimitPerUser(Integer limitPerUser) {
        this.limitPerUser = limitPerUser;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public Instant getValidUntil() {
        return validUntil;
    }

    public void setValidUntil(Instant validUntil) {
        this.validUntil = validUntil;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}