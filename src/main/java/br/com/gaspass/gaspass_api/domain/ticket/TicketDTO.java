package br.com.gaspass.gaspass_api.domain.ticket;

import br.com.gaspass.gaspass_api.model.entity.*;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.Instant;

@Data
@AllArgsConstructor
public class TicketDTO {

    @JsonProperty("id")
    private Integer id;

    @JsonProperty("pacote_ticket_id")
    private PacoteTicket pacoteTicket;

    @JsonProperty("desconto")
    private Double desconto;

    @JsonProperty("tipo_desconto")
    private Integer tipoDesconto;

    @JsonProperty("quantidade")
    private Double quantidade;

    @JsonProperty("valor")
    private Double valor;

    @JsonProperty("ppl")
    private Double ppl;

    @JsonProperty("ppl_corrigido")
    private Double pplCorrigido;

    @JsonProperty("valor_corrigido")
    private Double valorCorrigido;

    @JsonProperty("valor_desconto")
    private Double valorDesconto;

    @JsonProperty("sf_guard_user_id")
    private Integer sfGuardUserId;

    @JsonProperty("perfil_de_usuario_id")
    private PerfilDeUsuario perfilDeUsuarioId;

    @JsonProperty("veiculo_id")
    private Integer veiculoId;

    @JsonProperty("combustivel_id")
    private Combustivel combustivel;

    @JsonProperty("codigo")
    private String codigo;

    @JsonProperty("posto_id")
    private Posto posto;

    @JsonProperty("rede_posto_id")
    private RedePosto redePosto;

    @JsonProperty("grupo_usuario_id")
    private GrupoUsuario grupoUsuario;

    @JsonProperty("comprador_id")
    private Comprador comprador;

    @JsonProperty("notificacao")
    private String notificacao;

    @JsonProperty("cpf_vendedor")
    private String cpfVendedor;

    @JsonProperty("payment_token")
    private String paymentToken;

    @JsonProperty("carteira_id")
    private Carteira carteira;

    @JsonProperty("refund")
    private Integer refund;

    @JsonProperty("status")
    private Integer status;

    @JsonProperty("created_at")
    private Instant createdAt;

    @JsonProperty("updated_at")
    private Instant updatedAt;

    @JsonProperty("valid_until")
    private Instant validUntil;

    @JsonProperty("used_at")
    private Instant usedAt;

}
