package br.com.henrique.system.data.controller;

import br.com.henrique.system.data.dto.ValidaServidorRequest;
import br.com.henrique.system.data.dto.ValidaServidorResponse;
import br.com.henrique.system.data.service.ValidaServidorService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


@AllArgsConstructor
@RestController
@RequestMapping(value = "/valida-servidor")
public class ValidaServidorController {

    ValidaServidorService validaServidorService;
    @PostMapping
    public ResponseEntity<ValidaServidorResponse> validaServidor(@Valid @RequestBody ValidaServidorRequest request){
         ValidaServidorResponse response = validaServidorService.execute(request);
        return ResponseEntity.ok(response);
    }
}
