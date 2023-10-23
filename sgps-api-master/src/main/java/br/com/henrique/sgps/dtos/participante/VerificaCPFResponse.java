package br.com.henrique.sgps.dtos.participante;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class VerificaCPFResponse {

    private final boolean verificaCPF;

}