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
                                <a class="nav-link" href="/Eplant/account">
                                    <i class="bi bi-people"></i> Quản lí tài khoản
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <i class="bi bi-shop"></i> Quản lí sản phẩm
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="statistic.jsp">
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
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">List Product</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Image</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Quantity</th>
                                            <th scope></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <form action="add-product" method="post">
                                        <tr>
                                            <td>
                                                <input name="img" type="text" placeholder="Enter image">
                                            </td>
                                            <td>
                                                <input name="name" type="text" placeholder="Enter name">
                                            </td>
                                            <td>
                                                <input name="price" type="number" placeholder="Enter price">
                                            </td>
                                            <td>
                                                <input name="category" type="number" placeholder="Enter category">
                                            </td>
                                            <td>
                                                <input name="quantity" type="number" placeholder="Enter quantity">
                                            </td>
                                            <td>
                                                <input name="des" type="text" placeholder="Enter description">
                                            </td>
                                            <td class="text-end">
                                                <input type="submit" value="Add Product">
                                            </td>
                                        </tr>
                                    </form>
                                    <c:forEach items="${list}" var="p">
                                        <tr>
                                            <td>
                                                <img alt="..." src="${p.image}" class="avatar avatar-sm rounded-circle me-2">
                                            </td>
                                            <td class= "align-middle">
                                                ${p.name}
                                            </td>
                                            <td class= "align-middle">
                                                $ ${p.price}.00
                                            </td>
                                            <td class= "align-middle">
                                                <c:forEach items="${listCate}" var="c">
                                                    <c:if test="${p.cid == c.cid}">
                                                        ${c.cname}
                                                    </c:if>
                                                </c:forEach>    
                                            </td>
                                            <td class= "align-middle">
                                                ${p.quantity}
                                            </td>
                                            <td>
                                            </td>
                                            <td class="text-end">
                                                <a href="edit?id=${p.productID}">Edit</a>
                                                <a href="delete-product?id=${p.productID}">
                                                    <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </a>
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