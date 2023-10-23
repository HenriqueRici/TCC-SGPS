package br.com.henrique.sgps.dtos.seletivo;

import br.com.henrique.sgps.domain.Participante;
import lombok.Value;

@Value
public class ResultadoByEdital {

    String nome;

    String cpf;

    Double pontuacao;



    public static ResultadoByEdital of(Participante participante){
        return new ResultadoByEdital(participante.getNome(), participante.getCpf(), participante.getPontos());
    }
}
