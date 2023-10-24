package br.com.henrique.sgps.repository;

import br.com.henrique.sgps.domain.Inscricao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface InscricaoRepository extends JpaRepository<Inscricao, Integer> {


    @Query("SELECT obj FROM Inscricao obj " +
            "JOIN obj.processoSeletivo processoSeletivo " +
            "JOIN obj.participante participante " +
            "WHERE processoSeletivo.id = :idProcessoSeletivo " +
            "and participante.cpf = :cpf")
    Optional<Inscricao> findByProcessoSeletivoAndCpf(Integer idProcessoSeletivo, String cpf);


    @Query("SELECT obj FROM Inscricao obj " +
            "JOIN obj.processoSeletivo processoSeletivo " +
            "JOIN obj.participante participante " +
            "WHERE processoSeletivo.id = :idProcessoSeletivo " +
            "and participante.id = :idParticipante")
    Optional<Inscricao> buscaInscricao(Integer idProcessoSeletivo, Integer idParticipante);
}

