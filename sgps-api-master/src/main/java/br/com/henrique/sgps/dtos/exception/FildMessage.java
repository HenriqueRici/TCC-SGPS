package br.com.henrique.sgps.dtos.exception;

import java.io.Serializable;

public class FildMessage implements Serializable {
    private static final long serialVersionUID = 1L;

    private String fildMName;
    private String mmessage;

    public FildMessage() {
        super();
    }

    public FildMessage(String fildMName, String mmessage) {
        this.fildMName = fildMName;
        this.mmessage = mmessage;
    }

    public String getFildMName() {
        return fildMName;
    }

    public void setFildMName(String fildMName) {
        this.fildMName = fildMName;
    }

    public String getMmessage() {
        return mmessage;
    }

    public void setMmessage(String mmessage) {
        this.mmessage = mmessage;
    }
}
