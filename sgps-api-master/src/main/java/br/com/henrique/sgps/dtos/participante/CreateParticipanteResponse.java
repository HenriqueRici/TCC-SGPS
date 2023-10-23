package br.com.henrique.sgps.dtos.participante;

import br.com.henrique.sgps.domain.Participante;
import lombok.Value;

@Value
public class CreateParticipanteResponse {

    Integer idParticipante;

    public static CreateParticipanteResponse of(Participante participante) {
        return new CreateParticipanteResponse(participante.getId());
    }
}
