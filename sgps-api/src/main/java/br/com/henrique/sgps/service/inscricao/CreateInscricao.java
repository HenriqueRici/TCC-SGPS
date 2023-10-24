package br.com.henrique.sgps.service.inscricao;

import br.com.henrique.sgps.domain.Inscricao;
import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.enuns.SituacaoInscricao;
import br.com.henrique.sgps.exceptions.DataIntegratyViolationException;
import br.com.henrique.sgps.repository.InscricaoRepository;
import br.com.henrique.sgps.service.seletivo.FindProcessoSeletivoById;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@AllArgsConstructor
public class CreateInscricao {

    private final InscricaoRepository inscricaoRepository;
    private final ExistsInscricao existsInscricao;
    private final FindProcessoSeletivoById findProcessoSeletivoById;

    public Inscricao execute(Integer idProcessoSeletivo, Participante participante) {
        checkIfCpfAlreadyExistsInEdital(idProcessoSeletivo, participante);

        var inscricao = Inscricao.builder()
                .participante(participante)
                .processoSeletivo(findProcessoSeletivoById.execute(idProcessoSeletivo))
                .dataInscricao(LocalDateTime.now())
                .situacaoInscricao(SituacaoInscricao.EM_ANALISE)
                .build();
        Inscricao savedInscricao = inscricaoRepository.save(inscricao);
        return savedInscricao;
    }

    public void checkIfCpfAlreadyExistsInEdital(Integer idProcessoSeletivo, Participante participante) {
        if (!this.existsInscricao.execute(
                idProcessoSeletivo, participante.getCpf())) return;
        throw new DataIntegratyViolationException("CPF já cadastrado no Edital escolhido!");
    }
}
