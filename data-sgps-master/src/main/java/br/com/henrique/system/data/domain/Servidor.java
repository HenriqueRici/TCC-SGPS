package br.com.henrique.system.data.domain;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Servidor {

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
    private String classe;
    @Column
    private String nivel;
}
