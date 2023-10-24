package br.com.henrique.sgps.domain;

import br.com.henrique.sgps.domain.enuns.Classe;
import br.com.henrique.sgps.domain.enuns.Nivel;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Participante implements Serializable {
    @Serial
    private static final long serialVersionUID = -9134120161347242146L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private String nome;
    @Column
    private String cpf;
    @Column(name = "dt_nascimento")
    private LocalDate dataNascimento;
    @Column(name = "dt_ingresso")
    private LocalDate dataIngresso;
    @Column
    @Enumerated(EnumType.STRING)
    private Classe classe;
    @Column

    private Nivel nivel;
    @OneToOne
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;

    @OneToMany(mappedBy = "participante")
    private Set<Inscricao> inscricoes;

    @Transient
    public Double getPontos() {
        Double pontosClasse = this.getClasse().getPeso();
        Double pontosNivel = this.getNivel().getPeso();

        return pontosClasse + pontosNivel;
    }
}
