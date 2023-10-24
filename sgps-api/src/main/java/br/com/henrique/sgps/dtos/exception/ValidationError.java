package br.com.henrique.sgps.dtos.exception;

import java.util.ArrayList;
import java.util.List;

public class ValidationError extends StandardError {
    private static final long serialVersionUID = 1L;

    private final List<FildMessage> errors = new ArrayList<>();

    public ValidationError() {
        super();
    }

    public ValidationError(Long timestamp, Integer status, String error) {
        super(timestamp, status, error);
    }

    public List<FildMessage> getErrors() {
        return errors;
    }

    public void addError(String fildName, String message) {
        this.errors.add(new FildMessage(fildName, message));
    }
}
