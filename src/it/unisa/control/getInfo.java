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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        switch (action){
            case "Customers":
                ArrayList<ClienteBean> customers = (ArrayList<ClienteBean>) ClienteDAO.allCustomer();
                String customersToReturn = gson.toJson(customers);
                response.getWriter().write(customersToReturn);
                break;
            case "Booking":
                String cf = request.getParameter("cf");
                ArrayList<PrenotazioneBean> booking = (ArrayList<PrenotazioneBean>) PrenotazioneDAO.doRetriveByCF(cf);
                String bookingToReturn = gson.toJson(booking);
                response.getWriter().write(bookingToReturn);
                break;
            case "Delete":
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
