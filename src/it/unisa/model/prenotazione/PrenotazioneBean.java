package it.unisa.model.prenotazione;

import java.sql.Time;
import java.sql.Timestamp;

public class PrenotazioneBean {
    Timestamp check_in;
    Timestamp check_out;
    int numero;
    String codice_fiscale;

    public String toString() {
        return "PrenotazioneBean{" +
                "check_in='" + check_in + '\'' +
                ", check_out='" + check_out + '\'' +
                ", numero=" + numero +
                ", codice_fiscale='" + codice_fiscale + '\'' +
                '}';
    }

    public PrenotazioneBean(){
        check_in= null;
        check_out= null;
        numero=0;
        codice_fiscale="";
    }

    public Timestamp getCheck_in() {
        return check_in;
    }

    public void setCheck_in(Timestamp check_in) {
        this.check_in = check_in;
    }

    public Timestamp getCheck_out() {
        return check_out;
    }

    public void setCheck_out(Timestamp check_out) {
        this.check_out = check_out;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCodice_fiscale() {
        return codice_fiscale;
    }

    public void setCodice_fiscale(String codice_fiscale) {
        this.codice_fiscale = codice_fiscale;
    }



}
