package br.com.henrique.sgps.dtos.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Value;

import java.time.LocalDateTime;

@Value
public class FindAllProcessoSeletivoDetailResponse {
    Integer id;
    String edital;
    String cargo;
    Integer anoReferencia;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    LocalDateTime dataInicioInscricoes;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    LocalDateTime dataFimInscricoes;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    LocalDateTime dataInicioRetificacao;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    LocalDateTime dataFimRetificacao;
    String pathPdf;


    public static FindAllProcessoSeletivoDetailResponse of(ProcessoSeletivo processoSeletivo) {
        return new FindAllProcessoSeletivoDetailResponse(
                processoSeletivo.getId(),
                processoSeletivo.getEdital(),
                processoSeletivo.getCargo(),
                processoSeletivo.getAnoReferencia(),
                processoSeletivo.getDataInicioInscricoes(),
                processoSeletivo.getDataFimInscricoes(),
                processoSeletivo.getDataInicioRetificacao(),
                processoSeletivo.getDataFimRetificacao(),
                processoSeletivo.getPathPDF()
        );
    }
}