package br.com.henrique.sgps.dtos.participante;

import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.validator.constraints.br.CPF;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.time.LocalDate;

@Getter
@Builder
public class CreateParticipanteRequest {

    @NotNull
    @NotBlank
    private final String nome;
    @NotNull
    @NotBlank
    @CPF
    private final String cpf;
    @NotNull
    @NotBlank
    private final String confirmacaoCpf;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy")
    private final LocalDate dataNascimento;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy")
    private final LocalDate dataIngresso;
    @NotNull

    private final Classe classe;
    @NotNull
    private final Nivel nivel;
    @NotNull
    @NotBlank
    private final String senha;
    @NotNull
    @NotBlank
    private final String confirmacaoSenha;
    @NotNull
    private final Integer idProcessoSeletivo;


    @JsonCreator
    public CreateParticipanteRequest(String nome, String cpf, String confirmacaoCpf,
                                     LocalDate dataNascimento, LocalDate dataIngresso,
                                     Classe classe, Nivel nivel, String senha, String confirmacaoSenha, Integer idProcessoSeletivo) {


        this.nome = nome;
        this.cpf = cpf;
        this.confirmacaoCpf = confirmacaoCpf;
        this.dataNascimento = dataNascimento;
        this.dataIngresso = dataIngresso;
        this.classe = classe;
        this.nivel = nivel;
        this.senha = senha;
        this.confirmacaoSenha = confirmacaoSenha;
        this.idProcessoSeletivo = idProcessoSeletivo;
    }
}
