package br.com.henrique.sgps.dtos.seletivo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class VerificaCPFByEditalResponse {

    private final boolean verificaCPFByEdital;

}