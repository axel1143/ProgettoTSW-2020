package it.unisa.control;

import it.unisa.model.cliente.ClienteDAO;
import it.unisa.model.prenotazione.PrenotazioneBean;
import it.unisa.model.prenotazione.PrenotazioneDAO;
import it.unisa.model.user.UserDAO;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/doReservationControl")
public class doReservationControl extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
       boolean toRegister = false;
        String email ="";
        String password ="";
        String codiceFiscale = request.getParameter("codicefiscale");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String nascita= request.getParameter("nascita");
        nascita = fixDate(nascita, false);
        String tipo = request.getParameter("tipocamera");
        String date = request.getParameter("dates");
        String check_in = fixDate(date.substring(0,10),true);
        String check_out= fixDate(date.substring(13,23),true);

        if(request.getParameter("register")!=null) {
            toRegister=true;
            email = request.getParameter("email");
            password = request.getParameter("password");
        }

        try {
            if(!PrenotazioneDAO.validate(check_in,check_out,tipo)) response.sendRedirect(response.encodeRedirectURL("./operation.jsp?validate=false")); //COntrolla se la prenotazione è valida

            else{
                if(!ClienteDAO.isCustomer(codiceFiscale)) ClienteDAO.addCostumer(codiceFiscale, nome, cognome,nascita); //Aggiunge il cliente se non è stato aggiunto
                if(toRegister && !UserDAO.isUser(codiceFiscale)) UserDAO.addStandardUser(codiceFiscale,email,password);
                int numberRoom = PrenotazioneDAO.getFirstFreeByType(check_in,check_out,tipo);//Recupera il primo numero di camera libero

                PrenotazioneBean toAdd = new PrenotazioneBean(); //Crea il bean

                toAdd.setCodice_fiscale(codiceFiscale);
                toAdd.setCheck_in(new Timestamp((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(check_in)).getTime()));
                toAdd.setCheck_out(new Timestamp((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(check_out)).getTime()));
                toAdd.setNumero(numberRoom);

                PrenotazioneDAO.addReservation(toAdd); //Aggiunge il bean

                response.sendRedirect(response.encodeRedirectURL("./operation.jsp?&validate=true"));
            }
        } catch (SQLException | ParseException throwables) {
            response.sendRedirect(response.encodeRedirectURL("./operation.jsp?error=SQLExceptionOrParseExxeption"));
            throwables.printStackTrace();
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }

    protected String fixDate(String date, boolean booked){ // Booleano usato per riutilizzare la stessa funzione nel caso si tratti di una data di prenotazione o di nascita
        String month = date.substring(0,2);
        String day = date.substring(3,5);
        String year = date.substring(6,10);
        if (booked) return year + "-" + month + "-" + day + " 10:00:00";
        else return year + "-" + month + "-" + day;
    }
}
