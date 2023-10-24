package br.com.henrique.sgps.service.seletivo;

import br.com.henrique.sgps.domain.Inscricao;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import br.com.henrique.sgps.repository.InscricaoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ChangeSituacaoInscricao {
   private final InscricaoRepository repository;

   public Inscricao execute(
           Integer idProcessoSeletivo,
           Integer idParticipante){
     return  this.repository.buscaInscricao(idProcessoSeletivo, idParticipante)
             .orElseThrow(() -> new ObjectNotFoundException("Inscrição não encontrada"));

   }
}

