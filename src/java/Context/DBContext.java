/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author DELL
 */
public class DBContext {

  public Connection getConnection() throws Exception {
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        // Tạo kết nối đến cơ sở dữ liệu
        String dbUser = "sa";
        String dbPassword = "123";
        String port = "1433";
        String IP = "127.0.0.1";
        String ServerName = "DESKTOP-QRGLSIH\\YUNBEN";
        String DBName = "EPlant";
        String dbUrl = "jdbc:sqlserver://" + ServerName + ";databaseName=" + DBName + ";encrypt=false;trustServerCertificate=false;loginTimeout=30";
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        return con;
    } catch (Exception e) {
        // In thông báo lỗi khi có vấn đề trong quá trình kết nối
        e.printStackTrace();
    }
    return null;
}

public static void main(String[] args) {
    try {
        Connection connection = new DBContext().getConnection();
        if (connection != null) {
            System.out.println("Kết nối thành công đến cơ sở dữ liệu.");
        } else {
            System.out.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
