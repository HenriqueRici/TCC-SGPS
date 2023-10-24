package br.com.henrique.sgps.repository;

import br.com.henrique.sgps.domain.Inscricao;
import br.com.henrique.sgps.domain.ProcessoSeletivo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;
import java.util.Set;

public interface ProcessoSeletivoRepository extends JpaRepository<ProcessoSeletivo, Integer> {

    @Query("SELECT obj FROM ProcessoSeletivo obj WHERE obj.edital = :edital")
    Optional<ProcessoSeletivo> findByEdital(@Param("edital") String edital);

    boolean existsProcessoSeletivoByEdital(String edital);

    @Query("""
            SELECT inscricoes FROM ProcessoSeletivo processoSeletivo
            JOIN processoSeletivo.inscricoes inscricoes
            WHERE processoSeletivo.id = :idProcessoSeletivo
            """)
    Set<Inscricao> findAllParticipantesByEdital(Integer idProcessoSeletivo);
}
