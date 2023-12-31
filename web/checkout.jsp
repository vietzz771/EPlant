<%-- 
    Document   : checkout
    Created on : Mar 23, 2023, 10:26:13 PM
    Author     : Hades
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out</title>
    </head>
    <body>
        <%@ include file="/includes/start.jsp" %>
        <%@ include file="/includes/navbar.jsp" %>
        <div class="container mt-17">
            <div class="title text-center">
                <h2 class="position-relative d-inline-block">
                    Checkout
                </h2>
            </div>
            <form action="checkout" method="post">
                <div class="row my-5">
                    <div class="col-8">
                        <div>
                            <h3>Billing Details</h3>
                            <div class="group-input py-2 mt-4">
                                <span class="fw-bold">Full Name <abbr class="required" title="required">*</abbr></span>
                                <input name="name" type="text" value="${sessionScope.account.full_name}" class="w-100 my-2" required maxlength="100">
                            </div>
                            <div class="group-input py-2">
                                <span class="fw-bold">Street address <abbr class="required" title="required">*</abbr></span>
                                <input name="address" type="text" value="${sessionScope.account.address}" class="w-100 my-2" required>
                            </div>
                            <div class="group-input py-2">
                                <span class="fw-bold">Phone <abbr class="required" title="required">*</abbr></span>
                                <input name="phone" type="text" value="${sessionScope.account.phone}" class="w-100 my-2" required maxlength="10" pattern="[0-9]{10}" title="Must constrain at 10 numbers" onkeyup="this.value = this.value.replace(/[^0-9]/g, '');">
                            </div>
                            <div class="group-input py-2">
                                <span class="fw-bold">Email address <abbr class="required" title="required">*</abbr></span>
                                <input name="email" type="text" value="${sessionScope.account.email}" class="w-100 my-2" required maxlength="50" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$">
                            </div>
                            <div class="group-input py-2">
                                <span class="fw-bold">Order notes (optional)
                                </span>
                                <input name="orderNotes" type="text" class="w-100 my-2" placeholder="Notes about your order, e.g special notes for delivery">
                            </div>
                        </div>   
                    </div>
                    <div class="col-4">
                        <div class="checkout-pd p-4">
                            <h3>Product</h3>
                            <c:set var="o" value="${requestScope.cart}"/>
                            <c:forEach items="${o.items}" var="i">
                                <div class="checkout-img d-flex py-2 align-items-center justify-content-between">
                                    <div class="d-flex align-items-center"> 
                                        <img src="${i.product.image}" alt="alt"/>
                                        <div class="px-3">
                                            <p>${i.product.name}</p>
                                            <span class="qty">QTY: ${i.quantity}</span>
                                        </div>
                                    </div>
                                    <span>$ ${i.price*i.quantity}.00</span>
                                </div>
                            </c:forEach>
                            <div class="d-flex py-3 mt-3 checkout-text align-items-center justify-content-between">
                                <h6>Subtotal</h6>
                                <span>$ ${o.totalMoney}.00</span>
                            </div>
                            <input type="hidden" name="totalMoney" value="${o.totalMoney}"/>
                            <div class="d-flex py-3 checkout-text align-items-center justify-content-between">
                                <h6>Shipping</h6>
                                <span>Free</span>
                            </div>
                            <div class="d-flex py-3 checkout-text align-items-center justify-content-between">
                                <h6>Total</h6>
                                <span class="total-text">$ ${o.totalMoney}.00</span>
                            </div>
                            <div class="py-3 checkout-text text-center text-black-50">
                                <h6>Convert USD to VND: 1$ = 23500.00VND</h6>
                            </div>
                            <div class="d-flex py-3 checkout-text align-items-center justify-content-between">
                                <h6>Payments method</h6>
                                <label>
                                    <input type="radio" name="opPay" value="COD" required checked/>
                                    COD    				
                                </label>
                                <label>
                                    <input type="radio" name="opPay" value="VNPAY" required/>
                                    VNPAY    				
                                </label>
                            </div>
                            <div class="text-center">
                                <!--<a href="shop" class="cart-btn">-->
                                <button class="order-btn p-4 px-5">PLACE ORDER</button>
                                <!--</a>-->
                            </div>
                        </div>
                    </div>   
                </div>
            </form>
        </div>
        <%@ include file="/includes/footer.jsp" %>
        <script src="assets/js/script.js"></script>
    </body>
    <script src="assets/js/jquery-3.6.0.js"></script>
    <!-- isotope js -->
    <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
    <!-- bootstrap js -->
    <script src="assets/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <!-- custom js -->
    <script src="assets/js/script.js"></script>
</html>