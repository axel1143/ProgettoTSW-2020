package it.unisa.control;

import it.unisa.model.user.UserBean;
import it.unisa.model.user.UserDAO;
import org.w3c.dom.UserDataHandler;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter" , urlPatterns = {"/login/admin/*", "/login/user/*"})
public class AuthFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession(false);
        UserBean userBean = (UserBean) session.getAttribute("user");

        String uri = request.getRequestURI();
        if (session != null && userBean!= null ) {
            if (uri.contains("/user/")) {
                if(userBean.isAdmin() || !userBean.isAdmin()) chain.doFilter(req,resp);
                else response.sendRedirect(response.encodeRedirectURL(request.getContextPath())+"/index.jsp");
            } else if(uri.contains("/admin/")) {
                if( userBean.isAdmin()) chain.doFilter(req,resp);
                else response.sendRedirect(response.encodeRedirectURL(request.getContextPath())+"/index.jsp");
            }
        } else response.sendRedirect(response.encodeRedirectURL(request.getContextPath())+"/index.jsp");
    }


    public void init(FilterConfig config) throws ServletException {

    }

}
