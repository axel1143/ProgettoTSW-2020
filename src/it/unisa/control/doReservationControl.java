package it.unisa.control;

import it.unisa.model.Cart;
import it.unisa.model.cliente.ClienteBean;
import it.unisa.model.cliente.ClienteDAO;
import it.unisa.model.prenotazione.PrenotazioneBean;
import it.unisa.model.prenotazione.PrenotazioneDAO;
import it.unisa.model.user.UserBean;
import it.unisa.model.user.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/doReservationControl")
public class doReservationControl extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        HttpSession session = request.getSession();
        String action = (String) request.getParameter("action");

        switch (action) {
            case "create":
                boolean toRegister = false;
                String email = "";
                String password = "";
                String codiceFiscale = request.getParameter("codicefiscale");
                String nome = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String nascita = request.getParameter("nascita");
                nascita = bookeDateMaker(nascita, false);
                String tipo = request.getParameter("tipocamera");
                String date = request.getParameter("dates");
                String check_in = bookeDateMaker(date.substring(0, 10), true);
                String check_out = bookeDateMaker(date.substring(13, 23), true);

                if (request.getParameter("register") != null) {
                    toRegister = true;
                    email = request.getParameter("email");
                    password = request.getParameter("password");
                }

                try {
                    if (!PrenotazioneDAO.validate(check_in, check_out, tipo))
                        response.sendRedirect(response.encodeRedirectURL("./prenotazione.jsp?bookError=true")); //COntrolla se la prenotazione è valida

                    else {
                        if(cart != null) request.getSession().removeAttribute("cart");
                        cart = new Cart();
                        ClienteBean clienteBean = new ClienteBean();
                        clienteBean.setCodicefiscale(codiceFiscale);
                        clienteBean.setNome(nome);
                        clienteBean.setCognome(cognome);
                        clienteBean.setDatanascita(nascita);

                        cart.setClienteBean(clienteBean);

                        if (!ClienteDAO.isCustomer(codiceFiscale)) cart.setAddClient(true);
                        else cart.setAddClient(false);

                        if (toRegister) {
                            UserBean userBean = new UserBean();
                            userBean.setEmail(email);
                            userBean.setPassword(password);
                            userBean.setCodicefiscale(codiceFiscale);
                            userBean.setAdmin(false);

                            cart.setUserBean(userBean);
                            if (!UserDAO.isUser(codiceFiscale)) cart.setAddUser(true);
                            else cart.setAddUser(false);
                        } else cart.setAddUser(false);


                        PrenotazioneBean toAdd = new PrenotazioneBean(); //Crea il bean

                        int numberRoom = PrenotazioneDAO.getFirstFreeByType(check_in, check_out, tipo);//Recupera il primo numero di camera libero
                        toAdd.setTipo(tipo);
                        toAdd.setCodice_fiscale(codiceFiscale);
                        toAdd.setCheck_in(new Timestamp((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(check_in)).getTime()));
                        toAdd.setCheck_out(new Timestamp((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(check_out)).getTime()));
                        toAdd.setNumero(numberRoom);

                        cart.setPrenotazioneBean(toAdd);
                        session.setAttribute("cart", cart);

                    /*RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/riepilogo.jsp");
                    dispatcher.forward(request, response); */
                        response.sendRedirect(response.encodeRedirectURL("./riepilogo.jsp"));
                    }
                } catch (SQLException | ParseException throwables) {
                    response.sendRedirect(response.encodeRedirectURL("./operation.jsp?error=SQLExceptionOrParseExxeption"));
                    throwables.printStackTrace();
                }
                break;
            case "booked":
                try {
                    if (cart.isAddClient()) ClienteDAO.addCostumer(cart.getClienteBean());
                    if (cart.isAddUser()) UserDAO.addStandardUser(cart.getUserBean());

                    PrenotazioneDAO.addReservation(cart.getPrenotazioneBean());

                    session.removeAttribute("cart");

                    response.sendRedirect(response.encodeRedirectURL("./index.jsp"));

                } catch (SQLException sqlException) {
                    response.sendRedirect(response.encodeRedirectURL("./operation.jsp?error=SQLExceptionOrParseException"));
                    sqlException.printStackTrace();
                }
                break;
            case "delete":
                request.getSession().removeAttribute("cart");
                response.sendRedirect(response.encodeRedirectURL("./index.jsp"));
                break;
            case "modify":
                RequestDispatcher requestDispatcher = request.getServletContext().getRequestDispatcher("/prenotazione.jsp");
                cart.getClienteBean().setDatanascita(dateBookedMaker(cart.getClienteBean().getDatanascita()));
                request.setAttribute("action", "modify");
                requestDispatcher.forward(request,response);

        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
         doPost(request,response);
    }

    protected String bookeDateMaker(String date, boolean booked){ // Booleano usato per riutilizzare la stessa funzione nel caso si tratti di una data di prenotazione o di nascita
        String month = date.substring(0,2);
        String day = date.substring(3,5);
        String year = date.substring(6,10);
        if (booked) return year + "-" + month + "-" + day + " 10:00:00";
        else return year + "-" + month + "-" + day;
    }
    protected String dateBookedMaker(String date){
        String year = date.substring(0,4);
        String month = date.substring(5,7);
        String day = date.substring(8,10);

        return month + "/" + day + "/" + year;
    }
}
