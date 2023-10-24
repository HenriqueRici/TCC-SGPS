package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.ProcessoSeletivo;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.ParticipanteRepository;
import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindProcessoSeletivoByEdital {

    private final ProcessoSeletivoRepository repository;

    public ProcessoSeletivo execute(String edital) {
        return this.repository.findByEdital(edital)
                .orElseThrow(() -> new ObjectNotFoundException("Processo seletivo não encontrado para o edital informado!"));
    }
}
