<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="Checkout_VNPAY.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entity.Account"%>
<%@page import="Entity.Cart"%>
<%@page import="Entity.Product"%>
<%@page import="dao.DAO"%>
<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.Iterator"%>
<%--<%@page import="jakarta.servlet.http.HttpSession"%>--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VNPAY RESPONSE</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
//            system.print.out

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY RESPONSE</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Merchant Transaction Code:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Amount:</label>
                    <label><%=request.getParameter("vnp_Amount")%></label>
                </div>  
                <div class="form-group">
                    <label >Order info:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >VNPAY Response Code:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >VNPAY Transaction Code:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Bank Code:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Pay Date:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Payment Status:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Success");
                                    request.setAttribute("VNPAY", "Success");
                                    HttpSession session1 = request.getSession();
                                    String orderNotes = (String)session1.getAttribute("orderNotes");
                                    DAO dao = new DAO();
                                    List<Product> list = dao.getListProduct();
                                    Cookie[] arr = request.getCookies();
                                    String txt = "";
                                    if (arr != null) {
                                        for (Cookie o : arr) {
                                            if (o.getName().equals("cart")) {
                                                txt += o.getValue();
                                            }
                                        }
                                    }
                                    Cart cart = new Cart(txt, list);
                                    Account a = (Account) session1.getAttribute("account");
                                    if (a == null) {
                                        response.sendRedirect("login");
                                    } else {
                                        String paymentStatus = "Already paid";
                                        dao.addOrder(a, cart, orderNotes, paymentStatus);
                                        Cookie c = new Cookie("cart", "");
                                        c.setMaxAge(0);
                                        response.addCookie(c);
                                        response.sendRedirect("OrderReceived.jsp");
                                    }
                                } else {
                                    out.print("Failed");
                                    request.setAttribute("VNPAY", "Failed");
                                    response.sendRedirect("home");
                                }
                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div> 
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>  
    </body>
</html>
