<%-- 
    Document   : edit
    Created on : Mar 24, 2023, 10:25:17 AM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/edit.css"/>
        <title>Edit Product</title>
    </head>
    <body>
        <div class="container">
            <div class="login-page">
                <div class="form">
                    <form action="edit" method="post">
                        <h3 class="mb-4 text-center">Edit Product</h3>
                        <input type="hidden" value="${id}" name = "id"/>
                        <label>Name</label>
                        <input name="name" type="text" placeholder="Name" value="${detail.name}"/>
                        <label>Image</label>
                        <input name="img" type="text" placeholder="Image" value="${detail.image}"/>
                        <label>Description</label>
                        <input name="des" type="text" placeholder="Description" value="${detail.description}"/>
                        <label>Category</label>
                        <input name="category" type="number" placeholder="Category" value="${detail.cid}"/>
                        <label>Price</label>
                        <input name="price" type="number" placeholder="Price" value="${detail.price}"/>
                        <label>Quantity</label>
                        <input name="quantity" type="number" placeholder="Quantity" value="${detail.quantity}"/>
                        <input type="submit" value="Edit" class="edit">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>