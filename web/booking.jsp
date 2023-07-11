<%-- 
    Document   : cart
    Created on : Mar 23, 2023, 2:13:48 PM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="assets/css/booking.css" />
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                updateTotal();
            });
            function updateTotal() {
                var selectedPackage = document.getElementById("care-package-select");
                var selectedOption = selectedPackage.options[selectedPackage.selectedIndex];
                var packagePrice = selectedOption.getAttribute("data-price");
                var totalText = document.getElementById("total-text");
                var subtotalText = document.getElementById("subtotal-text");
                if (packagePrice) {
                    totalText.textContent = "$" + packagePrice;
                    subtotalText.textContent = "$" + packagePrice;
                } else {
                    totalText.textContent = "N/A";
                    subtotalText.textContent = "N/A";
                }
            }
        </script>
    </head>
    <body>
        <%@ include file="/includes/start.jsp" %>
        <%@ include file="/includes/navbar.jsp" %>
        <%@ include file="/includes/end.jsp" %>
        <div class="container mt-17">
            <div class="title text-center">
                <h2 class="position-relative d-inline-block">
                    Booking Garderner
                </h2>
            </div>
            <form action="booking" method="post">
                <div class="row my-5">
                    <div class="col-9">
                        <div class="cart-border ">
                            <input class="form-control" type="hidden" name="status" value="Waiting for contact" required>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Name</span>
                                        <input class="form-control" type="text" placeholder="Enter your name" name="full_name" value="${sessionScope.account.full_name}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Email</span>
                                        <input class="form-control" type="email" placeholder="Enter your email" name="email" value="${sessionScope.account.email}">
                                    </div>
                                </div>
                            </div> 
                            <div class="form-group">
                                <span class="form-label">Phone</span>
                                <input class="form-control" type="tel" placeholder="Enter your phone number" name="phone" value="${sessionScope.account.phone}">
                            </div>
                            <input type="hidden" name="user_id" value="${sessionScope.account.account_id}">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Staff</span>
                                        <select class="form-select" name="staff_id">
                                            <c:forEach items="${staffList}" var="o">
                                                <option value="${o.staff_id}">${o.full_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Type of Tree</span>
                                        <select class="form-select" name="type_of_tree">
                                            <option value="Air Purifying">Air Purifying</option>
                                            <option value="Ceramic Pots">Ceramic Pots</option>
                                            <option value="Indoor Plants">Indoor Plants</option>
                                            <option value="Low Maintenance">Low Maintenance</option>
                                            <option value="Plant Bundle">Plant Bundle</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Care package</span>
                                        <select class="form-select" id="care-package-select" name="care_package_id" onchange="updateTotal()">
                                            <c:forEach items="${carePackageList}" var="i">
                                                <option value="${i.care_package_id}" data-price="${i.price}" >${i.package_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Start Date</span>
                                        <input class="form-control" type="date" name="appointment_date" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="form-label">Start Time</span>
                                <select class="form-select" id="start-times" name="appointment_start_time" onchange="updateEndTimes()">
                                    <option value="7">7:00 AM</option>
                                    <option value="8">8:00 AM</option>
                                    <option value="13">1:00 PM</option>
                                    <option value="14">2:00 PM</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <span class="form-label">Note</span>
                                <input class="form-control" type="text" placeholder="" name="appointment_note">
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="cart-total">
                            <div class="cart-total--title p-3 text-center">
                                <h5>Booking Totals</h5>
                            </div>
                            <div class="d-flex align-items-center  p-3 ">
                                <h6>Subtotal</h6>
                                <span class="px-4" id="subtotal-text">$0.00</span>
                            </div>
                            <div class="d-flex align-items-center  p-3">
                                <h6>Other fees</h6>
                                <span class="px-4">$0.00</span>
                            </div>
                            <div class="d-flex align-items-center p-3">
                                <h6>Total</h6>
                                <span class="px-4 total-text" id="total-text">$0.00</span>
                            </div>
                            <div class="text-center py-4">
                                <a href="" class="cart-btn">
                                    <button class="px-4 py-3">BOOKING NOW</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>

        <%@ include file="/includes/footer.jsp" %>

    </body>
</html>