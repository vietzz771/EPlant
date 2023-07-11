/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Booking;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class BookingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
  
    int userId = Integer.parseInt(request.getParameter("user_id"));
    int staffId = Integer.parseInt(request.getParameter("staff_id"));
    String typeOfTree = request.getParameter("type_of_tree");
    String appointmentStartTime = request.getParameter("appointment_start_time");
    String appointmentStartDate = request.getParameter("appointment_date");
    String appointmentNote = request.getParameter("appointment_note");
        String care_package_id = request.getParameter("care_package_id");
                String status = request.getParameter("status");


    DAO dao = new DAO();
    Booking booking = new Booking();
    booking.setUser_id(userId);
    booking.setStaff_id(staffId);
    booking.setType_of_tree(typeOfTree);
        booking.setCare_package_id(Integer.parseInt(care_package_id));
    booking.setAppointment_start_time(appointmentStartTime);
    
    LocalDate localDate = LocalDate.parse(appointmentStartDate);
    Date sqlDate = Date.valueOf(localDate);
    booking.setAppointment_start_date(sqlDate);

    booking.setAppointment_note(appointmentNote);
        booking.setStatus(status);

    dao.addBooking(booking);
    response.sendRedirect("BookingReceived.jsp");
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
