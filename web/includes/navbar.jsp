<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-white py-4 fixed-top">
    <div class="container">
        <div class=" order-lg-0 d-flex align-items-center">
            <a
                class="navbar-brand d-flex justify-content-between align-items-center order-lg-0"
                href="/Eplant/"
                >
                <img src="assets/images/logo.png" alt="site icon" />
                <span class="text-uppercase fw-lighter ms-2">Eplant</span>
            </a>
        </div>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="col-lg-6 collapse navbar-collapse order-lg-1" id="navMenu">
            <ul class="navbar-nav mx-auto text-center">
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="/Eplant/">home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="/Eplant/#collection">collection</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="shop">shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="#footer">about us</a>
                </li>
                <c:if test="${sessionScope.account != null}">
                    <li class="nav-item">
                        <a class="nav-link text-uppercase text-dark" href="/Eplant/myOrder">my order</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-uppercase text-dark" href="#" id="bookingDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Booking Garderner
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="bookingDropdown">
                            <li><a class="dropdown-item" href="/Eplant/booking_1.jsp" onclick="closeDropdown()">Booking Now</a></li>
                            <li><a class="dropdown-item" href="/Eplant/mybooking" onclick="closeDropdown()">My Booking</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
        <div class="col-lg-3 order-lg-2 nav-btns d-flex justify-content-end">
            <div class="bd-nav mx-2 px-1">
                <a href="cart">
                    <button type="button" class="btn position-relative">
                        <i class="fa fa-shopping-cart"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge bg-primary">${n}</span>
                    </button>
                </a>      
            </div>
            <div class="col-auto d-flex align-items-center">
                <c:if test="${sessionScope.account != null}">
                    <div class="bd-nav mx-2 px-1">
                        <div class="position-relative">
                            <button type="button" class="btn position-relative user-button " onclick="redirectToLink()">
                                <i class="fa fa-user-circle"></i>
                                <div class="tick position-absolute">
                            </button>
                        </div>
                    </div>
                    <a href="logout" class="btn btn-primary btn-sm" style="padding: 0.25rem 0.5rem; font-size: 0.75rem; margin-left: 5px; ">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Log out</span>
                    </a>
                </c:if>
                <c:if test="${sessionScope.account == null}">
                    <div class="bd-nav mx-2 px-1">
                        <a href="login">
                            <button type="button" class="btn position-relative">
                                <i class="fa fa-user-circle"></i>
                            </button>
                        </a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</nav>
<script>
    function redirectToLink() {
        window.location.href = "profile.jsp";
    }
</script>