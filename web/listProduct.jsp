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
        <title>Product Management</title>
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
                            <c:if test="${sessionScope.account.role == 'admin'}">
                                <li class="nav-item">
                                    <a class="nav-link" href="account">
                                        <i class="bi bi-people"></i> Account Management
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link active" href="product">
                                    <i class="bi bi-shop"></i> Product Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="listOrder">
                                    <i class="bi bi-box"></i> Order Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Liststatistic">
                                    <i class="bi bi-bar-chart"></i> Statistic
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
            <head>
                <title>WebSocket Chat</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
                <style>
                    /* CSS cho icon chat */
                    .chat-icon {
                        position: fixed;
                        bottom: 20px;
                        right: 20px;
                        width: 50px;
                        height: 50px;
                        background-color: #007bff;
                        color: #fff;
                        border-radius: 50%;
                        text-align: center;
                        line-height: 50px;
                        cursor: pointer;
                        z-index: 9999;
                    }

                    /* CSS cho khung chat */
                    .chat-box {
                        position: fixed;
                        bottom: 80px;
                        right: 20px;
                        width: 300px;
                        height: 400px;
                        background-color: #f1f1f1;
                        border: 1px solid #ccc;
                        border-radius: 8px;
                        display: none;
                        z-index: 9999;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                    }

                    .chat-box-header {
                        background-color: #007bff;
                        color: #fff;
                        padding: 10px;
                        border-top-left-radius: 8px;
                        border-top-right-radius: 8px;
                    }

                    .chat-box-content {
                        padding: 10px;
                        height: 300px;
                        overflow-y: auto;
                    }

                    .chat-box-input {
                        display: flex;
                        align-items: center;
                        border-top: 1px solid #ccc;
                        padding: 10px;
                    }

                    .chat-box-input input[type="text"] {
                        flex: 1;
                        padding: 5px;
                        border: 1px solid #ccc;
                        border-radius: 4px;
                    }

                    .chat-box-input button {
                        margin-left: 10px;
                        background-color: #007bff;
                        color: #fff;
                        padding: 6px 12px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                    }
                </style>
            </head>
            <body>
                <div class="chat-icon" onclick="toggleChatBox()">
                    <i class="fas fa-comments"></i>
                </div>

                <!-- Khung chat (ẩn ban đầu) -->
                <div id="chatBox" class="chat-box" style="display: none;">
                    <div class="chat-box-header">Tư vấn khách hàng</div>
                    <div class="chat-box-content" id="chatOutput"></div>
                    <div class="chat-box-input">
                        <input type="text" id="messageInput" placeholder="Nhập tin nhắn..." />
                        <button onclick="sendMessage()">Gửi</button>
                    </div>
                </div>

                <script>
                    // Lấy tham chiếu đến các phần tử HTML của khung chat và input tin nhắn
                    var chatBox = document.getElementById("chatBox");
                    var messageInput = document.getElementById("messageInput");

                    function toggleChatBox() {
                        chatBox.style.display = (chatBox.style.display === "none") ? "block" : "none";
                        if (chatBox.style.display === "block") {
                            // Đặt trạng thái focus vào input tin nhắn khi khung chat hiển thị
                            messageInput.focus();
                        }
                    }

                    var socket = new WebSocket("ws://localhost:8080/Eplant/chatRoomServer"); // Thay 'your-app-name' bằng tên ứng dụng của bạn

                    socket.onopen = function (event) {
                        console.log("WebSocket is connected.");
                        var fullName = "${sessionScope.account.full_name}";
                        socket.send(fullName);
                    };

                    socket.onmessage = function (event) {
                        var chatOutput = document.getElementById("chatOutput");
                        chatOutput.innerHTML += "<h6>" + event.data + "</h6>";
                        // Cuộn xuống dòng cuối cùng để hiển thị tin nhắn mới nhất
                        chatOutput.scrollTop = chatOutput.scrollHeight;
                    };

                    socket.onclose = function (event) {
                        console.log("WebSocket is closed.");
                    };

                    function sendMessage() {
                        var messageInput = document.getElementById("messageInput");
                        var message = messageInput.value;
                        socket.send(message);
                        messageInput.value = "";
                    }
                </script>
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
                                                    <input name="img" type="text" placeholder="Enter image link" required>
                                                </td>
                                                <td>
                                                    <input name="name" type="text" placeholder="Enter name" required>
                                                </td>
                                                <td>
                                                    <input name="price" type="number" placeholder="Enter price" required>
                                                </td>
                                                <td>
                                                    <input name="category" type="number" placeholder="Enter category" required>
                                                </td>
                                                <td>
                                                    <input name="quantity" type="number" placeholder="Enter quantity" required>
                                                </td>
                                                <td>
                                                    <input name="des" type="text" placeholder="Enter description" required>
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