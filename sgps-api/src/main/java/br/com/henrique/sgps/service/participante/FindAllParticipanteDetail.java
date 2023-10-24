package br.com.henrique.sgps.service.participante;

import br.com.henrique.sgps.dtos.participante.FindAllParticipanteDetailResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FindAllParticipanteDetail {

    private final FindAllParticipante findAllParticipante;

    public List<FindAllParticipanteDetailResponse> execute() {
        return this.findAllParticipante.execute().stream()
                .map(FindAllParticipanteDetailResponse::of)
                .toList();
    }

}
