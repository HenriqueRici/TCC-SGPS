package br.com.henrique.sgps.dtos.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import lombok.Value;

@Value
public class UpdateProcessoSeletivoResponse {

    Integer idParticipante;

    public static UpdateProcessoSeletivoResponse of(ProcessoSeletivo processoSeletivo) {
        return new UpdateProcessoSeletivoResponse(processoSeletivo.getId());
    }
}
