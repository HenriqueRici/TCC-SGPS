package br.com.henrique.sgps.dtos.participante;

import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class FindParticipanteRequest {

    private final String nome;
    private final String cpf;
    private final LocalDate dataNascimento;
    private final LocalDate dataIngresso;
    private final Classe classe;
    private final Nivel nivel;

}
