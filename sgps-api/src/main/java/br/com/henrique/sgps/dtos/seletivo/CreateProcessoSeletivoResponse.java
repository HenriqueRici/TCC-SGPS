package br.com.henrique.sgps.dtos.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import lombok.Value;

@Value
public class CreateProcessoSeletivoResponse {

    Integer idProcessoSeletivo;

    public static CreateProcessoSeletivoResponse of(ProcessoSeletivo processoSeletivo) {
        return new CreateProcessoSeletivoResponse(processoSeletivo.getId());
    }
}
