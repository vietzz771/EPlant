<%-- 
    Document   : dashboard.jsp
    Created on : Mar 24, 2023, 7:02:30 AM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Banner -->
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/admin.css"/>
        <link rel="stylesheet" href="assets/css/paging.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>Statistic</title>
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
                            <li class="nav-item">
                                <a class="nav-link " href="account">
                                    <i class="bi bi-people"></i> Account Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product">
                                    <i class="bi bi-shop"></i> Product Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listOrder">
                                    <i class="bi bi-box"></i> Order Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="Liststatistic">
                                    <i class="bi bi-bar-chart"></i> Statistic
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-chat"></i> Message
                                    <span class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-auto">6</span>
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
            <!------------------------------------------------------------------------------------------------------>

            <!-- Main content -->
            <div class="container mt-3">
                <div class="col-md-12 text-center mb-3">
                    <h2>${action.equals("search") ? "Search results" : "List statistic"}</h2>
                </div>
                <div class="row justify-content-center align-items-center">
                    <form action="SearchAccount" method="POST" class="row justify-content-center align-items-center">
                        <div class="col-md-6">
                            <div class="input-group">
                                <input class="form-control form-control-sm" name="fullname" type="search" placeholder="Search..." aria-label="Search">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group-append">
                                <button class="btn btn-outline-success" type="submit">Search</button>
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
                                                <th scope="col"  >Serial</th>
                                                <th scope="col"  >Name</th>
                                                <th scope="col" >Product</th>
                                                <th scope="col" >Date</th>
                                                <th scope="col" >QTY</th>
                                                <th scope="col" >Subtotal</th>
                                                <th scope="col">Total</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listA}" var="o">
                                                <tr>
                                                    <td>${o.stt}</td>
                                                    <td>${o.customerName}</td>
                                                    <td>${o.productName}</td>
                                                    <td>${o.saleDate}</td>
                                                    <td>${o.quantity}</td>
                                                    <td>${o.unitPrice}</td>
                                                    <td>${o.totalPrice}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="clearfix text-center">
                                    <div class="hint-text ">Showing <b>${tag}</b> out of <b>${totalPages}</b> pages</div>
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${tag>1}">
                                            <li class="page-item">
                                                <a href="Liststatistic?index=${tag-1}" class="page-link">Previous</a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${tag == i ? 'active' : ''}">
                                                <a href="Liststatistic?index=${i}" class="page-link">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${tag<endP}">
                                            <li class="page-item">
                                                <a href="Liststatistic?index=${tag+1}" class="page-link">Next</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </div>    
    </body>
</html>