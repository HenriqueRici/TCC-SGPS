package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.Inscricao;
import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.enuns.SituacaoInscricao;
import br.com.henrique.sgps.dtos.seletivo.ResultadoByEdital;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
@AllArgsConstructor
public class GeraResultadoByIdSeletivo {

    private final FindAllParticipanteByEdital findAllParticipanteByEdital;
    public List<ResultadoByEdital> execute(Integer idSeletivo){
        List<Participante> participantes = findParticipantesBySeletivo(idSeletivo);

        List<Participante> participantesValidados = new ArrayList<>();

        for (Participante p : participantes){
           var inscricoes = p.getInscricoes();
           for (Inscricao i: inscricoes){
               if(i.getSituacaoInscricao().equals(SituacaoInscricao.VALIDA)){
                   participantesValidados.add(p);
               }
           }
        }


        return participantesValidados.stream()
              .sorted(Comparator.comparing(Participante::getPontos).reversed()
                      .thenComparing(Comparator.comparing(Participante::getDataIngresso)
                              .thenComparing(Participante::getDataNascimento)))
              .map(ResultadoByEdital::of)
              .toList();
    }


    private List<Participante> findParticipantesBySeletivo(Integer idSeletivo){
        return  findAllParticipanteByEdital.execute(idSeletivo);
    }

}
