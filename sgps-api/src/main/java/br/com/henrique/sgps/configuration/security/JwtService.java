package br.com.henrique.sgps.configuration.security;

import org.springframework.security.core.userdetails.UserDetails;

public interface JwtService {
    String extractUsername(final String token);

    boolean isTokenValid(
            final String token,
            final UserDetails userDetails
    );

    String generateToken(final UserDetails userDetails);
}
