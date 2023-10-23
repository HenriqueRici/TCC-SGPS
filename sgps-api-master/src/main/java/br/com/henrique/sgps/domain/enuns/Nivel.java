package br.com.henrique.sgps.domain.enuns;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum Nivel {
    N001(1D, "1"),
    N002(2D, "2"),
    N003(3D, "3"),
    N004(4D, "4"),
    N005(5D, "5"),
    N006(6D, "6"),
    N007(7D, "7"),
    N008(8D, "8"),
    N009(9D, "9"),
    N010(10D, "10"),
    N011(11D, "11"),
    N012(12D, "12");

    private final Double peso;
    private final String descricao;
}
