package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "rede_posto")
public class RedePosto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "perfil_de_usuario_id", nullable = false)
    private Integer perfilDeUsuarioId;

    @Column(name = "usa_ticket", nullable = false)
    private Integer usaTicket;

    @Column(name = "pais_id", nullable = false)
    private Integer paisId;

    @Column(name = "status")
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getPerfilDeUsuarioId() {
        return perfilDeUsuarioId;
    }

    public void setPerfilDeUsuarioId(Integer perfilDeUsuarioId) {
        this.perfilDeUsuarioId = perfilDeUsuarioId;
    }

    public Integer getUsaTicket() {
        return usaTicket;
    }

    public void setUsaTicket(Integer usaTicket) {
        this.usaTicket = usaTicket;
    }

    public Integer getPaisId() {
        return paisId;
    }

    public void setPaisId(Integer paisId) {
        this.paisId = paisId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}