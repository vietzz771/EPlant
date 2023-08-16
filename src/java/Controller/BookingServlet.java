package Controller;

import Entity.Booking;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
//        String appointmentStartDate = request.getParameter("appointment_date");
        HttpSession session1 = request.getSession();
        String appointmentStartDate = (String) session1.getAttribute("startDate");
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
        // get end-day
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar endDate = Calendar.getInstance();
        endDate.setTime(sqlDate);
        if (Integer.parseInt(care_package_id) == 1) {
            endDate.add(Calendar.DATE, 1);
            LocalDate date2 = LocalDate.parse(dateFormat.format(endDate.getTime()));
            Date endDatef = Date.valueOf(date2);
            booking.setAppoinment_end_date(endDatef);
        } else if (Integer.parseInt(care_package_id) == 2) {
            endDate.add(Calendar.DATE, 7);
            LocalDate date2 = LocalDate.parse(dateFormat.format(endDate.getTime()));
            Date endDatef = Date.valueOf(date2);
            booking.setAppoinment_end_date(endDatef);
        } else {
            endDate.add(Calendar.MONTH, 1);
            LocalDate date2 = LocalDate.parse(dateFormat.format(endDate.getTime()));
            Date endDatef = Date.valueOf(date2);
            booking.setAppoinment_end_date(endDatef);
        }
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
