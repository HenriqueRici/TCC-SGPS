package br.com.henrique.sgps.service.usuario;

import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.Usuario;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindUsuarioByLogin {
    private final UsuarioRepository repository;

    public Usuario execute(String login) {
        return this.repository.findUsuarioByLogin(login)
                .orElseThrow(() -> new ObjectNotFoundException("Usuario não encontrado para o CPF informado!"));
    }
}
