<%-- 
    Document   : listOrder
    Created on : Jul 1, 2023, 7:53:28 AM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/admin.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>Orders Management</title>
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
                    <div class="align-items-center text-center" style="margin: 0 auto">
                        <a
                            class="navbar-brand d-flex  align-items-center"
                            href="/Eplant/"
                            >
                            <img src="assets/images/logo.png" alt="site icon" />
                            <span class="text-uppercase fw-lighter ms-2 text-success">Eplant</span>
                        </a>
                    </div>
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
                            <c:if test="${sessionScope.account.role == 'admin'}">
                                <li class="nav-item">
                                    <a class="nav-link" href="account">
                                        <i class="bi bi-people"></i> Account Management
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link " href="product">
                                    <i class="bi bi-shop"></i> Product Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="listOrder">
                                    <i class="bi bi-box"></i> Order Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Liststatistic">
                                    <i class="bi bi-bar-chart"></i> Statistic
                                </a>
                            </li>
                        </ul>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="profile.jsp">
                                    <i class="bi bi-person-square"></i> Profile
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">
                                    <i class="bi bi-box-arrow-left"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">List Order</h5>
                            </div>
                            <div class="p-3">
                                <div>
                                    <h5>Orders</h5>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex o-status">
                                        <c:if test="${status != 'pending' && status != 'shipping' && status != 'completed' && status !='cancelled'}">
                                            <a href="listOrder">
                                                <button class="btn btn-secondary">All</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=pending">
                                                <button class="btn btn-outline-primary">Pending</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=shipping">
                                                <button class="btn btn-outline-dark">Shipping</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=completed">
                                                <button class="btn btn-outline-success">Completed</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=cancelled">
                                                <button class="btn btn-outline-danger">Cancelled</button>
                                            </a>
                                        </c:if>
                                        <c:if test="${status == 'pending'}">
                                            <a href="listOrder">
                                                <button class="btn btn-outline-secondary">All</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=pending">
                                                <button class="btn btn-primary">Pending</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=shipping">
                                                <button class="btn btn-outline-dark">Shipping</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=completed">
                                                <button class="btn btn-outline-success">Completed</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=cancelled">
                                                <button class="btn btn-outline-danger">Cancelled</button>
                                            </a>
                                        </c:if>
                                        <c:if test="${status == 'shipping'}">
                                            <a href="listOrder">
                                                <button class="btn btn-outline-secondary">All</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=pending">
                                                <button class="btn btn-outline-primary">Pending</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=shipping">
                                                <button class="btn btn-dark">Shipping</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=completed">
                                                <button class="btn btn-outline-success">Completed</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=cancelled">
                                                <button class="btn btn-outline-danger">Cancelled</button>
                                            </a>
                                        </c:if>
                                        <c:if test="${status == 'completed'}">
                                            <a href="listOrder">
                                                <button class="btn btn-outline-secondary">All</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=pending">
                                                <button class="btn btn-outline-primary">Pending</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=shipping">
                                                <button class="btn btn-outline-dark">Shipping</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=completed">
                                                <button class="btn btn-success">Completed</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=cancelled">
                                                <button class="btn btn-outline-danger">Cancelled</button>
                                            </a>
                                        </c:if>
                                        <c:if test="${status == 'cancelled'}">
                                            <a href="listOrder">
                                                <button class="btn btn-outline-secondary">All</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=pending">
                                                <button class="btn btn-outline-primary">Pending</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=shipping">
                                                <button class="btn btn-outline-dark">Shipping</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=completed">
                                                <button class="btn btn-outline-success">Completed</button>
                                            </a>
                                            <a class="px-2" href="orderStatus?stt=cancelled">
                                                <button class="btn btn-danger">Cancelled</button>
                                            </a>
                                        </c:if>
                                    </div>
                                    <div class="d-flex">
                                        <input type="text" value="">
                                        <button>Search</button>
                                    </div>
                                </div>
                                <div class="table-responsive card shadow mt-2">
                                    <table class="table table-hover table-striped  mb-0">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Order</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Order status</th>
                                                <th scope="col">Payment status</th>
                                                <th scope="col" class="text-end">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="i">
                                                <tr>
                                                    <c:forEach items="${listA}" var="a">
                                                        <c:if test="${i.account_id == a.account_id}">
                                                            <td class="align-middle">
                                                                <a href="editOrder?oid=${i.order_id}&aid=${i.account_id}">
                                                                    <c:if test="${a.user ==''}">
                                                                        #${i.order_id} ${a.email}
                                                                    </c:if>
                                                                    <c:if test="${a.user != ''}">
                                                                        #${i.order_id} ${a.user}
                                                                    </c:if>    
                                                                </a>
                                                            </td>
                                                        </c:if>
                                                    </c:forEach>
                                                    <td class= "align-middle">
                                                        ${i.order_date}
                                                    </td>
                                                    <td class= "align-middle">
                                                        <c:if test="${i.order_status == 'pending' }">
                                                            <div class="border-danger bg-pending px-5 py-2 d-inline-block text-white rounded text-capitalize">
                                                                ${i.order_status}
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${i.order_status == 'completed' }">
                                                            <div class="border-danger bg-completed px-5 py-2 d-inline-block text-white rounded text-capitalize">
                                                                ${i.order_status}
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${i.order_status == 'shipping' }">
                                                            <div class="border-danger bg-shipping px-5 py-2 d-inline-block text-white rounded text-capitalize">
                                                                ${i.order_status}
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${i.order_status == 'cancelled' }">
                                                            <div class="border-danger bg-cancelled px-5 py-2 d-inline-block text-white rounded text-capitalize">
                                                                ${i.order_status}
                                                            </div>
                                                        </c:if>
                                                    </td>
                                                    <td class= "align-middle">
                                                        <c:if test="${i.payment_status == 'Payment in cash'}">
                                                            <div class="bg-secondary px-5 py-2 d-inline-block text-white rounded text-capitalize">
                                                                ${i.payment_status}
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${i.payment_status == 'Already paid'}">
                                                            <div class="border-danger bg-completed px-5 py-2 d-inline-block text-white rounded text-capitalize">
                                                                ${i.payment_status}
                                                            </div>
                                                        </c:if>
                                                    </td>
                                                    <td class= "align-middle text-end">
                                                        $ ${i.total_price}.00
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </main>
            </div>
        </div>    
    </body>
</html>
