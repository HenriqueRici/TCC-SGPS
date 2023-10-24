package br.com.henrique.sgps.dtos;

import br.com.henrique.sgps.dtos.participante.CreateParticipanteRequest;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class CreateUsuarioParticipanteRequest {
    private final String login;
    private final String senha;

    public static CreateUsuarioParticipanteRequest of(CreateParticipanteRequest request) {
        return new CreateUsuarioParticipanteRequest(request.getCpf(), request.getSenha());
    }
}
