package br.com.henrique.system.data.service;

import br.com.henrique.system.data.repository.ValidaServidorRepository;
import br.com.henrique.system.data.dto.ValidaServidorRequest;
import br.com.henrique.system.data.dto.ValidaServidorResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ValidaServidorService {

    private final ValidaServidorRepository repository;

    public ValidaServidorResponse execute(ValidaServidorRequest servidor) {
        boolean consultaServidor =  repository.validaDadosServidor(
                servidor.getCpf(),
                servidor.getDataNascimento(),
                servidor.getDataIngresso(),
                servidor.getClasse(),
                servidor.getNivel());

        return new ValidaServidorResponse(consultaServidor);
    }
}
