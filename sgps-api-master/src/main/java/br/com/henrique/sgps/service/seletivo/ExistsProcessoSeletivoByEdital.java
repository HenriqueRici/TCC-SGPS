package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ExistsProcessoSeletivoByEdital {

    private final ProcessoSeletivoRepository repository;

    public boolean execute(String edital) {
        return this.repository.existsProcessoSeletivoByEdital(edital);
    }

}
