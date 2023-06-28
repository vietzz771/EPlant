package Controller;

import Entity.Account;
import dao.DAO;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String full_name = request.getParameter("full_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String sex = request.getParameter("sex");

        String password = request.getParameter("password");
        String rePassword = request.getParameter("re-password");

        // Set giá trị mặc định của role là "KH"
        String role = "KH";

        if (!password.equals(rePassword)) {
            request.setAttribute("user", user);
            request.setAttribute("full_name", full_name);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("role", role);
            request.setAttribute("birthday", birthday);
            request.setAttribute("sex", sex);

            request.setAttribute("mess2", "Passwords do NOT match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            DAO dao = new DAO();
            Account acc = dao.CheckAccountExist(user);
            if (acc == null) {
                dao.Register(user, password, full_name, phone, email, address, role, birthday, sex);
                response.sendRedirect("login");
            } else {
                request.setAttribute("mess2", "Username already exists!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
