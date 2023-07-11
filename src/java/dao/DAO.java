/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Entity.Staff;
import Entity.MyBooking;
import Entity.Booking;
import Entity.BookingStaff;
import Entity.CarePackage;
import Context.DBContext;
import Entity.Account;
import Entity.Cart;
import Entity.Category;
import Entity.CategoryName;
import Entity.Item;
import Entity.Order;
import Entity.OrderDetail;
import Entity.OrderInfo;
import Entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hades
 */
public class DAO {

    PreparedStatement ps;
    ResultSet rs;
    Connection con;

    public Account Login(String user, String pass) {
        String query = "select * from  Account where [user] = ? and password = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareCall(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account CheckAccountExist(String user) {
        String query = "select * from  Account where [user] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareCall(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void Register(String user, String password, String full_name, String phone, String email, String address, String role, String birthday, String sex) {
        String query = "insert into Account values(?,?,?,?,?,?,?,?,?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareCall(query);
            ps.setString(1, user);
            ps.setString(2, password);
            ps.setString(3, full_name);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setString(7, role);
            ps.setString(8, birthday);
            ps.setString(9, sex);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateStatus(String status, String oid) {
        String query = "UPDATE [Order] SET order_status = ? WHERE order_id = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareCall(query);
            ps.setString(1, status);
            ps.setString(2, oid);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý lỗi
        }
    }

    public void UpdateProfile(String user, String full_name, String phone, String email, String address, String birthday, String sex) {
        String query = "UPDATE Account SET full_name=?, phone=?, email=?, address=?, birthday=?, sex=? WHERE [user]=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareCall(query);
            ps.setString(1, full_name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, birthday);
            ps.setString(6, sex);
            ps.setString(7, user);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý lỗi
        }
    }

    public List<Account> getListAccount() {
        List<Account> list = new ArrayList<>();
        String query = "SELECT * from Account";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                )
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

