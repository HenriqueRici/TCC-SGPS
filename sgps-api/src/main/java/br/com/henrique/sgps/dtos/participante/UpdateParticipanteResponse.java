package br.com.henrique.sgps.dtos.participante;

import br.com.henrique.sgps.domain.Participante;
import lombok.Value;

@Value
public class UpdateParticipanteResponse {

    Integer idParticipante;

    public static UpdateParticipanteResponse of(Participante participante) {
        return new UpdateParticipanteResponse(participante.getId());
    }
}
