package br.com.henrique.sgps.configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import feign.codec.ErrorDecoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignConfiguration {
    private final ObjectMapper objectMapper;

    @Autowired
    public FeignConfiguration(final ObjectMapper objectMapper) {this.objectMapper = objectMapper;}

    @Bean
    public ErrorDecoder errorDecoder() {
        return new FeignClientErrorDecode(this.objectMapper);
    }

}