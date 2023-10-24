package br.com.henrique.system.data.repository;

import br.com.henrique.system.data.domain.Servidor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;

public interface ValidaServidorRepository extends JpaRepository<Servidor, Integer> {


    @Query("SELECT case WHEN COUNT(servidor) > 0 THEN true ELSE false END " +
            "FROM Servidor servidor WHERE servidor.cpf = :cpf " +
            "AND servidor.dataNascimento = :dataNascimento " +
            "AND servidor.dataIngresso = :dataIngresso " +
            "AND servidor.classe = :classe " +
            "AND servidor.nivel = :nivel")
    boolean validaDadosServidor(
            String cpf, LocalDate dataNascimento, LocalDate dataIngresso, String classe, String nivel);

}
