package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import br.com.henrique.sgps.dtos.seletivo.UpdateProcessoSeletivoRequest;
import br.com.henrique.sgps.dtos.seletivo.UpdateProcessoSeletivoResponse;
import br.com.henrique.sgps.repository.ProcessoSeletivoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.function.Consumer;
import java.util.function.Supplier;

@Service
@AllArgsConstructor
public class UpdateProcessoSeletivo {


    private final ProcessoSeletivoRepository processoSeletivoRepository;

    private final FindProcessoSeletivoById findProcessoSeletivoById;

    public UpdateProcessoSeletivoResponse execute(Integer id, UpdateProcessoSeletivoRequest request) {

        ProcessoSeletivo processoSeletivo = this.findProcessoSeletivoById.execute(id);
        maybeUpdate(request::getCargo, processoSeletivo::setCargo);
        maybeUpdate(request::getAnoReferencia, processoSeletivo::setAnoReferencia);
        maybeUpdate(request::getDataInicioInscricoes, processoSeletivo::setDataInicioInscricoes);
        maybeUpdate(request::getDataFimInscricoes, processoSeletivo::setDataFimInscricoes);
        maybeUpdate(request::getDataInicioRetificacao, processoSeletivo::setDataInicioRetificacao);
        maybeUpdate(request::getDataFimRetificacao, processoSeletivo::setDataFimRetificacao);
        maybeUpdate(request::getPathPdf, processoSeletivo::setPathPDF);

        ProcessoSeletivo savedProcessoSeletivo = processoSeletivoRepository.save(processoSeletivo);
        return UpdateProcessoSeletivoResponse.of(savedProcessoSeletivo);
    }

    private <T> void maybeUpdate(Supplier<T> supplier, Consumer<T> consumer) {
        T supplierValue = supplier.get();
        if (Objects.isNull(supplierValue)) return;
        consumer.accept(supplierValue);
    }

}
