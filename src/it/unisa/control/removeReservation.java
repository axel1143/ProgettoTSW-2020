package it.unisa.control;

import it.unisa.model.cliente.ClienteDAO;
import it.unisa.model.prenotazione.PrenotazioneDAO;
import it.unisa.model.user.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/removeReservation")
public class removeReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String cf = request.getParameter("cf");
        String check_in = request.getParameter("check_in");
        String check_out = request.getParameter("check_out");
        int numero = Integer.parseInt(request.getParameter("numero"));

        PrenotazioneDAO.removeReservation(cf,check_in,check_out,numero);
        if(PrenotazioneDAO.doRetriveByCF(cf).size() == 0){
            ClienteDAO.removeCustomer(cf);
            if(UserDAO.isAlreadyUserCF(cf)){
                UserDAO.removeUser(cf);
            }
            response.sendRedirect(response.encodeRedirectURL("./index.jsp"));
        }
        else response.sendRedirect(response.encodeRedirectURL("./index.jsp?ciao=true"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
