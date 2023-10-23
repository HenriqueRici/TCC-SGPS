package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.dtos.seletivo.FindAllProcessoSeletivoDetailResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FindAllProcessoSeletivoDetail {

    private final FindAllProcessoSeletivo findAllProcessoSeletivo;

    public List<FindAllProcessoSeletivoDetailResponse> execute() {
        return this.findAllProcessoSeletivo.execute().stream()
                .map(FindAllProcessoSeletivoDetailResponse::of)
                .toList();
    }

}
