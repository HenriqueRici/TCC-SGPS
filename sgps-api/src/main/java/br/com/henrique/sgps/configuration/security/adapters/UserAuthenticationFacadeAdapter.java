package br.com.henrique.sgps.configuration.security.adapters;

import br.com.henrique.sgps.configuration.security.JwtService;
import br.com.henrique.sgps.configuration.security.UserAuthenticationFacade;
import lombok.RequiredArgsConstructor;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserAuthenticationFacadeAdapter implements UserAuthenticationFacade {
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UserDetailsServiceAdapter userDetailsServiceAdapter;

    @Override
    public void authenticate(
            final String username,
            final String password
    ) {
        this.authenticationManager.authenticate(
                   new UsernamePasswordAuthenticationToken(username, password)
           );
    }

    @Override
    public String generateToken(final String username) {
        final var userDetails = this.loadUserByUsername(username);
        return this.jwtService.generateToken(userDetails);
    }

    private UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        return this.userDetailsServiceAdapter.loadUserByUsername(username);
    }
}
