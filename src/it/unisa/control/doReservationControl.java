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
        HttpSession session = request.getSession();
        UserBean logged = (UserBean) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        String action = request.getParameter("action");
        session.removeAttribute("action");
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

                if (request.getParameter("register") != null || logged == null ) {
                    toRegister = true;
                    email = request.getParameter("email");
                    password = request.getParameter("password");
                }

                try {
                    if (!PrenotazioneDAO.validate(check_in, check_out, tipo)){
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher(response.encodeRedirectURL("./prenotazione/prenotazione.jsp"));
                        request.setAttribute("error", "already-booked");
                        requestDispatcher.forward(request,response);
                        return;
                    }

                    else {
                        request.getSession().removeAttribute("cart");
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
                            if (!UserDAO.isAlreadyUser(email)) cart.setAddUser(true);
                            else {
                                RequestDispatcher requestDispatcher = request.getRequestDispatcher(response.encodeRedirectURL("./prenotazione/prenotazione.jsp"));
                                request.setAttribute("error", "user-already-exist");
                                requestDispatcher.forward(request,response);
                                return;
                            }
                        }
                        else {cart.setAddUser(false);


                        PrenotazioneBean toAdd = new PrenotazioneBean(); //Crea il bean

                        int numberRoom = PrenotazioneDAO.getFirstFreeByType(check_in, check_out, tipo);//Recupera il primo numero di camera libero
                        toAdd.setTipo(tipo);
                        toAdd.setCodice_fiscale(codiceFiscale);
                        toAdd.setCheck_in(new Timestamp((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(check_in)).getTime()));
                        toAdd.setCheck_out(new Timestamp((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(check_out)).getTime()));
                        toAdd.setNumero(numberRoom);

                        cart.setPrenotazioneBean(toAdd);
                        session.setAttribute("cart", cart);

                        response.sendRedirect(response.encodeRedirectURL("./prenotazione/riepilogo.jsp"));
                        }
                    }
                } catch (SQLException | ParseException throwables) {
                    response.sendRedirect(response.encodeRedirectURL("./prenotazione/prenotazione.jsp?error=errore-generico"));
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
                    response.sendRedirect(response.encodeRedirectURL("./prenotazione/prenotazione.jsp?error=SQLExceptionOrParseException"));
                    sqlException.printStackTrace();
                }
                break;
            case "delete":
                request.getSession().removeAttribute("cart");
                response.sendRedirect(response.encodeRedirectURL("./index.jsp"));
                break;
            case "modify":
                cart.getClienteBean().setDatanascita(dateBookedMaker(cart.getClienteBean().getDatanascita()));
                session.setAttribute("action" , "modify");
                response.sendRedirect(response.encodeRedirectURL("./prenotazione/prenotazione.jsp"));

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
