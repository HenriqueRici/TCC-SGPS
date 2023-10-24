package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import br.com.henrique.sgps.dtos.seletivo.CreateProcessoSeletivoRequest;
import br.com.henrique.sgps.dtos.seletivo.CreateProcessoSeletivoResponse;
import br.com.henrique.sgps.exceptions.DataIntegratyViolationException;
import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CreateProcessoSeletivo {


    private final ProcessoSeletivoRepository processoSeletivoRepository;

    private ExistsProcessoSeletivoByEdital existsProcessoSeletivoByEdital;

    public CreateProcessoSeletivoResponse execute(CreateProcessoSeletivoRequest request) {
        checkIfEditalAlreadyExists(request);

        var processoSeletivo = ProcessoSeletivo.builder()
                .edital(request.getEdital())
                .cargo(request.getCargo())
                .anoReferencia(request.getAnoReferencia())
                .dataInicioInscricoes(request.getDataInicioInscricoes())
                .dataFimInscricoes(request.getDataFimInscricoes())
                .dataInicioRetificacao(request.getDataInicioRetificacao())
                .dataFimRetificacao(request.getDataFimRetificacao())
                .pathPDF(request.getPathPdf())
                .build();
        ProcessoSeletivo savedProcessoSeletivo = processoSeletivoRepository.save(processoSeletivo);
        return CreateProcessoSeletivoResponse.of(savedProcessoSeletivo);
    }

    public void checkIfEditalAlreadyExists(CreateProcessoSeletivoRequest request) {
        if (!this.existsProcessoSeletivoByEdital.execute(request.getEdital())) return;
        throw new DataIntegratyViolationException("Edital já cadastrado na base de dados!");
    }

}
