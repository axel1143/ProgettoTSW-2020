package it.unisa.model;

import it.unisa.model.camera.CameraBean;
import it.unisa.model.cliente.ClienteBean;
import it.unisa.model.prenotazione.PrenotazioneBean;
import it.unisa.model.user.UserBean;

public class Cart {
    private ClienteBean clienteBean;
    private UserBean userBean;
    private PrenotazioneBean prenotazioneBean;
    private CameraBean cameraBean;
    private boolean addClient;
    private boolean addUser;

    public Cart () {
        clienteBean = null;
        userBean = null;
        prenotazioneBean = null;
        cameraBean = null;
        addClient = false;
        addUser = false;
    }
    public CameraBean getCameraBean() {
        return cameraBean;
    }

    public void setCameraBean(CameraBean cameraBean) {
        this.cameraBean = cameraBean;
    }
    public ClienteBean getClienteBean() {
        return clienteBean;
    }

    public void setClienteBean(ClienteBean clienteBean) {
        this.clienteBean = clienteBean;
    }

    public UserBean getUserBean() {
        return userBean;
    }

    public void setUserBean(UserBean userBean) {
        this.userBean = userBean;
    }

    public PrenotazioneBean getPrenotazioneBean() {
        return prenotazioneBean;
    }

    public void setPrenotazioneBean(PrenotazioneBean prenotazioneBean) {
        this.prenotazioneBean = prenotazioneBean;
    }

    public boolean isAddClient() {
        return addClient;
    }

    public void setAddClient(boolean addClient) {
        this.addClient = addClient;
    }

    public boolean isAddUser() {
        return addUser;
    }

    public void setAddUser(boolean addUser) {
        this.addUser = addUser;
    }

}
