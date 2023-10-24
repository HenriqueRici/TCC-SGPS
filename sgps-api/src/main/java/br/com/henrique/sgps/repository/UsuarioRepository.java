package br.com.henrique.sgps.repository;

import br.com.henrique.sgps.domain.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    @Query("SELECT obj FROM Usuario obj WHERE obj.login = :login")
    Optional<Usuario> findUsuarioByLogin(String login);
}
