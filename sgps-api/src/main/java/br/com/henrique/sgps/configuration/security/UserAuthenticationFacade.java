package br.com.henrique.sgps.configuration.security;

public interface UserAuthenticationFacade {
    void authenticate(
            String username,
            String password
    );

    String generateToken(String username);
}
