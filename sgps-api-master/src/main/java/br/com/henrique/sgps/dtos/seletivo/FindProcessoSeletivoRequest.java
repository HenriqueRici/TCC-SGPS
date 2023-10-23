package br.com.henrique.sgps.dtos.seletivo;

import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class FindProcessoSeletivoRequest {

    private final String edital;
    private final String cargo;
    private final Integer anoReferencia;
    private final LocalDateTime dataInicioInscricoes;
    private final LocalDateTime dataFimInscricoes;
    private final LocalDateTime dataInicioRetificacao;
    private final LocalDateTime dataFimRetificacao;
    private final String pathPdf;
}
