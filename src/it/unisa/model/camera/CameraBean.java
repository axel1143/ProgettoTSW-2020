package it.unisa.model.camera;

public class CameraBean {
    int numero;
    int numero_letti;
    String tipo_camera;

    public CameraBean(){
        numero=0;
        numero_letti=0;
        tipo_camera="";
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getNumero_letti() {
        return numero_letti;
    }

    public void setNumero_letti(int numero_letti) {
        this.numero_letti = numero_letti;
    }

    public String getTipo_camera() {
        return tipo_camera;
    }

    public void setTipo_camera(String tipo_camera) {
        this.tipo_camera = tipo_camera;
    }


    public String toString() {
        return "CameraBean{" +
                "numero=" + numero +
                ", numero_letti=" + numero_letti +
                ", tipo_camera='" + tipo_camera + '\'' +
                '}';
    }


}
