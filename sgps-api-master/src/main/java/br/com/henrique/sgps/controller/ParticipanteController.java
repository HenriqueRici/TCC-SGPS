package br.com.henrique.sgps.controller;



import br.com.henrique.sgps.dtos.participante.*;

import br.com.henrique.sgps.service.participante.*;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/participantes")
public class ParticipanteController {


    private final CreateParticipante createParticipante;

    private final CreateInscricaoParticipante createInscricaoParticipante;

    private final UpdateParticipante updateParticipante;

    private final FindParticipanteDetailById findParticipanteDetailById;

    private final FindParticipanteDetailByCPF findParticipanteDetailByCPF;


    private final FindAllParticipanteDetail findAllParticipanteDetail;

    private final VerificaCPF verificaCPF;

    @PostMapping("/inscricao")
    public ResponseEntity<CreateInscricaoResponse> createInscricao(@Valid @RequestBody CreateInscricaoRequest request) {
        var response = createInscricaoParticipante.execute(request);
        return ResponseEntity.ok(response);
    }


    @PostMapping("/primeira-inscricao")
    public ResponseEntity<CreateParticipanteResponse> createPrimeiraInscricao(@Valid @RequestBody CreateParticipanteRequest request) {
        var response = createParticipante.execute(request);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<FindParticipanteDetailByIdResponse> findById(@PathVariable Integer id) {
        FindParticipanteDetailByIdResponse response = this.findParticipanteDetailById.execute(id);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/cpf/{cpf}")
    public ResponseEntity<FindParticipanteDetailByCPFResponse> findByCpf(@PathVariable String cpf) {
        FindParticipanteDetailByCPFResponse response = this.findParticipanteDetailByCPF.execute(cpf);
        return ResponseEntity.ok(response);
    }

    @GetMapping
    public ResponseEntity<List<FindAllParticipanteDetailResponse>> findAll() {
        List<FindAllParticipanteDetailResponse> response = this.findAllParticipanteDetail.execute();
        return ResponseEntity.ok(response);
    }




    @PutMapping("/{id}")
    public ResponseEntity<UpdateParticipanteResponse> update(
            @PathVariable Integer id,
            @RequestBody UpdateParticipanteRequest request
    ) {
        UpdateParticipanteResponse response = this.updateParticipante.execute(id, request);
        return ResponseEntity.ok(response);
    }


    @GetMapping("/verifica-cpf/{cpf}")
    public ResponseEntity<VerificaCPFResponse> verificaCPF(@PathVariable String cpf){
        VerificaCPFResponse response = verificaCPF.execute(cpf);
        return ResponseEntity.ok(response);
    }


}
