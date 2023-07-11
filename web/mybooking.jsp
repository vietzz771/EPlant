<%-- 
    Document   : productDetail
    Created on : Mar 16, 2023, 4:08:07 AM
    Author     : Hades
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title> <style>
            .order-item p {
                margin-left : 10px;
            }
        </style>
    </head>
    <body>
        <%@ include file="/includes/start.jsp" %>
        <%@ include file="/includes/navbar.jsp" %>
        <%@ include file="/includes/end.jsp" %>

        <div class="container mt-17 mb-5">
            <div>
                <div class="py-3 sub-link d-flex">
                    <a href="#" class="px-2">My Booking</a>  
                    &gt;
                </div>
            </div>

            <c:forEach var="o" items="${listMyBooking}">
                <c:if test="${o.user_id == sessionScope.account.account_id}">
                    <div class="cart-border mt-5">

                        <div class="cart-title d-flex text-center justify-content-between p-3">
                            <h5 class="align-self-center">Booking #${o.appointmentSchedule_id} </h5>
                            <span class="py-2 px-4 text-white text-capitalize
                                  ${o.status == 'Taking Care' ? 'bg-warning' : 
                                    o.status == 'Complete' ? 'bg-success' :
                                    o.status == 'Waiting for contact' ? 'bg-primary' : ''}">
                                      ${o.status}
                                  </span>                        </div>

                            <%-- Lặp qua danh sách đơn đặt hàng để hiển thị thông tin mỗi đơn --%>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="order-item">
                                        <p><strong>Care Package :</strong> ${o.care_package_name}</p>
                                        <p><strong>Type of Tree :</strong> ${o.type_of_tree}</p>
                                        <p><strong>Start date :</strong> ${o.appointment_start_date}</p>
                                        <p><strong>Start time :</strong> ${o.appointment_start_time}.00 h</p>
                                        <p><strong>Gardener Name :</strong> ${o.staff_name}</p>
                                        <p><strong>Phone :</strong> ${o.staff_phone}</p>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <%-- Content for the second booking goes here --%>
                                </div>
                            </div>
                        </div>

                    </c:if>
                </c:forEach>
            </div>

        </div>
        <%@ include file="/includes/footer.jsp" %>
        <script src="assets/js/script.js"></script>

    </body>
</html>