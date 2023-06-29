package Controller;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("MESSAGE", "");
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountId = request.getParameter("account_id");
        String oldPassword = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");

        boolean check = new DAO().changePassword(accountId, oldPassword, newPassword);
        if (check) {
            request.setAttribute("SUCCESS_MESSAGE", "<div class=\"alert alert-success\" role=\"alert\">Đổi mật khẩu thành công.</div>");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            request.setAttribute("MESSAGE", "<div class=\"alert alert-danger\" role=\"alert\">Có lỗi xảy ra.</div>");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
