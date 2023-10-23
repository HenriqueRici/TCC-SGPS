package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.ProcessoSeletivo;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.ParticipanteRepository;
import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class FindProcessoSeletivoById {

    private final ProcessoSeletivoRepository repository;

    public ProcessoSeletivo execute(Integer id) {
        return this.repository.findById(id)
                .orElseThrow(() -> new ObjectNotFoundException("Processo seletivo não encontrado!"));
    }
}
