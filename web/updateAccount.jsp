
<%-- 
    Document   : edit
    Created on : Mar 24, 2023, 10:25:17 AM
    Author     : Hades
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/edit.css"/>
        <title>Edit Product</title>
        <head>
           <jsp:useBean id = "t" class = "dao.DAO" scope="request"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
    </head>
    <body>
        <div class="container">
            <div class="login-page">
                <div class="form">
        <form action="updateAccount" method="POST" onsubmit="showSuccessMessage()">
                        <h3 class="mb-4 text-center">Update Account</h3>
                        <input type="hidden" value="${id}" name = "id"/>
                         <label for="account_id">Account ID:</label>
                <input type="text" class="form-control" id="account_id" name="account_id" value="${param.account_id}" readonly>
                
                      <label for="role">Role:</label>
                <input type="text" class="form-control" id="role" name="role" value="${t.getAccountById(param.account_id).getRole()}" >
                
                       <label for="user">User:</label>
                <input type="text" class="form-control" id="user" name="user" value="${t.getAccountById(param.account_id).getUser()}"readonly>
                
                         <label for="full_name">Full Name:</label>
                <input type="text" class="form-control" id="full_name" name="full_name" value="${t.getAccountById(param.account_id).getFull_name()}">
                
                       <label for="sex">Sex:</label>
                <input type="text" class="form-control" id="sex" name="sex" value="${t.getAccountById(param.account_id).getSex()}">
                
                      <label for="birthday">Birthday:</label>
                <input type="text" class="form-control" id="birthday" name="birthday" value="${t.getAccountById(param.account_id).getBirthday()}">
                
                   <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" value="${t.getAccountById(param.account_id).getAddress()}">
                
                   <label for="phone">Phone Number:</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${t.getAccountById(param.account_id).getPhone()}">
                
                <label for="email">Email:</label>
                <input type="text" class="form-control" id="email" name="email" value="${t.getAccountById(param.account_id).getEmail()}">
                
                        <input type="submit" value="Edit" class="edit">
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script>
    function showSuccessMessage() {
        alert("Update successful!");
    }
</script>
</html>