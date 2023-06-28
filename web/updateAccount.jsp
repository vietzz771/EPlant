<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Tên trang: updateAccount.jsp -->

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Account</title>
    <link rel="stylesheet" href="assets/css/admin.css"/>
           <jsp:useBean id = "t" class = "dao.DAO" scope="request"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h2>Update Account</h2>
        <form action="updateAccount" method="POST" onsubmit="showSuccessMessage()">

            <div class="form-group">
                <label for="account_id">Account ID:</label>
                <input type="text" class="form-control" id="account_id" name="account_id" value="${param.account_id}" readonly>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <input type="text" class="form-control" id="role" name="role" value="${t.getAccountById(param.account_id).getRole()}" >
            </div>
            <div class="form-group">
                <label for="user">User:</label>
                <input type="text" class="form-control" id="user" name="user" value="${t.getAccountById(param.account_id).getUser()}"readonly>
            </div>
            <div class="form-group">
                <label for="full_name">Full Name:</label>
                <input type="text" class="form-control" id="full_name" name="full_name" value="${t.getAccountById(param.account_id).getFull_name()}">
            </div>
            <div class="form-group">
                <label for="sex">Sex:</label>
                <input type="text" class="form-control" id="sex" name="sex" value="${t.getAccountById(param.account_id).getSex()}">
            </div>
            <div class="form-group">
                <label for="birthday">Birthday:</label>
                <input type="text" class="form-control" id="birthday" name="birthday" value="${t.getAccountById(param.account_id).getBirthday()}">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" value="${t.getAccountById(param.account_id).getAddress()}">
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${t.getAccountById(param.account_id).getPhone()}">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" class="form-control" id="email" name="email" value="${t.getAccountById(param.account_id).getEmail()}">
            </div>
                <button type="submit" class="btn btn-primary">Update</button>
        </form>

    </div>
</body>
<script>
    function showSuccessMessage() {
        alert("Update successful!");
    }
</script>
</html>
