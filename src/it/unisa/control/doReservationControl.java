package it.unisa.control;

import it.unisa.model.cliente.ClienteDAO;
import it.unisa.model.prenotazione.PrenotazioneDAO;
import it.unisa.model.user.UserDAO;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

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
        String tipo = request.getParameter("tipocamera");
        String check_in = request.getParameter("check_in");
        String check_out = request.getParameter("check_out");

        if(request.getParameter("register")!=null) {
            toRegister=true;
            email = request.getParameter("email");
            password = request.getParameter("password");
        }

        try {
            if (toRegister&&(email.equals("") || password.equals(""))) response.sendRedirect(response.encodeRedirectURL("./operation.jsp?error=InvalidUserORPassword"));
            else if(codiceFiscale.equals("") || nome.equals("") || cognome.equals("") || nascita.equals("") || tipo.equals("") || check_in.equals("") ||check_out.equals("")){
                response.sendRedirect(response.encodeRedirectURL("./operation.jsp?error=invalidInformation"));
            }
            else if(!PrenotazioneDAO.validate(check_in,check_out,tipo)) response.sendRedirect(response.encodeRedirectURL("./operation.jsp?validate=false")); //COntrolla se la prenotazione è valida

            else{
                if(toRegister && !UserDAO.isUser(codiceFiscale)) UserDAO.addStandardUser(codiceFiscale,email,password); //Aggiunge l'utente se desidera essere aggiunto e se non è stato già assunto
                if(!ClienteDAO.isCustomer(codiceFiscale)) ClienteDAO.addCostumer(codiceFiscale, nome, cognome,nascita); //Aggiunge il cliente se non è stato aggiunto
                int numberRoom = PrenotazioneDAO.getFirstFreeByType(check_in,check_out,tipo); //Recupera il primo numero di camera libero
                PrenotazioneDAO.addReservation(codiceFiscale,numberRoom,check_in,check_out);
                response.sendRedirect(response.encodeRedirectURL("./operation.jsp?&validate=true"));
            }
        } catch (SQLException | ParseException throwables) {
            response.sendRedirect(response.encodeRedirectURL("./operation.jsp?error=SQLExceptionOrParseExxeption"));
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
