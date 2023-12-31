<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Profile</title>

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
                <a class="nav-link active ms-0" href="profile.jsp">Profile</a>
            </nav>
            <hr class="mt-0 mb-4">

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
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card shadow-sm">
                            <div class="card-body pt-0 mt-3">
                                <form action="UpdateProfileServlet" method="post">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th width="30%">User</th>
                                            <td><input type="text" name="user" value="${sessionScope.account.user}" readonly></td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Full Name</th>
                                            <td><input type="text" name="full_name" value="${sessionScope.account.full_name}" required maxlength="100"></td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Gender</th>
                                            <td>
                                                <c:if test="${sessionScope.account.sex == ''}">
                                                    <select class="" name="sex" id="sex">
                                                        <option value="Others" selected>Others</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </c:if>
                                                <c:if test="${sessionScope.account.sex == 'Others'}">
                                                    <select class="" name="sex" id="sex">
                                                        <option value="Others" selected>Others</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </c:if>
                                                <c:if test="${sessionScope.account.sex == 'Male'}">
                                                    <select class="" name="sex" id="sex">
                                                        <option value="Others" >Others</option>
                                                        <option value="Male" selected>Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </c:if>
                                                <c:if test="${sessionScope.account.sex == 'Female'}">
                                                    <select class="" name="sex" id="sex">
                                                        <option value="Others" >Others</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female" selected>Female</option>
                                                    </select>
                                                </c:if>
                                                <!--<input type="text" name="sex" value="${sessionScope.account.sex}" required>-->
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Birthday</th>
                                            <td>
                                                <input name="birthday" type="text" placeholder="BirthDay" value="${sessionScope.account.birthday}" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" required />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Address</th>
                                            <td><input type="text" name="address" value="${sessionScope.account.address}" required></td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Phone</th>
                                            <td><input type="text" name="phone" value="${sessionScope.account.phone}" required maxlength="10" pattern="[0-9]{10}" onkeyup="this.value = this.value.replace(/[^0-9]/g, '');" title="Must constrain at 10 numbers" ></td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Email</th>
                                            <td><input type="text" name="email" value="${sessionScope.account.email}" required maxlength="50" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"></td>
                                        </tr>
                                    </table>
                                    <a href="profile.jsp" class="btn btn-success">Back</a>
                                    <button class="btn btn-success" type="submit" name="saveBtn" formaction="UpdateProfileServlet">Save</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
