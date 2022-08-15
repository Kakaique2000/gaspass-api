package br.com.gaspass.gaspass_api.model.entity;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "perfil_de_usuario")
public class PerfilDeUsuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "sf_guard_user_id", nullable = false)
    private Integer sfGuardUserId;

    @Column(name = "nome", length = 50)
    private String nome;

    @Column(name = "email", nullable = false, length = 50)
    private String email;

    @Column(name = "telefone", length = 15)
    private String telefone;

    @Column(name = "cpf", length = 20)
    private String cpf;

    @Column(name = "data_nascimento", length = 15)
    private String dataNascimento;

    @Column(name = "endereco")
    private String endereco;

    @Column(name = "bairro")
    private String bairro;

    @Column(name = "cep")
    private Integer cep;

    @Column(name = "complemento", length = 100)
    private String complemento;

    @Column(name = "numero", length = 20)
    private String numero;

    @Column(name = "cidade_id")
    private Integer cidadeId;

    @Column(name = "local_favorito")
    private Integer localFavorito;

    @Column(name = "postos_favoritos", length = 110)
    private String postosFavoritos;

    @Column(name = "username", nullable = false, length = 128)
    private String username;

    @Column(name = "password", nullable = false, length = 128)
    private String password;

    @Column(name = "fcm_token", length = 512)
    private String fcmToken;

    @Column(name = "uuid_firebase")
    private String uuidFirebase;

    @Column(name = "user_token", length = 1024)
    private String userToken;

    @Column(name = "salt", length = 128)
    private String salt;

    @Column(name = "last_login", nullable = false)
    private Instant lastLogin;

    @Column(name = "lat")
    private Double lat;

    @Column(name = "lng")
    private Double lng;

    @Column(name = "mundipagg_customer_id")
    private String mundipaggCustomerId;

    @Column(name = "webgestor_url")
    private String webgestorUrl;

    @Column(name = "webgestor_token", length = 128)
    private String webgestorToken;

    @Column(name = "webgestor_user")
    private String webgestorUser;

    @Column(name = "webgestor_pass")
    private String webgestorPass;

    @Column(name = "cod_cadastro", length = 512)
    private String codCadastro;

    @Column(name = "app_version", length = 10)
    private String appVersion;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "posto_id")
    private Integer postoId;

    @Column(name = "cod_indicacao")
    private String codIndicacao;

    @Column(name = "id_indicou")
    private Integer idIndicou;

    @Column(name = "grupo_selecionado", nullable = false)
    private Integer grupoSelecionado;

    @Column(name = "b2b_cliente_id")
    private Integer b2bClienteId;

    @Column(name = "b2b_distribuidora_id")
    private Integer b2bDistribuidoraId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSfGuardUserId() {
        return sfGuardUserId;
    }

    public void setSfGuardUserId(Integer sfGuardUserId) {
        this.sfGuardUserId = sfGuardUserId;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public Integer getCep() {
        return cep;
    }

    public void setCep(Integer cep) {
        this.cep = cep;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Integer getCidadeId() {
        return cidadeId;
    }

    public void setCidadeId(Integer cidadeId) {
        this.cidadeId = cidadeId;
    }

    public Integer getLocalFavorito() {
        return localFavorito;
    }

    public void setLocalFavorito(Integer localFavorito) {
        this.localFavorito = localFavorito;
    }

    public String getPostosFavoritos() {
        return postosFavoritos;
    }

    public void setPostosFavoritos(String postosFavoritos) {
        this.postosFavoritos = postosFavoritos;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFcmToken() {
        return fcmToken;
    }

    public void setFcmToken(String fcmToken) {
        this.fcmToken = fcmToken;
    }

    public String getUuidFirebase() {
        return uuidFirebase;
    }

    public void setUuidFirebase(String uuidFirebase) {
        this.uuidFirebase = uuidFirebase;
    }

    public String getUserToken() {
        return userToken;
    }

    public void setUserToken(String userToken) {
        this.userToken = userToken;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Instant getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Instant lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public String getMundipaggCustomerId() {
        return mundipaggCustomerId;
    }

    public void setMundipaggCustomerId(String mundipaggCustomerId) {
        this.mundipaggCustomerId = mundipaggCustomerId;
    }

    public String getWebgestorUrl() {
        return webgestorUrl;
    }

    public void setWebgestorUrl(String webgestorUrl) {
        this.webgestorUrl = webgestorUrl;
    }

    public String getWebgestorToken() {
        return webgestorToken;
    }

    public void setWebgestorToken(String webgestorToken) {
        this.webgestorToken = webgestorToken;
    }

    public String getWebgestorUser() {
        return webgestorUser;
    }

    public void setWebgestorUser(String webgestorUser) {
        this.webgestorUser = webgestorUser;
    }

    public String getWebgestorPass() {
        return webgestorPass;
    }

    public void setWebgestorPass(String webgestorPass) {
        this.webgestorPass = webgestorPass;
    }

    public String getCodCadastro() {
        return codCadastro;
    }

    public void setCodCadastro(String codCadastro) {
        this.codCadastro = codCadastro;
    }

    public String getAppVersion() {
        return appVersion;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPostoId() {
        return postoId;
    }

    public void setPostoId(Integer postoId) {
        this.postoId = postoId;
    }

    public String getCodIndicacao() {
        return codIndicacao;
    }

    public void setCodIndicacao(String codIndicacao) {
        this.codIndicacao = codIndicacao;
    }

    public Integer getIdIndicou() {
        return idIndicou;
    }

    public void setIdIndicou(Integer idIndicou) {
        this.idIndicou = idIndicou;
    }

    public Integer getGrupoSelecionado() {
        return grupoSelecionado;
    }

    public void setGrupoSelecionado(Integer grupoSelecionado) {
        this.grupoSelecionado = grupoSelecionado;
    }

    public Integer getB2bClienteId() {
        return b2bClienteId;
    }

    public void setB2bClienteId(Integer b2bClienteId) {
        this.b2bClienteId = b2bClienteId;
    }

    public Integer getB2bDistribuidoraId() {
        return b2bDistribuidoraId;
    }

    public void setB2bDistribuidoraId(Integer b2bDistribuidoraId) {
        this.b2bDistribuidoraId = b2bDistribuidoraId;
    }

}