package it.unisa.model.cliente;

public class ClienteBean {
    String codicefiscale;
    String nome;
    String cognome;
    String datanascita;

    public ClienteBean() {
        codicefiscale = "";
        nome = "";
        cognome = "";
        datanascita = "";
    }

    public String getCodicefiscale() {
        return codicefiscale;
    }

    public void setCodicefiscale(String codicefiscale) {
        this.codicefiscale = codicefiscale;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getDatanascita() {
        return datanascita;
    }

    public void setDatanascita(String datanascita) {
        this.datanascita = datanascita;
    }


    public String toString() {
        return "ClienteBean{" + "codicefiscale='" + codicefiscale + '\'' + ", nome='" + nome + '\'' + ", cognome='" + cognome + '\'' + ", datanascita='" + datanascita + '\'' + '}';
    }
}

