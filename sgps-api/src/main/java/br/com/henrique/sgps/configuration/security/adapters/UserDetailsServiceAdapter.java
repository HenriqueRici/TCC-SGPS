package br.com.henrique.sgps.configuration.security.adapters;

import br.com.henrique.sgps.service.usuario.FindUsuarioByLogin;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserDetailsServiceAdapter implements UserDetailsService {
    private final FindUsuarioByLogin findUsuarioByLogin;

    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        try {
            final var user = this.findUsuarioByLogin.execute(username);
            return UserDetailsAdapter.of(user);
        }
        catch (final RuntimeException e) {
            throw new UsernameNotFoundException(e.getMessage(), e);
        }
    }

}
