package br.com.henrique.sgps.dtos.exception;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
public class ErroDto {

    private final String erro;

    private final Boolean success;


    @JsonCreator
    public ErroDto(
            @JsonProperty("erro") final String erro,
            @JsonProperty("success") final Boolean success
    ) {
        this.erro = erro;
        this.success = success;
    }

    public static ErroDto of(final String message) {
        return new ErroDto(
                message,
                false
        );
    }





}