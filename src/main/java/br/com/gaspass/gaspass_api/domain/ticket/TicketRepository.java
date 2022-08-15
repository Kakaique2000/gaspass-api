package br.com.gaspass.gaspass_api.domain.ticket;

import br.com.gaspass.gaspass_api.model.entity.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Integer> {
}
