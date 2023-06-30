<%-- 
    Document   : dashboard.jsp
    Created on : Mar 24, 2023, 7:02:30 AM
    Author     : Hades
--%>
<%@ page import="java.util.UUID" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- Banner -->
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/admin.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>JSP Page</title>
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
                                <a class="nav-link active" href="#">
                                    <i class="bi bi-people"></i> Quản lí tài khoản
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
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-key-fill"></i> Đổi mật khẩu
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
                    <h2>${action.equals("search") ? "Kết quả tìm kiếm" : "Danh sách người dùng"}</h2>
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
                <div class="row justify-content-end">
                    <div class="col-md-2">
                        <div class="input-group-append">
                            <button id="addUserButton" type="button" class="btn btn-primary">Thêm người dùng</button>
                        </div>
                    </div>
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
                                                <th scope="col" >STT</th>
                                                <th scope="col" >Vai trò</th>
                                                <th scope="col" >Người dùng</th>
                                                <th scope="col" >Họ tên</th>
                                                <th scope="col" >Giới tính</th>
                                                <th scope="col" >Ngày sinh</th>
                                                <th scope="col" >Địa chỉ</th>
                                                <th scope="col" >Số điện thoại</th>
                                                <th scope="col" >Email</th>
                                                <th scope="col" >Xóa</th>
                                                <th scope="col" >Chỉnh sửa</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="i">
                                                <tr>
                                                    <td>${i.account_id}</td>
                                                    <td>${i.role}</td>
                                                    <td>${i.user}</td>
                                                    <td>${i.full_name}</td>
                                                    <td>${i.sex}</td>
                                                    <td>${i.birthday}</td>
                                                    <td>${i.address}</td>
                                                    <td>${i.phone}</td>
                                                    <td>${i.email}</td>
                                                    <td>
                                                        <a role="button" class="btn btn-danger" href="delete-account?account_id=${i.account_id}">Xóa</a>
                                                    </td>
                                                    <td>
                                                        <a role="button" class="btn btn-info" href="updateAccount?account_id=${i.account_id}">Chỉnh sửa</a>
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
            <div class="form-modal-ex">
                <!-- Modal -->
                <div class="modal fade text-left" id="addForm" tabindex="-1" aria-labelledby="myModalLabel33"
                     style="display: none;" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel34">Thêm Người dùng</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="AddAccount" method="post">
                                    <div class="form-group">
                                        <label for="user">Tên tài khoản</label>
                                        <input type="text" id="user" name="user" class="form-control" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" class="form-control" name="password" id="password" placeholder autocomplete="current-password">
                                    </div>
                                    <div class="form-group">
                                        <label for="full_name">Họ tên Người dùng</label>
                                        <input type="text" class="form-control" name="full_name" id="full_name" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input name="email" type="email" class="form-control" id="email" placeholder autocomplete="username">
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Địa chỉ</label>
                                        <input name="address" type="text" class="form-control" id="address" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="role">Chức năng</label>
                                        <select class="form-control" name="role" id="role">
                                            <option value="User">User</option>
                                            <option value="cService">cService</option>
                                            <option value="Staff">Sale Staff</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="birthday">Ngày sinh</label>
                                        <input name="birthday" type="date" class="form-control" id="birthday" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="sex">Giới tính</label>
                                        <select class="form-control" name="sex" id="sex">
                                            <option value="Nam">Nam</option>
                                            <option value="Nữ">Nữ</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-success mt-3 col-md-5 float-right">Tạo tài khoản</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bao gồm thư viện jQuery -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <!-- Bao gồm thư viện Bootstrap -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

            <!-- Đặt thẻ script chứa mã JavaScript sau thẻ script chứa thư viện Bootstrap -->
            <script>
                // Bắt sự kiện nhấp vào nút "Thêm người dùng"
                document.getElementById('addUserButton').addEventListener('click', function () {
                    // Hiển thị bảng modal "Thêm Người dùng"
                    $('#addForm').modal('show');
                });
            </script>

            <script>
                // Bắt sự kiện nhấp vào biểu tượng "X" để tắt form và quay trở lại trang account
                document.querySelector('#addForm .close').addEventListener('click', function () {
                    // Ẩn form modal
                    document.getElementById('addForm').style.display = 'none';

                    // Quay trở lại trang account
                    window.location.href = '/Eplant/account';
                });
            </script>



        </div>    
    </body>
</html>