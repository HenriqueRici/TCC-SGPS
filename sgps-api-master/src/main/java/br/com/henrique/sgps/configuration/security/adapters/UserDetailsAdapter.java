package br.com.henrique.sgps.configuration.security.adapters;

import br.com.henrique.sgps.domain.Usuario;
import lombok.AllArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serial;
import java.util.Collection;
import java.util.stream.Stream;

@AllArgsConstructor
public class UserDetailsAdapter implements UserDetails {
    @Serial
    private static final long serialVersionUID = 9169457285471143960L;
    private final Usuario usuario;

    public static UserDetails of(final Usuario usuario) {
        return new UserDetailsAdapter(usuario);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Stream.of(this.usuario.getPerfil())
                .map(perfil -> (GrantedAuthority) perfil::getNome)
                .toList();
    }

    @Override
    public String getPassword() {
        return this.usuario.getSenha();
    }

    @Override
    public String getUsername() {
        return this.usuario.getLogin();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
