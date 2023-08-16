<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/start.jsp" %>
<%@ include file="/includes/navbar.jsp" %>
<%@ include file="/includes/header.jsp" %>

<%@ include file="/includes/collection.jsp" %>
<%@ include file="/includes/offer.jsp" %>
<%@ include file="/includes/newsletter.jsp" %>
<%@ include file="/includes/footer.jsp" %>

<%@ include file="/includes/end.jsp" %>
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

        socket.onopen = function(event) {
             console.log("WebSocket is connected.");
        var fullName = "${sessionScope.account.full_name}";
        socket.send(fullName);
        };

        socket.onmessage = function(event) {
            var chatOutput = document.getElementById("chatOutput");
            chatOutput.innerHTML += "<p>" + event.data + "</p>";
            // Cuộn xuống dòng cuối cùng để hiển thị tin nhắn mới nhất
            chatOutput.scrollTop = chatOutput.scrollHeight;
        };

        socket.onclose = function(event) {
            console.log("WebSocket is closed.");
        };

        function sendMessage() {
            var messageInput = document.getElementById("messageInput");
            var message = messageInput.value;
            socket.send(message);
            messageInput.value = "";
        }
    </script>
</body>