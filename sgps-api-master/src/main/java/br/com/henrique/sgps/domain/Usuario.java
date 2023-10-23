package br.com.henrique.sgps.domain;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serial;
import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Usuario implements Serializable {
    @Serial
    private static final long serialVersionUID = -1854491521013010482L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private String login;
    @Column
    private String senha;
    @ManyToOne
    @JoinColumn(name = "id_perfil")
    private Perfil perfil;
    @OneToOne(mappedBy = "usuario")
    private Participante participante;
}
