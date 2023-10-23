package br.com.henrique.sgps.service.usuario;

import br.com.henrique.sgps.domain.Perfil;
import br.com.henrique.sgps.domain.Usuario;
import br.com.henrique.sgps.domain.enuns.PerfilEnum;
import br.com.henrique.sgps.dtos.CreateUsuarioParticipanteRequest;
import br.com.henrique.sgps.repository.UsuarioRepository;
import br.com.henrique.sgps.service.perfil.FindPerfilByNome;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CreateUsuario {

    private final UsuarioRepository usuarioRepository;

    private final FindPerfilByNome findPerfilByNome;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    public Usuario execute(CreateUsuarioParticipanteRequest request) {

        Usuario usuario = Usuario.builder()
                .login(request.getLogin())
                .senha(passwordEncoder.encode(request.getSenha()))
                .perfil(findPerfilParticipante())
                .build();

        return usuarioRepository.save(usuario);
    }

    private Perfil findPerfilParticipante() {
        return this.findPerfilByNome.execute(PerfilEnum.ROLE_PARTICIPANTE);
    }

}
