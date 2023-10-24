package br.com.henrique.sgps.configuration.security.adapters;

import br.com.henrique.sgps.configuration.security.JwtService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

@Service

public class JwtServiceImpl implements JwtService {

    private final String secret;

    public JwtServiceImpl(@Value("${app.secret}") String secret) {
        this.secret = secret;
    }


    @Override
    public String extractUsername(String token) {
        return this.extractClaim(token, Claims::getSubject);
    }

    private <T> T extractClaim(String token, Function<? super Claims, T> claimsResolver) {
        var claims = this.extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    private Claims  extractAllClaims(String token) {
         var sanitizedToken = token.replace("Bearer ", "");
        return Jwts.parserBuilder()
                .setSigningKey(secret.getBytes())
                .build()
                .parseClaimsJws(sanitizedToken)
                .getBody();
    }

    @Override
    public boolean isTokenValid(String token, UserDetails userDetails) {
        var username = Objects.requireNonNull(this.extractUsername(token));
        return username.equals(userDetails.getUsername()) && !this.isTokenExpired(token);
    }

    @Override
    public String generateToken(UserDetails userDetails) {
         Map<String, Object> claims = new HashMap<>();
        return this.createToken(claims, userDetails);
    }

    private String createToken(Map<String, Object> claims,UserDetails userDetails) {
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(userDetails.getUsername())
                .claim("authorities", userDetails.getAuthorities())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + TimeUnit.HOURS.toMillis(1)))
                .signWith(Keys.hmacShaKeyFor(this.secret.getBytes()), SignatureAlgorithm.HS512)
                .compact();
    }

    private boolean isTokenExpired(final String token) {
        var expiration = this.extractExpiration(token);
        return expiration != null && expiration.before(new Date());
    }

    private Date extractExpiration(String token) {
        return this.extractClaim(token, Claims::getExpiration);
    }
}