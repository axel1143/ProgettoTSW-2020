package it.unisa.model.user;

import java.io.Serializable;

public class UserBean implements Serializable {
    String email;
    String password;
    String codicefiscale;


    public String toString() {
        return "UserBean{"+"email=' "+email+'\''+",password='"+password + '\'' + ", codicefiscale='" + codicefiscale + '\'' + '}';
    }

    public UserBean(){
        email="";
        password="";
        codicefiscale="";
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCodicefiscale() {
        return codicefiscale;
    }

    public void setCodicefiscale(String codicefiscale) {
        this.codicefiscale = codicefiscale;
    }



}


