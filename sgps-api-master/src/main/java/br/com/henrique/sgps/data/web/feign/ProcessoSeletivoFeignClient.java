package br.com.henrique.sgps.data.web.feign;

import br.com.henrique.sgps.data.web.dto.ValidaServidorRequest;
import br.com.henrique.sgps.data.web.dto.ValidaServidorResponse;
import jakarta.validation.Valid;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(
        name = "dataSgps",
        contextId = "dataSgps",
        url = "${app.url.data-sgps}"
)
public interface ProcessoSeletivoFeignClient {
    //@PostMapping("/valida-servidor")
    @RequestMapping(method = RequestMethod.POST, value = "/valida-servidor", consumes = "application/json")
    ResponseEntity<ValidaServidorResponse> validaServidor(@Valid @RequestBody ValidaServidorRequest request);

}
