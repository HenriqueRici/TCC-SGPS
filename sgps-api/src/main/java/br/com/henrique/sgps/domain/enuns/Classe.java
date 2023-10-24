package br.com.henrique.sgps.domain.enuns;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum Classe {
    A(100D),
    B(200D),
    C(300D),
    D(400D),
    E(500D);

    private final Double peso;
}
