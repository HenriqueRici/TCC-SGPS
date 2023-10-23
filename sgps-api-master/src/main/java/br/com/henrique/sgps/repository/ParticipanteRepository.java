package br.com.henrique.sgps.repository;

import br.com.henrique.sgps.domain.Participante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ParticipanteRepository extends JpaRepository<Participante, Integer> {

    @Query("SELECT obj FROM Participante obj WHERE obj.cpf = :cpf")
    Optional<Participante> findByCPF(@Param("cpf") String cpf);

    boolean existsParticipanteByCpf(String cpf);

    @Query("SELECT case WHEN count(participante.id) > 0 THEN true ELSE false END " +
            "FROM Participante participante " +
            "LEFT JOIN participante.inscricoes inscricoes " +
            "LEFT JOIN inscricoes.processoSeletivo processoSeletivo " +
            "WHERE participante.cpf = :cpf " +
            "AND processoSeletivo.id = :idSeletivo")
    Boolean existsParticipanteByCpfAndEdital(String cpf, Integer idSeletivo);
}
