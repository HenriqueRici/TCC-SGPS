package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.Inscricao;
import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.dtos.seletivo.FindAllParticipanteDetailByEditalResponse;
import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
@AllArgsConstructor
public class FindAllParticipanteByEdital {

    private final ProcessoSeletivoRepository repository;
    public List<Participante> execute(Integer idProcessoSeletivo) {
        Set<Inscricao> inscricoes = this.repository.findAllParticipantesByEdital(idProcessoSeletivo);
        return inscricoes.stream()
                .map(Inscricao::getParticipante)
                .toList();
    }
}
