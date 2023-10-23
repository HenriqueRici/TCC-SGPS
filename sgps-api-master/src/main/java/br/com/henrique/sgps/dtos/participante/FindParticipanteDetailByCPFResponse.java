package br.com.henrique.sgps.dtos.participante;


import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import br.com.henrique.sgps.dtos.inscricao.FindInscricoesByParticipante;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Value;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;


@Value
public class FindParticipanteDetailByCPFResponse {
    Integer id;
    String nome;
    String cpf;
    @JsonFormat(pattern = "dd/MM/yyyy")
    LocalDate dataNascimento;
    @JsonFormat(pattern = "dd/MM/yyyy")
    LocalDate dataIngresso;
    Classe classe;
    String nivel;


    List<FindInscricoesByParticipante> inscricaos;

        public static FindParticipanteDetailByCPFResponse of(Participante participante) {
        return new FindParticipanteDetailByCPFResponse(
                participante.getId(),
                participante.getNome(),
                participante.getCpf(),
                participante.getDataNascimento(),
                participante.getDataIngresso(),
                participante.getClasse(),
                participante.getNivel().getDescricao(),
                participante.getInscricoes().stream().map(FindInscricoesByParticipante::of).collect(Collectors.toList())
        );
    }
}
