package br.com.henrique.sgps.service.participante;

import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.ParticipanteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindParticipanteByCPF {

    private final ParticipanteRepository repository;

    public Participante execute(String cpf) {
        return this.repository.findByCPF(cpf)
                .orElseThrow(() -> new ObjectNotFoundException("Participante não encontrado para o CPF informado!"));
    }
}
