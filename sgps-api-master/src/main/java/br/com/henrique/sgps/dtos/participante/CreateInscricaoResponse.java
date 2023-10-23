package br.com.henrique.sgps.dtos.participante;

import br.com.henrique.sgps.domain.Inscricao;
import lombok.Value;

@Value
public class CreateInscricaoResponse {

    Integer idInscricao;

    public static CreateInscricaoResponse of(Inscricao inscricao) {
        return new CreateInscricaoResponse(inscricao.getId());
    }
}
