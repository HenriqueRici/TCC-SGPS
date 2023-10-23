package br.com.henrique.sgps.configuration;

import br.com.henrique.sgps.dtos.exception.ErroDto;
import br.com.henrique.sgps.exceptions.GatewayException;
import com.fasterxml.jackson.databind.ObjectMapper;
import feign.Request;
import feign.Response;
import feign.codec.ErrorDecoder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;

import java.io.InputStream;
import java.util.List;

@Slf4j
public class FeignClientErrorDecode implements ErrorDecoder {

    private static final String MENSAGEM_ERRO_DESCONHECIDO = "Ocorreu um erro desconhecido ao tentar acessar um serviço externo, " +
            "tente novamente mais tarde";

    private final ErrorDecoder errorDecoder = new Default();

    private final ObjectMapper objectMapper;

    public FeignClientErrorDecode(final ObjectMapper objectMapper) {this.objectMapper = objectMapper;}

    @Override
    public Exception decode(
            final String methodKey,
            final Response response
    ) {
        final var request = response.request();
        log.error(
                "Failed request method: {}",
                methodKey
        );
        log.error(
                "Request to: {} {} | HttpCode: {}",
                request.httpMethod(),
                request.url(),
                response.status()
        );

        if (hasBody(
                response,
                request
        )) {
            log.error(
                    "Body: {}",
                    request.body()
            );
            log.error(
                    "Headers: {}",
                    request.headers()
            );
        }

        if (response.status() >= 400 && response.status() <= 499) {
            final var mensagem = this.tryParseRequest(response.body());
            return new GatewayException(mensagem.getErro());
        }
        if (response.status() >= 500 && response.status() <= 599) {
            return new GatewayException(MENSAGEM_ERRO_DESCONHECIDO);
        }
        return this.errorDecoder.decode(
                methodKey,
                response
        );
    }

    private ErroDto tryParseRequest(final Response.Body body) {
        try (final InputStream stream = body.asInputStream()) {
            return this.objectMapper.readValue(
                    stream,
                    ErroDto.class
            );
        }
        catch (final Exception exception) {
            log.error(
                    "Não foi possível converter resposta {}.",
                    body.toString()
            );
            return ErroDto.of(MENSAGEM_ERRO_DESCONHECIDO);
        }
    }

    private static String getErroMessage(
            final String message,
            final HttpStatus status
    ) {
        return status + " - " + message;
    }

    private static boolean hasBody(
            final Response response,
            final Request request
    ) {
        return response.body() != null &&
                List.of(
                        HttpMethod.PUT,
                        HttpMethod.POST
                ).contains(request.httpMethod());
    }

}