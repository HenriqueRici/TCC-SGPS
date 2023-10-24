package br.com.henrique.sgps.service.perfil;

import br.com.henrique.sgps.domain.Perfil;
import br.com.henrique.sgps.domain.enuns.PerfilEnum;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.PerfilRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindPerfilByNome {

    private final PerfilRepository repository;

    public Perfil execute(PerfilEnum perfilEnum) {
        return this.repository.findPerfilByNome(perfilEnum.name())
                .orElseThrow(() -> new ObjectNotFoundException("Perfil não encontrado!"));
    }
}
