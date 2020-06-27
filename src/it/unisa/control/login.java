package it.unisa.control;

import it.unisa.model.user.UserBean;
import it.unisa.model.user.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action =  request.getParameter("action");
        UserBean userBean = (UserBean) session.getAttribute("user");
            switch (action){
                case "login":
                    if (userBean == null){
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");

                        UserBean userRequested = UserDAO.getUserByMail(email);

                        if(userRequested != null){
                            if(userRequested.getPassword().equals(password)) {
                                userBean = new UserBean();
                                userBean.setAdmin(userRequested.isAdmin());
                                userBean.setEmail(userRequested.getEmail());
                                userBean.setPassword(userRequested.getPassword());
                                userBean.setCodicefiscale(userRequested.getCodicefiscale());

                                session.setAttribute("user", userBean);
                                response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/index.jsp"));
                            }
                            else {
                                RequestDispatcher requestDispatcher = request.getServletContext().getRequestDispatcher("/login/login.jsp");
                                request.setAttribute("error", "password");
                                requestDispatcher.forward(request, response);
                            }
                        }
                        else {
                            RequestDispatcher requestDispatcher = request.getServletContext().getRequestDispatcher("/login/login.jsp");
                            request.setAttribute("error", "notfound");
                            requestDispatcher.forward(request,response);
                        }
                    }
                    else response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/index.jsp"));
                    break;
                case "logout":
                    if (userBean != null){
                        session.removeAttribute("user");
                    }
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/index.jsp"));
                    break;
            }
        }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
