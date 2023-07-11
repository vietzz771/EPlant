<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>User Profile</title>

        <link rel="stylesheet" href="assets/css/profile.css" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                <c:if test="${sessionScope.account.role == 'user'}">
                    <a class="nav-link  ms-0" href="/Eplant/">Home Page</a>
                </c:if>
                <c:if test="${sessionScope.account.role == 'admin'}">
                    <a class="nav-link  ms-0" href="/Eplant/account">Home Page</a>
                </c:if>
                <a class="nav-link active ms-0" href="#" target="__blank">Profile</a>
            </nav>
            <hr class="mt-0 mb-4">
            <%-- Kiểm tra xem đối tượng account có tồn tại trong session hay không --%>
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <div class="card-header bg-transparent text-center">
                                <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                <h3>${sessionScope.account.full_name}</h3>
                            </div>
                            <div class="card-body">
                                <p class="mb-0"><strong class="pr-1">Role: </strong>  ${sessionScope.account.role}</p>
                            </div>
                            <a class="btn btn-primary" href="changePassword.jsp">Change Password</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card shadow-sm">

                            <div class="card-body pt-0">
                                <table class="table table-bordered">
                                    <tr>
                                        <th width="30%">Full Name</th>
                                        <td>${sessionScope.account.full_name}</td>
                                    </tr>

                                    <tr>
                                        <th width="30%">Gender</th>
                                        <td>${sessionScope.account.sex}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Birthday</th>
                                        <td>${sessionScope.account.birthday}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Address</th>
                                        <td>${sessionScope.account.address}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Phone</th>
                                        <td>${sessionScope.account.phone}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Email</th>
                                        <td>${sessionScope.account.email}</td>
                                    </tr>
                                </table>
                                <button class="btn btn-primary" type="button" onclick="redirectToJSP()">Edit</button>

                                <script>
                                    function redirectToJSP() {
                                        // Chuyển hướng đến trang JSP khác
                                        window.location.href = 'editProfile.jsp';
                                    }
                                </script>

                            </div>
                        </div>  
                        <!-- Save changes button-->

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
