package br.com.henrique.sgps.domain.enuns;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum SituacaoInscricao {

    EM_ANALISE("Em Análise"),
    VALIDA("Valida"),
    INVALIDA("Invalida");

    private final String descricao;
}
