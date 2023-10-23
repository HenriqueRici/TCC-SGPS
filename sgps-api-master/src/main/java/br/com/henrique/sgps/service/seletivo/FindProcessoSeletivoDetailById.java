package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.dtos.seletivo.FindProcessoSeletivoDetailByIdResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindProcessoSeletivoDetailById {

    private final FindProcessoSeletivoById findProcessoSeletivoById;

    public FindProcessoSeletivoDetailByIdResponse execute(Integer id) {
        return FindProcessoSeletivoDetailByIdResponse.of(this.findProcessoSeletivoById.execute(id));
    }
}
