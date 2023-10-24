package br.com.henrique.sgps.dtos.seletivo;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class CreateProcessoSeletivoRequest {


    @NotNull
    @NotBlank
    private final String edital;
    @NotNull
    @NotBlank
    private final String cargo;
    @NotNull
    private final Integer anoReferencia;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataInicioInscricoes;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataFimInscricoes;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataInicioRetificacao;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    private final LocalDateTime dataFimRetificacao;

    private final String pathPdf;


    @JsonCreator
    public CreateProcessoSeletivoRequest(String edital, String cargo, Integer anoReferencia, LocalDateTime dataInicioInscricoes,
                                         LocalDateTime dataFimInscricoes, LocalDateTime dataInicioRetificacao, LocalDateTime dataFimRetificacao, String pathPdf) {
        this.edital = edital;
        this.cargo = cargo;
        this.anoReferencia = anoReferencia;
        this.dataInicioInscricoes = dataInicioInscricoes;
        this.dataFimInscricoes = dataFimInscricoes;
        this.dataInicioRetificacao = dataInicioRetificacao;
        this.dataFimRetificacao = dataFimRetificacao;
        this.pathPdf = pathPdf;
    }
}
