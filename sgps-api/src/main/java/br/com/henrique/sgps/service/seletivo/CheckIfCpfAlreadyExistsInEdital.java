package br.com.henrique.sgps.service.seletivo;


import br.com.henrique.sgps.dtos.seletivo.VerificaCPFByEditalResponse;
import br.com.henrique.sgps.service.inscricao.ExistsInscricao;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CheckIfCpfAlreadyExistsInEdital {

    private final ExistsInscricao existsInscricao;
    public  VerificaCPFByEditalResponse execute(Integer idProcessoSeletivo, String cpf) {
        boolean consultaCPFByEdital = existsInscricao.execute(idProcessoSeletivo, cpf);
        return new VerificaCPFByEditalResponse(consultaCPFByEdital);
    }
}
