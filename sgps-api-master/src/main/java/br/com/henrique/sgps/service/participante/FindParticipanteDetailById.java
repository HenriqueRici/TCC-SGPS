package br.com.henrique.sgps.service.participante;

import br.com.henrique.sgps.dtos.participante.FindParticipanteDetailByIdResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindParticipanteDetailById {

    private final FindParticipanteById findParticipanteById;

    public FindParticipanteDetailByIdResponse execute(Integer id) {
        return FindParticipanteDetailByIdResponse.of(this.findParticipanteById.execute(id));
    }
}
