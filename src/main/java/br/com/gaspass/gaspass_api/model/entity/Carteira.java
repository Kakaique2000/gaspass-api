package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "carteira")
public class Carteira {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "internal_description", length = 512)
    private String internalDescription;

    @Column(name = "transaction", length = 512)
    private String transaction;

    @Column(name = "ticket_id")
    private Integer ticketId;

    @Column(name = "rede_posto_id")
    private Integer redePostoId;

    @Column(name = "comprador_id")
    private Integer compradorId;

    @Column(name = "grupo_usuario_id")
    private Integer grupoUsuarioId;

    @Column(name = "perfil_de_usuario_id")
    private Integer perfilDeUsuarioId;

    @Column(name = "valor", nullable = false)
    private Double valor;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "tipo", nullable = false)
    private CarteiraTipo tipo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "status")
    private CarteiraStatus status;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Lob
    @Column(name = "url")
    private String url;

    @Lob
    @Column(name = "number")
    private String number;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInternalDescription() {
        return internalDescription;
    }

    public void setInternalDescription(String internalDescription) {
        this.internalDescription = internalDescription;
    }

    public String getTransaction() {
        return transaction;
    }

    public void setTransaction(String transaction) {
        this.transaction = transaction;
    }

    public Integer getTicketId() {
        return ticketId;
    }

    public void setTicketId(Integer ticketId) {
        this.ticketId = ticketId;
    }

    public Integer getRedePostoId() {
        return redePostoId;
    }

    public void setRedePostoId(Integer redePostoId) {
        this.redePostoId = redePostoId;
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

    public Integer getPerfilDeUsuarioId() {
        return perfilDeUsuarioId;
    }

    public void setPerfilDeUsuarioId(Integer perfilDeUsuarioId) {
        this.perfilDeUsuarioId = perfilDeUsuarioId;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public CarteiraTipo getTipo() {
        return tipo;
    }

    public void setTipo(CarteiraTipo tipo) {
        this.tipo = tipo;
    }

    public CarteiraStatus getStatus() {
        return status;
    }

    public void setStatus(CarteiraStatus status) {
        this.status = status;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

}