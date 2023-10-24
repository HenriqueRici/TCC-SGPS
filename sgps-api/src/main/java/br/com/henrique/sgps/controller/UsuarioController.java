package br.com.henrique.sgps.controller;

import br.com.henrique.sgps.dtos.usuario.AutenticicacaoUsuarioLoginRequest;
import br.com.henrique.sgps.dtos.usuario.AutenticicacaoUsuarioLoginResponse;
import br.com.henrique.sgps.service.usuario.LoginService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/usuarios")
public class UsuarioController {
    private final LoginService loginService;

    @PostMapping("/login")
    public ResponseEntity<AutenticicacaoUsuarioLoginResponse> authenticate(@RequestBody @Valid final AutenticicacaoUsuarioLoginRequest request) {
        final var response = this.loginService.execute(request);
        return ResponseEntity.ok(response);
    }
}
