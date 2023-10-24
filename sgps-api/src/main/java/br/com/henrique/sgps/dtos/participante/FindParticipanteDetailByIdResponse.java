package br.com.henrique.sgps.dtos.participante;

import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Value;

import java.time.LocalDate;

@Value
public class FindParticipanteDetailByIdResponse {
    Integer id;
    String nome;
    String cpf;
    @JsonFormat(pattern = "dd/MM/yyyy")
    LocalDate dataNascimento;
    @JsonFormat(pattern = "dd/MM/yyyy")
    LocalDate dataIngresso;
    Classe classe;
    Nivel nivel;
    String login;


    public static FindParticipanteDetailByIdResponse of(Participante participante) {
        return new FindParticipanteDetailByIdResponse(
                participante.getId(),
                participante.getNome(),
                participante.getCpf(),
                participante.getDataNascimento(),
                participante.getDataIngresso(),
                participante.getClasse(),
                participante.getNivel(),
                participante.getCpf()

        );
    }
}
