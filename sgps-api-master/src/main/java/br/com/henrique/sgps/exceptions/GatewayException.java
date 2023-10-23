package br.com.henrique.sgps.exceptions;

public class GatewayException extends RuntimeException {

    private static final long serialVersionUID = 3228949821710114160L;


    public GatewayException() {
        super();
    }

    public GatewayException(final String mensagem) {
        super(mensagem);
    }


}