//    public void addAdminAccount(Account account) {
//        try {
//            String query = "insert into Account([user], password, [full_name], phone,email,address, role) value(?,?,?,?,?,?,?)";
//            con = new DBContext().getConnection();
//            ps = con.prepareStatement(query);
////            set gia tri 
//             ps.setString(1, user);
//            ps.setString(2, password);
//            ps.setString(3, full_name);
//            ps.setString(4, phone);
//            ps.setString(5, email);
//            ps.setString(6, address);
//            ps.setString(7, role);
//
//            ps.executeUpdate();
//        } catch (Exception e) {
//            System.out.println("Error: " + e);
//        }
//    }
    public void deleteAccount(String id) {
        try {
            String query = "delete from Account \n"
                    + "Where account_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
//            set gia tri 
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
//=====================================================================//

    public void updateAccount(int account_id, String full_name, String role, String phone, String email, String address, String birthday, String sex, String user) {
        String query = "UPDATE Account SET full_name = ?, role = ?, phone = ?, email = ?, [address] = ?, birthday = ?, sex = ?, [user] = ? WHERE account_id = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, full_name);
            ps.setString(2, role);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setString(6, birthday);
            ps.setString(7, sex);
            ps.setString(8, user);
            ps.setInt(9, account_id);

            ps.executeUpdate();

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account getAccountByUser(String user) {
        Account acc = new Account();
        String query = "SELECT * from Account where [user] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return acc;
    }

    //=====================================================================//
    public Account getAccountById(int account_id) {
        Account acc = new Account();
        String query = "SELECT * from Account where account_id = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, account_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return acc;
    }
    //=========================================================================//

//=========================================================================//
    public List<Account> searchAccount(String txtSearch) {
        try {
            String query = "select * from [Account] where full_name like ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            List<Account> list = new ArrayList<>();
            while (rs.next()) {
                Account e = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

//=========================================================================//
    public boolean addAccount(String user, String password, String full_name, String phone, String email, String address, String role, String birthday, String sex) {
        String query = "INSERT INTO Account VALUES (?,?,?,?,?,?,?,?,?)";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, password);
            ps.setString(3, full_name);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setString(7, role);
            ps.setString(8, birthday);
            ps.setString(9, sex);

            ps.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

//=========================================================================//
//=========================================================================//
    public void changePassword(String account_id, String oldPassword, String newPassword) {
        String query = "SELECT * FROM Account WHERE account_id = ? AND password = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, account_id);
            ps.setString(2, oldPassword);
            rs = ps.executeQuery();
            if (rs.next()) {
                String sql = "UPDATE Account SET password = ? WHERE account_id = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, newPassword);
                ps.setString(2, account_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //=========================================================================//

    public void deleteProduct(int id) {
        try {
            String query = "delete from ProductCase Where product_id = ?";
            String query2 = "delete from Product Where product_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps.setInt(1, id);
            ps2.setInt(1, id);
            ps.executeUpdate();
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void editProduct(Product product, int id) {
        try {
            String query = "update Product set [name] = ?, [image] = ?,[description] = ?, category_id = ? where product_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setString(3, product.getDescription());
            ps.setInt(4, product.getCid());
            ps.setInt(5, id);
            ps.executeUpdate();
            String query2 = "update ProductCase set price = ?, quantity = ? where product_id = ?";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps2.setInt(1, product.getPrice());
            ps2.setInt(2, product.getQuantity());
            ps2.setInt(3, id);
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void addProduct(Product product) {
        try {
            String query = "insert into Product([name], [image], [description], category_id)\n"
                    + "Values (?,?,?,?);";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
//            set gia tri 
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
//            ps.setInt(3, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setInt(4, product.getCid());
            ps.executeUpdate();
            String query2 = "insert into ProductCase(price, quantity) Values (?, ?)";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps2.setInt(1, product.getPrice());
            ps2.setInt(2, product.getQuantity());
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public List<Product> getTopProduct() {
        try {
            String query = "SELECT top 8 p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity   \n"
                    + "FROM Product p  \n"
                    + "INNER JOIN ProductCase o  \n"
                    + "ON p.product_id = o.product_id  ";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product e = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Product> getTopProductByCID(String cid, String id) {
        try {
            String query = "SELECT top 4 p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity\n"
                    + "FROM Product p\n"
                    + "INNER JOIN ProductCase o \n"
                    + "ON p.product_id = o.product_id\n"
                    + "where p.category_id = ?\n"
                    + "AND p.product_id <> ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, cid);
            int pID = Integer.parseInt(id);
            ps.setInt(2, pID);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product e = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        try {
            String query = "SELECT p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity   \n"
                    + "FROM Product p  \n"
                    + "INNER JOIN ProductCase o  \n"
                    + "ON p.product_id = o.product_id  \n"
                    + "where p.[name] like ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product e = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Product> getListProduct() {
        try {
            String query = "SELECT p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity   \n"
                    + "FROM Product p  \n"
                    + "INNER JOIN ProductCase o  \n"
                    + "ON p.product_id = o.product_id  ";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product e = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Category> getListCategory() {
        try {
            String query = "Select * from Category";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category e = new Category(rs.getInt(1),
                        rs.getString(2)
                );
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public CategoryName getCategoryName(String cid) {
        try {
            String query = "select top 1 c.category_name \n"
                    + "from Product p inner join Category c\n"
                    + "on p.category_id = c.category_id\n"
                    + "where c.category_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new CategoryName(rs.getString(1)
                );
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Product> getProductByCid(String cid) {
        try {
            String query = "SELECT p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity   \n"
                    + "FROM Product p  \n"
                    + "INNER JOIN ProductCase o  \n"
                    + "ON p.product_id = o.product_id  \n"
                    + "where p.category_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product e = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public int getTotalProduct() {
//        PreparedStatement ps;
//        ResultSet rs;
//        Connection con;
        try {
            String query = "select count(*) from Product";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> paging(int index) {
//        PreparedStatement ps;
//        ResultSet rs;
//        Connection con;
        try {
            String query = "SELECT p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity   \n"
                    + "FROM Product p  \n"
                    + "INNER JOIN ProductCase o  \n"
                    + "ON p.product_id = o.product_id  \n"
                    + "order by product_id offset ? rows fetch next 9 rows only";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, (index - 1) * 9); // truyn vao dau  ? dau tien 
            // set truoc khi Excute
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product e = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public Product getProductById(String ID) {
        try {
            String query = "SELECT p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity   \n"
                    + "FROM Product p  \n"
                    + "INNER JOIN ProductCase o  \n"
                    + "ON p.product_id = o.product_id  \n"
                    + "where p.product_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public void addOrder(Account c, Cart cart, String orderNotes) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String orderStatus = "pending";
        try {
            // add order
            String query = "insert into [Order](account_id, order_date, order_status, total_price, order_notes) values(?,?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, c.getAccount_id());
            ps.setString(2, date);
            ps.setString(3, orderStatus);
            ps.setInt(4, cart.getTotalMoney());
            ps.setString(5, orderNotes);
            ps.executeUpdate();
            // take the newly added order id 
            String query2 = "select top 1 order_id from [Order] order by order_id desc";
            PreparedStatement ps2 = con.prepareStatement(query2);
            rs = ps2.executeQuery();
            // Add order detail
            if (rs.next()) {
                int oID = rs.getInt("order_id");
                for (Item i : cart.getItems()) {
                    String query3 = "insert into [OrderDetail] values(?,?,?,?)";
                    PreparedStatement ps3 = con.prepareStatement(query3);
                    ps3.setInt(1, oID);
                    ps3.setInt(2, i.getProduct().getProductID());
                    ps3.setInt(3, i.getQuantity());
                    ps3.setInt(4, i.getPrice());
                    ps3.executeUpdate();
                }
            }
            // update quantity of product
            String query4 = "update ProductCase set quantity = quantity - ? where product_id = ?";
            PreparedStatement ps4 = con.prepareStatement(query4);
            for (Item i : cart.getItems()) {
                ps4.setInt(1, i.getQuantity());
                ps4.setInt(2, i.getProduct().getProductID());
                ps4.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public List<Order> getListOrder() {
        try {
            String query = "select * from [Order] order by order_id desc";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
                list.add(o);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public Order getOrderByOrderId(String order_id) {
        try {
            String query = "select * from [Order] where order_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, order_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Order> getOrderByOrderStatus(String status) {
        try {
            String query = "select * from [Order]\n"
                    + "where order_status = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
                list.add(o);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Order> getOrderByAccountId(Account a) {
        try {
            String query = "select * from [Order] where account_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, a.getAccount_id());
            rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
                list.add(o);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<OrderDetail> getOrderDetailByOrderId(String oid) {
        try {
            String query = "Select d.o_id, d.product_id, d.quantity, d.price \n"
                    + "From [Order] o\n"
                    + "inner join [OrderDetail] d\n"
                    + "On o.order_id = d.o_id\n"
                    + "Where o.order_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, oid);
            rs = ps.executeQuery();
            List<OrderDetail> list = new ArrayList<>();
            while (rs.next()) {
                OrderDetail o = new OrderDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                );
                list.add(o);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<OrderDetail> getOrderDetailByAccountId(Account a) {
        try {
            String query = "Select d.o_id, d.product_id, d.quantity, d.price \n"
                    + "From [Order] o\n"
                    + "inner join [OrderDetail] d\n"
                    + "On o.order_id = d.o_id\n"
                    + "Where o.account_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, a.getAccount_id());
            rs = ps.executeQuery();
            List<OrderDetail> list = new ArrayList<>();
            while (rs.next()) {
                OrderDetail o = new OrderDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                );
                list.add(o);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public void deleteOrder(String id) {
        try {
            String query = "delete from [OrderDetail] where o_id = ?";
            String query2 = "delete from [Order] where order_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            PreparedStatement ps2 = con.prepareStatement(query2);
//            set gia tri 
            ps.setString(1, id);
            ps2.setString(1, id);
            ps.executeUpdate();
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
//-----------------------------------------------------------------------------//

    public List<OrderInfo> getListStatistic() {
        List<OrderInfo> listStatistic = new ArrayList<>();
        String query = "SELECT ROW_NUMBER() OVER (ORDER BY Account.full_name) AS stt, "
                + "Account.full_name AS customer_name, "
                + "Product.[name] AS product_name, "
                + "Product.name AS product_name, "
                + "[Order].order_date AS sale_date, "
                + "OrderDetail.price AS unit_price, "
                + "OrderDetail.quantity AS quantity, "
                + "(OrderDetail.price * OrderDetail.quantity) AS total_price "
                + "FROM [Order] "
                + "JOIN OrderDetail ON [Order].order_id = OrderDetail.o_id "
                + "JOIN Product ON OrderDetail.product_id = Product.product_id "
                + "JOIN Account ON [Order].account_id = Account.account_id";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listStatistic.add(new OrderInfo(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getDouble(7)));
            }
        } catch (Exception e) {
        }
        return listStatistic;
    }

    public int getTotalOrderInfo() {
        String query = "SELECT COUNT(*) AS record_count "
                + "FROM [Order] "
                + "JOIN OrderDetail ON [Order].order_id = OrderDetail.o_id "
                + "JOIN Product ON OrderDetail.product_id = Product.product_id "
                + "JOIN Account ON [Order].account_id = Account.account_id";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<OrderInfo> pagingOrderInfo(int index) {
        List<OrderInfo> listOrder = new ArrayList<>();
        try {
            String query = "SELECT ROW_NUMBER() OVER (ORDER BY Account.full_name) AS stt, "
                    + "Account.full_name AS customer_name, "
                    + "Product.name AS product_name, "
                    + "[Order].order_date AS sale_date, "
                    + "OrderDetail.price AS unit_price, "
                    + "OrderDetail.quantity AS quantity, "
                    + "(OrderDetail.price * OrderDetail.quantity) AS total_price "
                    + "FROM [Order] "
                    + "JOIN OrderDetail ON [Order].order_id = OrderDetail.o_id "
                    + "JOIN Product ON OrderDetail.product_id = Product.product_id "
                    + "JOIN Account ON [Order].account_id = Account.account_id "
                    + "ORDER BY full_name "
                    + "OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, (index - 1) * 8); // truyn vao dau  ? dau tien 
            // set truoc khi Excute
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new OrderInfo(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getDouble(7)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return listOrder;
    }

    public List<Staff> getStaffInfo() {
        List<Staff> listStaff = new ArrayList<>();
        String query = "SELECT account_id, full_name, phone FROM Account WHERE role = 'Gardener'";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listStaff.add(new Staff(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)));

            }
        } catch (Exception e) {
        }
        return listStaff;
    }

//================================================================//
    public void addBooking(Booking booking) {
        try {
            String query = "insert into [AppointmentSchedule]([user_id],  [staff_id] ,[appointment_start_time], [type_of_tree],[care_package_id],[appointment_start_date],[appointment_note],[status])\n"
                    + "Values (?,?,?,?,?,?,?,?);";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
//            set gia tri 
            ps.setInt(1, booking.getUser_id());
            ps.setInt(2, booking.getStaff_id());
            ps.setString(3, booking.getAppointment_start_time());
            ps.setString(4, booking.getType_of_tree());
            ps.setInt(5, booking.getCare_package_id());
            ps.setDate(6, booking.getAppointment_start_date());
            ps.setString(7, booking.getAppointment_note());
            ps.setString(8, booking.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    //================================================================//
    public List<CarePackage> getCarePackage() {
        List<CarePackage> listCarePackage = new ArrayList<>();
        String query = "SELECT * FROM [CarePackage]";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listCarePackage.add(new CarePackage(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3)));

            }
        } catch (Exception e) {
        }
        return listCarePackage;
    }
    //================================================================//

    public List<MyBooking> getMyBooking() {
        List<MyBooking> listMyBooking = new ArrayList<>();
        String query = "SELECT a.[appointmentSchedule_id],c.package_name AS care_package_name, a.[user_id], a.type_of_tree, a.appointment_start_date, a.appointment_start_time, ac.full_name AS staff_name, ac.phone AS staff_phone ,a.[status], a.[staff_id], a.care_package_id, a.[appointment_note] "
                + "FROM [AppointmentSchedule] a "
                + "INNER JOIN [CarePackage] c ON a.care_package_id = c.care_package_id "
                + "INNER JOIN [Account] ac ON a.staff_id = ac.account_id "
                + "WHERE ac.role = 'Gardener'";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listMyBooking.add(new MyBooking(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12)));

            }
        } catch (Exception e) {
        }
        return listMyBooking;
    }
    //================================================================//

    public BookingStaff getBookingById(String id) {
        try {
            String query = "SELECT "
                    + "ap.appointmentSchedule_id, "
                    + "cp.package_name AS care_package_name, "
                    + "ap.type_of_tree, "
                    + "ap.appointment_start_date, "
                    + "ap.appointment_start_time, "
                    + "a.full_name AS user_name, "
                    + "a.phone AS user_phone, "
                    + "ap.[status], "
                    + "cp.[price], "
                    + "ap.appointment_note "
                    + "FROM [AppointmentSchedule] ap "
                    + "INNER JOIN [Account] a ON ap.user_id = a.account_id "
                    + "INNER JOIN CarePackage cp ON ap.care_package_id = cp.care_package_id "
                    + "WHERE ap.appointmentSchedule_id = ?";

            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new BookingStaff(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getString(10)
                );
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public void editBookingStaff(BookingStaff bf, int id) {
        try {
            String query = "update [AppointmentSchedule] set [status] = ? where [appointmentSchedule_id] = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);

            ps.setString(1, bf.getStatus());
            ps.setInt(2, id);

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public static void main(String[] args) throws Exception {

        DAO dao = new DAO();
        List<Product> list = dao.getTopProductByCID("1", "2");
        for (Product o : list) {
            System.out.println(o);
        }

        //---------//
//        int count = dao.getTotalOrderInfo();
//          System.out.println(count);
    }
}
