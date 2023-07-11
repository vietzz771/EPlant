<%-- 
    Document   : dashboard.jsp
    Created on : Mar 24, 2023, 7:02:30 AM
    Author     : Hades
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Banner -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/admin.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>List Product</title>

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
                    <a class="navbar-brand py-lg-2 px-lg-6 me-0" href="#">
                        <img src="assets/images/logo.png" alt="...">
                        <span class="text-uppercase fw-border ms-2">Eplant</span>
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
                            <h2 class=" text-dark text-center">Hello ${sessionScope.account.full_name}</h2>
                        </c:if>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="/Eplant/AppointmentSchedule">
                                    <i class="bi-alarm"></i> Quản lí lịch hẹn
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
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">Manage Tree Care Information
                                </h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Booking #</th>
                                            <th scope="col">Customer Name</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Care Package</th>
                                            <th scope="col">Type of Tree</th>
                                            <th scope="col">Start date</th>
                                            <th scope="col">Start time</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Note</th>
                                            <th scope="col">Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listMyBooking}" var="b">
                                            <c:if test="${b.staff_id == sessionScope.account.account_id}">
                                                <tr>

                                                    <td class= "align-middle"  value="${b.appointmentSchedule_id}">
                                                        ${b.appointmentSchedule_id}
                                                    </td>
                                                    <c:forEach items="${list}" var="l">
                                                        <c:if test="${b.user_id == l.account_id}">
                                                            <td class= "align-middle">
                                                                ${l.full_name}
                                                            </td>   
                                                            <td class= "align-middle">
                                                                ${l.phone}
                                                            </td>

                                                        </c:if>

                                                    </c:forEach>    

                                                    <td class= "align-middle">
                                                        ${b.care_package_name}
                                                    </td>
                                                    <td class= "align-middle">
                                                        ${b.type_of_tree}
                                                    </td>
                                                    <td class= "align-middle">
                                                        ${b.appointment_start_date}
                                                    </td>
                                                    <td class= "align-middle">
                                                        ${b.appointment_start_time}.00h
                                                    </td>
                                                    <c:forEach items="${listCarePackage}" var="c">
                                                        <c:if test="${c.care_package_id == b.care_package_id}">

                                                            <td class= "align-middle">
                                                                ${c.price} $

                                                            </td>
                                                        </c:if>
                                                    </c:forEach>    
                                                    <td class= "align-middle">
                                                        ${b.appointment_note}

                                                    </td>   
                                                    <td class="align-middle border
                                                        ${b.status == 'Taking Care' ? 'bg-warning' : 
                                                          b.status == 'Complete' ? 'bg-success' :
                                                          b.status == 'Waiting for contact' ? 'bg-primary' : ''}">
                                                            ${b.status}
                                                        </td>
                                                        <td class= "align-middle">
                                                            <a href="editbooking?id=${b.appointmentSchedule_id}">
                                                                <button type="button" class="btn btn-sm btn-square btn-neutral ">
                                                                    <i class="bi bi-pencil"></i>
                                                                </button>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:if>
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