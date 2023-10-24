package br.com.henrique.sgps.controller;

import br.com.henrique.sgps.dtos.seletivo.*;
import br.com.henrique.sgps.service.seletivo.*;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/processo-seletivo")
public class ProcessoSeletivoController {


    private final CreateProcessoSeletivo createProcessoSeletivo;

    private final FindProcessoSeletivoDetailById findProcessoSeletivoDetailById;

    private final FindAllProcessoSeletivoDetail findAllProcessoSeletivoDetail;

    private final UpdateProcessoSeletivo updateProcessoSeletivo;

    private final FindAllParticipanteDetailByEdital findAllParticipantesByEdital;

    private final CheckIfCpfAlreadyExistsInEdital checkIfCpfAlreadyExistsInEdital;

    private  final ValidaParticipanteBySeletivoId validaParticipanteBySeletivoId;

    private final GerenciaPDF gerenciaPDF;

    private  final FindResultado resultado;


    @PostMapping
    @Secured("ROLE_ADMINISTRADOR")
    public ResponseEntity<CreateProcessoSeletivoResponse> create(@Valid @RequestBody CreateProcessoSeletivoRequest request) {
        var response = createProcessoSeletivo.execute(request);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<FindProcessoSeletivoDetailByIdResponse> findById(@PathVariable Integer id){
        FindProcessoSeletivoDetailByIdResponse response = this.findProcessoSeletivoDetailById.execute(id);
        return ResponseEntity.ok(response);
    }


    @GetMapping
    public ResponseEntity<List<FindAllProcessoSeletivoDetailResponse>> findAll(){
        List<FindAllProcessoSeletivoDetailResponse> response = this.findAllProcessoSeletivoDetail.execute();
        return ResponseEntity.ok(response);
    }


    @GetMapping("/{idProcessoSeletivo}/participantes")
    //@Secured("ROLE_ADMINISTRADOR")
    public ResponseEntity<List<FindAllParticipanteDetailByEditalResponse>> findAllParticipantesByEdital(@PathVariable Integer idProcessoSeletivo){
        var response = this.findAllParticipantesByEdital.execute(idProcessoSeletivo);
        return ResponseEntity.ok(response);
    }


    @PutMapping("/{id}")
    @Secured("ROLE_ADMINISTRADOR")
    public ResponseEntity<UpdateProcessoSeletivoResponse> update(
            @PathVariable Integer id,
            @RequestBody UpdateProcessoSeletivoRequest request
    ){
        UpdateProcessoSeletivoResponse response = this.updateProcessoSeletivo.execute(id, request);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}/verifica-cpf/{cpf}")
    public ResponseEntity<VerificaCPFByEditalResponse> verificaCPFByEdital(
            @PathVariable Integer id, @PathVariable String cpf){
        VerificaCPFByEditalResponse response =  checkIfCpfAlreadyExistsInEdital.execute(id, cpf);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/valida-participantes/{idSeletivo}")
    @Secured("ROLE_ADMINISTRADOR")
    public  ResponseEntity<Void> validaParticipantes(@PathVariable Integer idSeletivo){
         validaParticipanteBySeletivoId.execute(idSeletivo);
         return  ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/gera-resultado/{idSeletivo}")
    @Secured("ROLE_ADMINISTRADOR")
    public ResponseEntity<Void> gerarResultado(@PathVariable Integer idSeletivo){
        gerenciaPDF.geraPdf(idSeletivo);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @GetMapping("/busca-resultado/{idSeletivo}")
    public ResponseEntity<FindResultadoBySeletivoIdResponse> buscarResultado(@PathVariable Integer idSeletivo){
        FindResultadoBySeletivoIdResponse response = this.resultado.execute(idSeletivo);
        return ResponseEntity.ok(response);
    }

}
