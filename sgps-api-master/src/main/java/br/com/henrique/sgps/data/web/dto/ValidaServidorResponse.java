package br.com.henrique.sgps.data.web.dto;

import com.fasterxml.jackson.annotation.JsonCreator;

import lombok.Getter;

@Getter
public class ValidaServidorResponse {

    private final boolean verificaServidor;

    @JsonCreator
    public ValidaServidorResponse(boolean verificaServidor) {
        this.verificaServidor = verificaServidor;
    }
}