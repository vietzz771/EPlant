<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-white py-4 fixed-top">
    <div class="container">
        <div class="col-lg-3 order-lg-0 d-flex align-items-center">
            <a class="navbar-brand" href="/Attire/">
                <img src="assets/images/logo.png" alt="site icon" />
            </a>
            <span class="text-uppercase">Eplant</span>
        </div>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="col-lg-6 collapse navbar-collapse order-lg-1" id="navMenu">
            <ul class="navbar-nav mx-auto text-center">
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="/Attire/">home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="/Attire/#collection">collection</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="shop">shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="#footer">about us</a>
                </li>
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
            <div class="bd-nav mx-2 px-1">
                <a href="heart">
                    <button type="button" class="btn position-relative">
                        <i class="fa fa-heart"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge bg-primary">2</span>
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
                    <a href="logout" class="btn btn-primary btn-sm" style="padding: 0.25rem 0.5rem; font-size: 0.75rem; margin-left: 50px; ">
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