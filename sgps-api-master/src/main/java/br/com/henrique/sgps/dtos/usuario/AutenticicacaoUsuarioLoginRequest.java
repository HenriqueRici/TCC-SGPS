package br.com.henrique.sgps.dtos.usuario;

import lombok.Value;

@Value
public class AutenticicacaoUsuarioLoginRequest {
    String login;
    String senha;
}
