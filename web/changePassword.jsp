<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="assets/css/profile.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body>
    <div class="container-xl px-4 mt-4">
        <nav class="nav nav-borders">
            <a class="nav-link  ms-0" href="/Eplant/" >Trang chủ</a>
            <a class="nav-link active ms-0" href="profile.jsp" >Profile</a>
        </nav>
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4">
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Profile Picture</div>
                    <div class="card-body text-center">
                        <div class="card-header bg-transparent text-center">
                            <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                            <h3>${account.full_name}</h3>
                        </div>
                        <div class="card-body">
                            <p class="mb-0"><strong class="pr-1">Role: </strong>${account.role}</p>
                        </div>
                    </div>
                </div>
            </div>
                        
            <div class="col-xl-8">
                <div class="card mb-4">
                    <div class="card-header">Change Password</div>
                    <div class="card shadow-sm">
                        <div class="card-body pt-0">
                            <form action="ChangePassword" method="POST">
                                <table class="table table-bordered">
                                    <tr>
                                        <th width="30%">Old Password</th>
                                        <td>
                                            <div class="input-group">
                                                <input type="password" name="password" class="form-control" placeholder="Please enter your old password" required >
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="bi bi-eye-slash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th width="30%">New Password</th>
                                        <td>
                                            <div class="input-group">
                                                <input type="password" name="newPassword" class="form-control" placeholder="Please enter your new password" required maxlength="50" pattern="(?=.*\d)(?=.*[a-z]).{8,}" title="Must contain at least one number and at least 8 or more characters">
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="bi bi-eye-slash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Confirm password</th>
                                        <td>
                                            <div class="input-group">
                                                <input type="password" name="confirmPassword" class="form-control" placeholder="Please re-enter your new password">
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="bi bi-eye-slash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <input type="hidden" name="account_id" value="${account.account_id}">
                                <button class="btn btn-primary" type="submit">Save</button>
                            </form>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>

    <script>
        const togglePasswordButtons = document.querySelectorAll(".toggle-password");

        togglePasswordButtons.forEach(function(button) {
            button.addEventListener("click", function() {
                const passwordInput = button.previousElementSibling;
                const passwordIcon = button.querySelector("i");

                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    passwordIcon.classList.remove("bi-eye-slash");
                    passwordIcon.classList.add("bi-eye");
                } else {
                    passwordInput.type = "password";
                    passwordIcon.classList.remove("bi-eye");
                    passwordIcon.classList.add("bi-eye-slash");
                }
            });
        });
    </script>
</body>
</html>
