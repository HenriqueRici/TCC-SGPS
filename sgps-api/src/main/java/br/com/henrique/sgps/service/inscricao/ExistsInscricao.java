package br.com.henrique.sgps.service.inscricao;

import br.com.henrique.sgps.domain.Inscricao;
import br.com.henrique.sgps.repository.InscricaoRepository;
import br.com.henrique.sgps.repository.ParticipanteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ExistsInscricao {

    private final InscricaoRepository repository;

    public boolean execute(Integer idProcessoSeletivo, String cpf) {
        Optional<Inscricao> maybeInscricao = this.repository.findByProcessoSeletivoAndCpf(idProcessoSeletivo, cpf);
        return maybeInscricao.isPresent();
    }

}

