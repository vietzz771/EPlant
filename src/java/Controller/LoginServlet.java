package Controller;

import Entity.Account;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie arr[] = request.getCookies();
        for (Cookie o : arr) {
            if (o.getName().equals("user")) {
                request.setAttribute("username", o.getValue());
            }
            if (o.getName().equals("password")) {
                request.setAttribute("password", o.getValue());
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        DAO dao = new DAO();
        Account acc = dao.Login(username, password);
        if (acc == null) {
            request.setAttribute("username", username);
            request.setAttribute("mess", "Wrong username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("account", acc);
            session.setMaxInactiveInterval(2 * 60 * 60);
            
            if (username.equals("admin")) {
                response.sendRedirect("account");
                return;
            }
            
            Cookie u = new Cookie("user", username);
            Cookie p = new Cookie("password", password);
            u.setMaxAge(60 * 60 * 24 * 365);
            if (remember != null) {
                p.setMaxAge(60 * 60 * 24 * 365);
            } else {
                p.setMaxAge(0);
            }
            response.addCookie(u);
            response.addCookie(p);

            response.sendRedirect("/Attire/");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
