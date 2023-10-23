package br.com.henrique.sgps.dtos.seletivo;

import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
public class UpdateProcessoSeletivoRequest {

    private final String cargo;
    private final Integer anoReferencia;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataInicioInscricoes;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataFimInscricoes;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataInicioRetificacao;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataFimRetificacao;
    private final String pathPdf;


    @JsonCreator
    public UpdateProcessoSeletivoRequest(
            String cargo,
            Integer anoReferencia,
            LocalDateTime dataInicioInscricoes,
            LocalDateTime dataFimInscricoes,
            LocalDateTime dataInicioRetificacao,
            LocalDateTime dataFimRetificacao,
            String pathPdf
    ) {
        this.cargo = cargo;
        this.anoReferencia = anoReferencia;
        this.dataInicioInscricoes = dataInicioInscricoes;
        this.dataFimInscricoes = dataFimInscricoes;
        this.dataInicioRetificacao = dataInicioRetificacao;
        this.dataFimRetificacao = dataFimRetificacao;
        this.pathPdf = pathPdf;
    }
}
