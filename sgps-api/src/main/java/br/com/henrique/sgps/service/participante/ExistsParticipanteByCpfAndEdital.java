package br.com.henrique.sgps.service.participante;

import br.com.henrique.sgps.exceptions.DataIntegratyViolationException;
import br.com.henrique.sgps.repository.ParticipanteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class ExistsParticipanteByCpfAndEdital {
    private final ParticipanteRepository repository;

    public void execute(String cpf, Integer idSeletivo){
        if (this.repository.existsParticipanteByCpfAndEdital(cpf,idSeletivo)) {
            throw new DataIntegratyViolationException("O CPF informado já consta inscrito nesse Edital!");
        }
    }

}
