package br.com.gaspass.gaspass_api.domain.ticket;

import br.com.gaspass.gaspass_api.model.entity.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TicketService {

    private final TicketRepository ticketRepository;

    @Autowired
    public TicketService(TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
    }

    public List<TicketDTO> get() {
        return this.ticketRepository
                .findAll()
                .stream()
                .map(this::convert)
                .collect(Collectors.toList());
    }

    public TicketDTO convert(Ticket ticket) {
        return new TicketDTO(
                ticket.getId(),
                ticket.getPacoteTicket(),
                ticket.getDesconto(),
                ticket.getTipoDesconto(),
                ticket.getQuantidade(),
                ticket.getValor(),
                ticket.getPpl(),
                ticket.getPplCorrigido(),
                ticket.getValorCorrigido(),
                ticket.getValorDesconto(),
                ticket.getSfGuardUserId(),
                ticket.getPerfilDeUsuarioId(),
                ticket.getVeiculoId(),
                ticket.getCombustivel(),
                ticket.getCodigo(),
                ticket.getPosto(),
                ticket.getRedePosto(),
                ticket.getGrupoUsuario(),
                ticket.getComprador(),
                ticket.getNotificacao(),
                ticket.getCpfVendedor(),
                ticket.getPaymentToken(),
                ticket.getCarteira(),
                ticket.getRefund(),
                ticket.getStatus(),
                ticket.getCreatedAt(),
                ticket.getUpdatedAt(),
                ticket.getValidUntil(),
                ticket.getUsedAt()
        );
    }
}
