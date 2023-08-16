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
        <title>Booking</title>
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
            <form action="GetStartDate" method="post">
                <div class="row my-5">
                    <div class="col">
                        <div class="cart-border ">
                            <input type="hidden" name="user_id" value="${sessionScope.account.account_id}">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Start Date</span>
                                        <input class="form-control" type="date" id="myDate" name="appointment_date" required min="2023-07-21">
                                    </div>
                                </div>
                                <a href="" class="cart-btn col-sm-6 align-self-center text-end">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
            function todayDate() {
                var today = new Date(); // get the current date
                var dd = today.getDate(); //get the day from today.
                var mm = today.getMonth() + 1; //get the month from today +1 because january is 0!
                var yyyy = today.getFullYear(); //get the year from today

                //if day is below 10, add a zero before (ex: 9 -> 09)
                if (dd < 10) {
                    dd = '0' + dd
                }

                //like the day, do the same to month (3->03)
                if (mm < 10) {
                    mm = '0' + mm
                }

                //finally join yyyy mm and dd with a "-" between then
                return yyyy + '-' + mm + '-' + dd;
            }
            $(document).ready(function () {
                $('#myDate').attr('min', todayDate());
            });
    </script>
</html>