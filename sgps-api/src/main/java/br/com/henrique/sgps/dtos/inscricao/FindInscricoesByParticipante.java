package br.com.henrique.sgps.dtos.inscricao;

import br.com.henrique.sgps.domain.Inscricao;
import br.com.henrique.sgps.domain.Participante;
import br.com.henrique.sgps.domain.ProcessoSeletivo;
import br.com.henrique.sgps.domain.enuns.SituacaoInscricao;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.Value;

import java.time.LocalDateTime;

@Value
public class FindInscricoesByParticipante {
    Integer id;

    Integer idParticipante;

    Integer idProcessoSeletivo;

    String editalProcessoSeletivo;

    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    LocalDateTime dataInscricao;

    SituacaoInscricao situacaoInscricao;

    public static FindInscricoesByParticipante of(Inscricao inscricao) {
        return new FindInscricoesByParticipante(
                inscricao.getId(),
                inscricao.getParticipante().getId(),
                inscricao.getProcessoSeletivo().getId(),
                inscricao.getProcessoSeletivo().getEdital(),
                inscricao.getDataInscricao(),
                inscricao.getSituacaoInscricao()
        );
    }
}
