package br.com.henrique.sgps.service.participante;

import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.ParticipanteRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class FindParticipanteById {

    private final ParticipanteRepository repository;

    public Participante execute(Integer id) {
        return this.repository.findById(id)
                .orElseThrow(() -> new ObjectNotFoundException("Participante não encontrado!"));
    }
}
