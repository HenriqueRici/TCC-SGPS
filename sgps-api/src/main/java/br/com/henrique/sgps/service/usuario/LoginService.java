package br.com.henrique.sgps.service.usuario;

import br.com.henrique.sgps.configuration.security.UserAuthenticationFacade;
import br.com.henrique.sgps.dtos.usuario.AutenticicacaoUsuarioLoginRequest;
import br.com.henrique.sgps.dtos.usuario.AutenticicacaoUsuarioLoginResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final UserAuthenticationFacade userAuthenticationFacade;
    public AutenticicacaoUsuarioLoginResponse execute(AutenticicacaoUsuarioLoginRequest request) {
        this.userAuthenticationFacade.authenticate(request.getLogin(), request.getSenha());
        var generatedToken = this.userAuthenticationFacade.generateToken(request.getLogin());
        return new AutenticicacaoUsuarioLoginResponse(generatedToken);
    }
}
