package br.com.henrique.sgps.dtos.seletivo;

import br.com.henrique.sgps.domain.ProcessoSeletivo;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Value;

import java.time.LocalDateTime;

@Value
public class FindProcessoSeletivoDetailByIdResponse {

    Integer id;
    String edital;
    String cargo;
    Integer anoReferencia;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    LocalDateTime dataInicioInscricoes;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    LocalDateTime dataFimInscricoes;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    LocalDateTime dataInicioRetificacao;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    LocalDateTime dataFimRetificacao;
    String pathPdf;



    public static FindProcessoSeletivoDetailByIdResponse of(ProcessoSeletivo processoSeletivo) {
        return new FindProcessoSeletivoDetailByIdResponse(
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
