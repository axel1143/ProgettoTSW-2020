package it.unisa.control;

import it.unisa.model.prenotazione.PrenotazioneDAO;

import javax.servlet.annotation.WebServlet;
import javax.swing.plaf.synth.SynthUI;
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
            if(PrenotazioneDAO.addReservation(codiceFiscale,nome,cognome,nascita,check_in,check_out,tipo, toRegister,email,password))
                response.sendRedirect(response.encodeRedirectURL("./operation.jsp?register=true"));
            else response.sendRedirect(response.encodeRedirectURL("./operation.jsp?register=false"));
        } catch (SQLException | ParseException throwables) {
            System.out.println(throwables.getMessage());
            response.sendRedirect(response.encodeRedirectURL("./operation.jsp?register=false"));
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
