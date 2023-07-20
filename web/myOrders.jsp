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
        <link rel="stylesheet" href="assets/css/myOrder.css"/>
        <title>My Orders</title>
    </head>
    <body>
        <%@ include file="/includes/start.jsp" %>
        <%@ include file="/includes/navbar.jsp" %>
        <div class="container mt-17 mb-5">
            <div>
                <div class="py-3 sub-link d-flex">
                    <a href="myOrder" class="px-2">My Orders</a>
                    &gt;
                </div>
            </div>
            <div class="mt-3">
                <div class="d-flex o-status">
                    <c:if test="${status != 'pending' && status != 'shipping' && status != 'completed' && status !='cancelled' && status !='all'}">
                        <a href="CateMyOrder?stt=all">
                            <button class="btn btn-outline-secondary">All</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=pending">
                            <button class="btn btn-primary">Pending</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=shipping">
                            <button class="btn btn-outline-dark">Shipping</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=completed">
                            <button class="btn btn-outline-success">Completed</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=cancelled">
                            <button class="btn btn-outline-danger">Cancelled</button>
                        </a>
                    </c:if>
                    <c:if test="${status == 'all'}">
                        <a href="CateMyOrder?stt=all">
                            <button class="btn bg-secondary text-white">All</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=pending">
                            <button class="btn btn-outline-primary">Pending</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=shipping">
                            <button class="btn btn-outline-dark">Shipping</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=completed">
                            <button class="btn btn-outline-success">Completed</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=cancelled">
                            <button class="btn btn-outline-danger">Cancelled</button>
                        </a>
                    </c:if>
                    <c:if test="${status == 'pending'}">
                        <a href="CateMyOrder?stt=all">
                            <button class="btn btn-outline-secondary">All</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=pending">
                            <button class="btn bg-pending text-white">Pending</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=shipping">
                            <button class="btn btn-outline-dark">Shipping</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=completed">
                            <button class="btn btn-outline-success">Completed</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=cancelled">
                            <button class="btn btn-outline-danger">Cancelled</button>
                        </a>
                    </c:if>
                    <c:if test="${status == 'shipping'}">
                        <a href="CateMyOrder?stt=all">
                            <button class="btn btn-outline-secondary">All</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=pending">
                            <button class="btn btn-outline-primary">Pending</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=shipping">
                            <button class="btn bg-shipping text-white">Shipping</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=completed">
                            <button class="btn btn-outline-success">Completed</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=cancelled">
                            <button class="btn btn-outline-danger">Cancelled</button>
                        </a>
                    </c:if>
                    <c:if test="${status == 'completed'}">
                        <a href="CateMyOrder?stt=all">
                            <button class="btn btn-outline-secondary">All</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=pending">
                            <button class="btn btn-outline-primary">Pending</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=shipping">
                            <button class="btn btn-outline-dark">Shipping</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=completed">
                            <button class="btn text-white bg-completed">Completed</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=cancelled">
                            <button class="btn btn-outline-danger">Cancelled</button>
                        </a>
                    </c:if>
                    <c:if test="${status == 'cancelled'}">
                        <a href="CateMyOrder?stt=all">
                            <button class="btn btn-outline-secondary">All</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=pending">
                            <button class="btn btn-outline-primary">Pending</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=shipping">
                            <button class="btn btn-outline-dark">Shipping</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=completed">
                            <button class="btn btn-outline-success">Completed</button>
                        </a>
                        <a class="px-2" href="CateMyOrder?stt=cancelled">
                            <button class="btn bg-cancelled text-white">Cancelled</button>
                        </a>
                    </c:if>
                </div>
            </div>

            <c:forEach items="${order}" var="listO">
                <div class="cart-border mt-3">
                    <div class="cart-title d-flex text-center justify-content-between p-3">
                        <h5 class="align-self-center">Order: #${listO.order_id} <span class="fs-6 text-black-50 fst-italic">${listO.order_date}</span></h5>
                            <c:if test="${listO.order_status == 'pending'}">
                            <span class="bg-pending py-2 px-4 text-white text-capitalize">${listO.order_status}</span>
                        </c:if>
                        <c:if test="${listO.order_status == 'shipping'}">
                            <span class="bg-shipping py-2 px-4 text-white text-capitalize">${listO.order_status}</span>
                        </c:if>
                        <c:if test="${listO.order_status == 'completed'}">
                            <span class="bg-completed py-2 px-4 text-white text-capitalize">${listO.order_status}</span>
                        </c:if>
                        <c:if test="${listO.order_status == 'cancelled'}">
                            <span class="bg-cancelled py-2 px-4 text-white text-capitalize">${listO.order_status}</span>
                        </c:if>
                    </div>
                    <c:forEach items="${orderDetail}" var="listOD">
                        <c:if test="${listOD.o_id == listO.order_id}">
                            <c:forEach items="${product}" var="listP">
                                <c:if test="${listOD.product_id == listP.productID}">
                                    <div class="cart-items d-flex text-center justify-content-between align-items-center p-3">
                                        <div class="cart-items--img d-flex align-items-center">
                                            <img src="${listP.image}" alt="alt">
                                            <div class="text-start px-3">
                                                <div class="d-flex">
                                                    <span class="text-nowrap">${listP.name}</span>
                                                    <span class="text-nowrap px-3">x ${listOD.quantity}</span>
                                                </div>
                                                <span class="w-20">$ ${listOD.price}</span>
                                            </div>
                                        </div>
                                        <span class="text-danger">Sub total: $ ${listOD.quantity * listOD.price}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                    <div class="d-flex justify-content-between p-3 border-bottom">
                        <h6 class="align-self-center m-0">Payment status: ${listO.payment_status}</h6>
                    </div>
                    <div class="d-flex justify-content-between p-3">
                        <span class="align-self-center text-danger">Total: $ ${listO.total_price}.00</span>
                        <div class="d-flex justify-content-end">
                            <!--                            <div class="mx-5">
                                                            <a href="#" class="cart-btn">
                                                                <button class="p-2 px-4">Order Tracking</button>
                                                            </a>
                                                        </div>-->
                            <div>
                                <c:if test="${listO.order_status != 'cancelled'}">
                                    <a href="processOrder?oid=${listO.order_id}" class="cart-btn">
                                        <button class="p-2 px-4">Cancel Order</button>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
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