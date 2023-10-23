package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.data.web.dto.ValidaServidorRequest;
import br.com.henrique.sgps.data.web.dto.ValidaServidorResponse;
import br.com.henrique.sgps.data.web.gateway.ProcessoSeletivoGateway;
import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.enuns.SituacaoInscricao;
import br.com.henrique.sgps.repository.InscricaoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class ValidaParticipanteBySeletivoId {

    private final FindAllParticipanteByEdital findAllParticipanteByEdital;

    private final ProcessoSeletivoGateway processoSeletivoGateway;

    private final ChangeSituacaoInscricao changeSituacaoInscricao;

    private final InscricaoRepository inscricaoRepository;

    public void execute(Integer idProcessoSeletivo) {
       var participantes = findAllParticipanteByEdital.execute(idProcessoSeletivo);

        for (Participante participante : participantes) {
            var of = ValidaServidorRequest.of(participante);
            var response = processoSeletivoGateway.execute(of);
            handleInscricao(idProcessoSeletivo, participante.getId(), response);
        }


    }

    private void handleInscricao(Integer idProcessoSeletivo,
                                 Integer idParticipante,
                                 ValidaServidorResponse response) {

        var inscricao = changeSituacaoInscricao.execute(idProcessoSeletivo, idParticipante);
        inscricao.setSituacaoInscricao(
                response.isVerificaServidor()
                        ? SituacaoInscricao.VALIDA
                        : SituacaoInscricao.INVALIDA
        );
        inscricaoRepository.save(inscricao);
    }


}
