package br.com.henrique.sgps.service.participante;

import br.com.henrique.sgps.dtos.participante.VerificaCPFResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class VerificaCPF {

    private final ExistsParticipanteByCPF existsParticipanteByCPF;
    public VerificaCPFResponse execute(String cpf){
        boolean consultaCPF = existsParticipanteByCPF.execute(cpf);
        return new VerificaCPFResponse(consultaCPF);
    }
}
