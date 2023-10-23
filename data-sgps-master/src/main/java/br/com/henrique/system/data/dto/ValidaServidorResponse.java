package br.com.henrique.system.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class ValidaServidorResponse {

    private final boolean verificaServidor;
}
