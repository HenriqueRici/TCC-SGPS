package br.com.henrique.sgps.domain;

import br.com.henrique.sgps.domain.enuns.SituacaoInscricao;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Inscricao implements Serializable {
    @Serial
    private static final long serialVersionUID = 6448404483446099118L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_participante")
    private Participante participante;

    @ManyToOne
    @JoinColumn(name = "id_processo_seletivo")
    private ProcessoSeletivo processoSeletivo;

    @Column(name = "data_inscricao")
    private LocalDateTime dataInscricao;

    @Column(name = "situacao_validacao")
    @Enumerated(EnumType.STRING)
    private SituacaoInscricao situacaoInscricao;

    @PrePersist
    private void preCreate(){
        this.dataInscricao = LocalDateTime.now();
        this.situacaoInscricao= SituacaoInscricao.EM_ANALISE;
    }
}
