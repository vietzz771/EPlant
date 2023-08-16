
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/chatRoomServer")
public class ChatRoomServerEndpoint {

    static Set<Session> users = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void handleOpen(Session session) {
        users.add(session);

        // Lấy tên người dùng từ session và gửi đến phiên WebSocket mới kết nối.
        String username = (String) session.getUserProperties().get("username");
        if (username != null) {
            try {
                session.getBasicRemote().sendText("Hệ thống: bạn được kết nối với tên là " + username);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnMessage
    public void handleMessage(String message, Session userSession) throws IOException {
        String username = (String) userSession.getUserProperties().get("username");
        if (username == null) {
            userSession.getUserProperties().put("username", message);
            userSession.getBasicRemote().sendText("Hệ thống: bạn được kết nối với tên là " + message);
        } else {
            for (Session session : users) {
                session.getBasicRemote().sendText(username + ": " + message);
            }
        }
    }

    @OnClose
    public void handleClose(Session session) {
        users.remove(session);
    }

    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace();
    }

}
