package it.unisa.control;

import it.unisa.model.prenotazione.PrenotazioneDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet("/checkBooked")
public class checkBooked extends HttpServlet {
    protected synchronized void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        boolean checked = PrenotazioneDAO.validate(request.getParameter("checkin"), request.getParameter("checkout"),request.getParameter("tipocamera"));
        if(!checked) response.setStatus(300);
        else out.println(checked);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
