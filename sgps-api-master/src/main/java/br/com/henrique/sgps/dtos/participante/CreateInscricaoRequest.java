package br.com.henrique.sgps.dtos.participante;

import com.fasterxml.jackson.annotation.JsonCreator;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Getter;
import org.hibernate.validator.constraints.br.CPF;

@Getter
@Builder
public class CreateInscricaoRequest {

    @NotNull
    @NotBlank
    @CPF
    private final String cpf;
    @NotNull
    private final Integer idProcessoSeletivo;

    @JsonCreator
    public CreateInscricaoRequest(String cpf, Integer idProcessoSeletivo) {
        this.cpf = cpf;
        this.idProcessoSeletivo = idProcessoSeletivo;
    }
}
