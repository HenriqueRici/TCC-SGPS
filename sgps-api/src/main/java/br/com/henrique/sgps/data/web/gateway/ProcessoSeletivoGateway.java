package br.com.henrique.sgps.data.web.gateway;

import br.com.henrique.sgps.data.web.dto.ValidaServidorRequest;
import br.com.henrique.sgps.data.web.dto.ValidaServidorResponse;
import br.com.henrique.sgps.data.web.feign.ProcessoSeletivoFeignClient;
import br.com.henrique.sgps.exceptions.ObjectNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class ProcessoSeletivoGateway {
    private final ProcessoSeletivoFeignClient client;

    public ValidaServidorResponse execute(ValidaServidorRequest request){
        var response = client.validaServidor(request);
       if( response.hasBody()){
          return response.getBody();
       }
       throw new ObjectNotFoundException("Objeto não encontrado");
    }
}
