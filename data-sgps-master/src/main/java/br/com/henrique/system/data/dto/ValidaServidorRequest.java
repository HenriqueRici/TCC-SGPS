package br.com.henrique.system.data.dto;


import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Getter;
import lombok.Value;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.br.CPF;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;


@Value
public class ValidaServidorRequest {


    @NotNull
    @NotBlank
    @CPF
    String cpf;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy")
    LocalDate dataNascimento;
    @NotNull
    @JsonFormat(pattern = "dd/MM/yyyy")
     LocalDate dataIngresso;
    @NotNull
    @NotBlank
    String classe;
    @NotNull
    @NotBlank
    String nivel;

    @JsonCreator
    public ValidaServidorRequest(
            String cpf,
            LocalDate dataNascimento,
            LocalDate dataIngresso,
            String classe,
            String nivel) {
        this.cpf = cpf;
        this.dataNascimento = dataNascimento;
        this.dataIngresso = dataIngresso;
        this.classe = classe;
        this.nivel = nivel;
    }
}
