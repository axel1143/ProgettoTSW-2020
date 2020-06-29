package it.unisa.control;

import com.google.gson.Gson;
import com.mysql.cj.xdevapi.Client;
import com.mysql.cj.xdevapi.JsonArray;
import it.unisa.model.cliente.ClienteBean;
import it.unisa.model.cliente.ClienteDAO;
import it.unisa.model.prenotazione.PrenotazioneBean;
import it.unisa.model.prenotazione.PrenotazioneDAO;
import it.unisa.model.user.UserBean;
import it.unisa.model.user.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/getInfo")
public class getInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("toget");
        Gson gson = new Gson();
        switch (action){
            case "Customers":
                ArrayList<ClienteBean> customers = (ArrayList<ClienteBean>) ClienteDAO.allCustomer();
                String customersToReturn = gson.toJson(customers);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(customersToReturn);
                break;
            case "Booking":
                String cf = request.getParameter("cf");
                ArrayList<PrenotazioneBean> booking = (ArrayList<PrenotazioneBean>) PrenotazioneDAO.doRetriveByCF(cf);
                String bookingToReturn = gson.toJson(booking);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(bookingToReturn);
                break;
            case "Delete":
                String cf1 = request.getParameter("cf");
                String check_in = request.getParameter("check_in");
                String check_out = request.getParameter("check_out");
                int numero = Integer.parseInt(request.getParameter("numero"));
                PrenotazioneDAO.removeReservation(cf1,check_in,check_out,numero);
                if(PrenotazioneDAO.doRetriveByCF(cf1).size() == 0){
                    ClienteDAO.removeCustomer(cf1);
                    if(UserDAO.isAlreadyUserCF(cf1)){
                        UserDAO.removeUser(cf1);
                    }
                }
                break;
            case "email":
                String cf2 = request.getParameter("cf");
                String email = UserDAO.getUserByCF(cf2).getEmail();
                response.getWriter().write(email);
                System.out.println(email +"ciao");
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
