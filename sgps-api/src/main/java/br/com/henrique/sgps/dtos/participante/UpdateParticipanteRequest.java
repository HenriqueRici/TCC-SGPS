package br.com.henrique.sgps.dtos.participante;

import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class UpdateParticipanteRequest {

    private final String nome;
    @JsonFormat(pattern = "dd/MM/yyyy")
    private final LocalDate dataNascimento;
    @JsonFormat(pattern = "dd/MM/yyyy")
    private final LocalDate dataIngresso;
    private final Classe classe;
    private final Nivel nivel;
    private final String senha;


    @JsonCreator
    public UpdateParticipanteRequest(
            String nome,
            LocalDate dataNascimento,
            LocalDate dataIngresso,
            Classe classe,
            Nivel nivel,
            String senha
    ) {
        this.nome = nome;
        this.dataNascimento = dataNascimento;
        this.dataIngresso = dataIngresso;
        this.classe = classe;
        this.nivel = nivel;
        this.senha = senha;
    }
}
