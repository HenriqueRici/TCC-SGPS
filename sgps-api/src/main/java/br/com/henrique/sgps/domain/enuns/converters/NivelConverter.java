package br.com.henrique.sgps.domain.enuns.converters;

import br.com.henrique.sgps.domain.enuns.Nivel;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

import java.util.stream.Stream;

@Converter(autoApply = true)
public class NivelConverter implements AttributeConverter<Nivel, String> {
    @Override
    public String convertToDatabaseColumn(Nivel nivel) {
        if (nivel == null) {
            return null;
        }
        return nivel.getDescricao();
    }

    @Override
    public Nivel convertToEntityAttribute(String descricao) {
        if (descricao == null) {
            return null;
        }

        return Stream.of(Nivel.values())
                .filter(c -> c.getDescricao().equals(descricao))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
