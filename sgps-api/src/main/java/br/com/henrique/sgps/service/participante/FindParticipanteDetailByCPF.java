package br.com.henrique.sgps.service.participante;


import br.com.henrique.sgps.dtos.participante.FindParticipanteDetailByCPFResponse;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.ParticipanteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindParticipanteDetailByCPF {

    private final ParticipanteRepository repository;
    public FindParticipanteDetailByCPFResponse execute(String cpf) {
        return this.repository.findByCPF(cpf)
                .map(FindParticipanteDetailByCPFResponse::of)
                .orElseThrow(() -> new ObjectNotFoundException("Participante não encontrado para o CPF informado!"));
    }

}
