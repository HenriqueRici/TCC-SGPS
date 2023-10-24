package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.dtos.seletivo.FindResultadoBySeletivoIdResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class FindResultado {
    private final FindProcessoSeletivoById findProcessoSeletivoById;

    public FindResultadoBySeletivoIdResponse execute(Integer id){

        var seletivo = this.findProcessoSeletivoById.execute(id);

        return new FindResultadoBySeletivoIdResponse(seletivo.getResultado());
    }
}
