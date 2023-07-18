package com.uniquedeveloper.registration;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            String email = (String) session.getAttribute("email");

            // Call the DAO method to update password
            DAO pd = new DAO();
            pd.UpdatePassword(newPassword, email);

            request.setAttribute("status", "resetSuccess");
        } else {
            request.setAttribute("status", "resetFailed");
        }

        // Forward the request to login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}