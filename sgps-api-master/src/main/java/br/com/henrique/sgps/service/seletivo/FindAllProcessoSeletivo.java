package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FindAllProcessoSeletivo {

    private final ProcessoSeletivoRepository repository;

    public List<ProcessoSeletivo> execute() {
        return this.repository.findAll();
    }

}
