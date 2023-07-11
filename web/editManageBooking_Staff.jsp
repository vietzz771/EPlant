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
        <title>Edit Information</title>
    </head>
    <body>
        <div class="container">
            <div class="login-page">
                <div class="form">
                    <form action="editbooking" method="post">
                        <h3 class="mb-4 text-center">Edit Status</h3>
                        <input type="hidden" value="${id}" name ="id"/>

                        <label>STATUS</label>
                       <select class="form-select form-select-sm" name="status" id="status">
  <c:choose>
    <c:when test="${detail.status == 'Taking Care'}">
      <option value="Waiting for contact" selected>Taking Care</option>
      <option value="Complete">Complete</option>
    </c:when>
    <c:otherwise>
      <option value="Taking Care">Taking Care</option>
      <option value="Complete">Complete</option>
      <option value="Waiting for contact" ${detail.status == 'Waiting for contact' ? 'selected' : ''}>Waiting for contact</option>
    </c:otherwise>
  </c:choose>
</select>


                        <br>

                        <input type="submit" value="Edit" class="edit">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
