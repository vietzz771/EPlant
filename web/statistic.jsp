<%-- 
    Document   : dashboard.jsp
    Created on : Mar 24, 2023, 7:02:30 AM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Banner -->
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/admin.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>JSP Page</title>
        <jsp:useBean id = "d" class = "dao.DAO" scope="request"/>
    </head>
    <body>

        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
                <div class="container-fluid">
                    <!-- Toggler -->
                    <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Brand -->
                    <a class="navbar-brand py-lg-2  px-lg-6 me-0" href="#">
                        <img src="https://preview.webpixels.io/web/img/logos/clever-primary.svg" alt="...">
                    </a>
                    <!-- User menu (mobile) -->
                    <div class="navbar-user d-lg-none">
                        <!-- Dropdown -->
                        <div class="dropdown">
                            <!-- Toggle -->
                            <a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="avatar-parent-child">
                                    <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar- rounded-circle">
                                    <span class="avatar-child avatar-badge bg-success"></span>
                                </div>
                            </a>
                            <!-- Menu -->
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                                <a href="#" class="dropdown-item">Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="#" class="dropdown-item">Billing</a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <!-- Navigation -->
                         <c:if test="${sessionScope.account != null}">
                            <h2 class=" text-dark text-center">Hello ${sessionScope.account.user}</h2>
                        </c:if>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link " href="account">
                                    <i class="bi bi-people"></i> Quản lí tài khoản
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product">
                                    <i class="bi bi-shop"></i> Quản lí sản phẩm
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <i class="bi bi-bar-chart"></i> Thống kê doanh số
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-chat"></i> Tin nhắn
                                    <span class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-auto">6</span>
                                </a>
                            </li>
                        </ul>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="profile.jsp">
                                    <i class="bi bi-person-square"></i> Thông tin cá nhân
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">
                                    <i class="bi bi-box-arrow-left"></i> Đăng xuất
                                </a>



                            </li>
                        </ul>
                    </div>
                </div>

            </nav>
            <!------------------------------------------------------------------------------------------------------>

            <!-- Main content -->
            <div class="container mt-3">
                <div class="col-md-12 text-center mb-3">
                    <h2>${action.equals("search") ? "Kết quả tìm kiếm" : "Bảng thống kê doanh số"}</h2>
                </div>
                <div class="row justify-content-center align-items-center">
                    <form action="SearchAccount" method="POST" class="row justify-content-center align-items-center">
                        <div class="col-md-6">
                            <div class="input-group">
                                <input class="form-control form-control-sm" name="fullname" type="search" placeholder="Tìm kiếm..." aria-label="Search">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group-append">
                                <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                            </div>
                        </div>

                    </form>
                </div>

                <div class="h-screen flex-grow-1 overflow-y-lg-auto" id="user-section">                
                    <!-- Main -->
                    <main class="py-6 bg-light">
                        <div class="container-fluid">
                            <div class="card shadow border-0 mb-7">

                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col"  >STT</th>
                                                <th scope="col"  >Tên khách hàng</th>
                                                <th scope="col" >Tên sản phẩm</th>
                                                <th scope="col" >Ngày bán</th>
                                                <th scope="col" >Số lượng</th>
                                                <th scope="col" >Đơn giá</th>
                                                <th scope="col">Thành tiền</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${d.orderInfo}" var="order" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>${order.customerName}</td>
                                                    <td>${order.productName}</td>
                                                    <td>${order.saleDate}</td>
                                                    <td>${order.quantity}</td>
                                                    <td>${order.unitPrice}</td>
                                                    <td>${order.totalPrice}</td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                </div>
                                <c:forEach begin="1" end="${endP}" var= "i">
                                        <a href="ListOrderInfo?index=${i}">${i}</a>
                                    </c:forEach>
                            </div>
                        </div>
                    </main>
                </div>

            </div>






        </div>    
    </body>
</html>