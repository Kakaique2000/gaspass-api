package br.com.gaspass.gaspass_api.model.entity;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.time.Instant;
import java.util.Objects;

@Entity
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Table(name = "ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "pacote_ticket_id", nullable = false)
    private Integer pacoteTicketId;

    @Column(name = "desconto", nullable = false)
    private Double desconto;

    @Column(name = "tipo_desconto", nullable = false)
    private Integer tipoDesconto;

    @Column(name = "quantidade", nullable = false)
    private Double quantidade;

    @Column(name = "valor", nullable = false)
    private Double valor;

    @Column(name = "ppl", nullable = false)
    private Double ppl;

    @Column(name = "ppl_corrigido", nullable = false)
    private Double pplCorrigido;

    @Column(name = "valor_corrigido", nullable = false)
    private Double valorCorrigido;

    @Column(name = "valor_desconto", nullable = false)
    private Double valorDesconto;

    @Column(name = "sf_guard_user_id")
    private Integer sfGuardUserId;

    @Column(name = "perfil_de_usuario_id")
    private Integer perfilDeUsuarioId;

    @Column(name = "veiculo_id")
    private Integer veiculoId;

    @Column(name = "combustivel_id", nullable = false)
    private Integer combustivelId;

    @Column(name = "codigo", length = 9)
    private String codigo;

    @Column(name = "posto_id")
    private Integer postoId;

    @Column(name = "rede_posto_id")
    private Integer redePostoId;

    @Column(name = "grupo_usuario_id", nullable = false)
    private Integer grupoUsuarioId;

    @Column(name = "comprador_id", nullable = false)
    private Integer compradorId;

    @Column(name = "notificacao", length = 512)
    private String notificacao;

    @Column(name = "cpf_vendedor", length = 50)
    private String cpfVendedor;

    @Column(name = "payment_token", length = 512)
    private String paymentToken;

    @Column(name = "carteira_id")
    private Integer carteiraId;

    @Column(name = "refund")
    private Integer refund;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Column(name = "valid_until")
    private Instant validUntil;

    @Column(name = "used_at")
    private Instant usedAt;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Ticket ticket = (Ticket) o;
        return id != null && Objects.equals(id, ticket.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}