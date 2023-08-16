/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.CarePackage;
import Entity.ListStaffEnd;
import Entity.MyBooking;
import Entity.Staff;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.stream.Collectors;

/**
 *
 * @author DELL
 */
public class StaffRender extends HttpServlet {

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
            out.println("<title>Servlet StaffRender</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffRender at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        List<Staff> staffList = dao.getStaffInfo();
        List<CarePackage> carePackageList = dao.getCarePackage();
        request.setAttribute("carePackageList", carePackageList);
        request.setAttribute("staffList", staffList);
        List<MyBooking> listBooking = dao.getListBooking();
        List<MyBooking> listBookingStatus = dao.getListBookingStatus();
        request.setAttribute("listBB", listBookingStatus);
//        Staff listStaff = new Staff();
        List<Integer> listStaffEnd = new ArrayList<>();

        HttpSession session1 = request.getSession();
        String appointmentStartDate = (String) session1.getAttribute("startDate");
        LocalDate localDate = LocalDate.parse(appointmentStartDate);
        Date sqlDate = Date.valueOf(localDate);
        System.out.println(sqlDate);
        for (MyBooking o : listBooking) {
            if (sqlDate.compareTo(o.getAppointment_end_date()) >= 0) {
//                listStaff.setStaff_id(o.getStaff_id());
//                listStaff.setFull_name(o.getStaff_name());
//                listStaff.setPhone(o.getStaff_phone());
//                List<Staff> staffList = dao.getStaffInfo();
//                request.setAttribute("staffList", staffList);

//                request.setAttribute("staffList", listStaff);
//                request.setAttribute("staffList", staffList);
//                listStaffEnd.add(o.getStaff_id());
                System.out.println(o.getStaff_id());
            } else {
                listStaffEnd.add(o.getStaff_id());
                // staff co ngay` end nho hon ngay bat dau (ko hien thi); tao 1 cai list gom id staff, dua list id qua jsp, check neu id = id cua list thi` ko render
                System.out.println(o.getStaff_id());
            }
//            if (listStaff.getStaff_id() != o.getStaff_id()) {
//                request.setAttribute("staffList", staffList);
//            }
        }
        List<Integer> listStaffEndFinal = listStaffEnd.stream().distinct().collect(Collectors.toList());
        request.setAttribute("listID", listStaffEndFinal);
//        int size = listStaffEndFinal.size();
//        for (int i = 1; i < size; i++) {
//            List<Staff> staffList = dao.getStaffInfoByID(listStaffEndFinal.get(i));
//            request.setAttribute("staffList", staffList);
////            System.out.println(listStaffEndFinal.get(i));
//        }
//        Đã lấy được ngày bắt đầu  = sqlDate; check ngày bắt đầu phải lớn hơn ngày kết thúc của staff thì mới render
//        if(sqlDate.compareTo(listBooking.user))
//        System.out.println(listBooking);
//        for (MyBooking o : listBooking) {
//            for (Staff s : staffList) {
//                if (sqlDate.compareTo(o.getAppointment_end_date()) > 0) {
//                    if (s.getStaff_id() == o.getStaff_id()) {
//                        System.out.println(s.getStaff_id());
//                    }
////                System.out.println("date 1 lớn hơn date 2, hiện staff");
//                    request.setAttribute("staffList", staffList);
//                } else {
//                    System.out.println("date 1 nhỏ hơn date 2, ko hiện staff");
//                }
////            System.out.println(o);
//            }
//        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("booking.jsp");
        dispatcher.forward(request, response);
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
        processRequest(request, response);
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
