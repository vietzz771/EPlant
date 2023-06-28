/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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

    public void UpdateProfile(String user, String full_name, String phone, String email, String address, String birthday, String sex) {
        String query = "UPDATE Account SET full_name=?, phone=?, email=?, address=?, birthday=?, sex=? WHERE user=?";
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
    public boolean changePassword(String account_id, String password) {
        String query = "select * from Account where account_id = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, account_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String sql = "update Account set password = ? where account_id = ?";
                con = new DBContext().getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, password);
                ps.setString(2, account_id);
                ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
//=========================================================================//

    public void deleteProduct(String id) {
        try {
            String query = "delete from Product \n"
                    + "Where product_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
//            set gia tri 
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void editProduct(Product product) {
        try {
            String query = "update Product set [name] = ?, [image] = ?, price = ?, [description] = ?, cid = ? where productID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
//            ps.setInt(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getCid());
            ps.setInt(6, product.getProductID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void addProduct(Product product) {
        try {
            String query = "insert into Product([name], image, price, description, cid)\n"
                    + "Values (?,?,?,?,?);";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
//            set gia tri 
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
//            ps.setInt(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getCid());
            ps.executeUpdate();
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

    public List<Product> getTopProductByCID(String cid) {
        try {
            String query = "SELECT top 4 p.product_id, p.name, p.image, p.description, p.filter, p.category_id, o.price, o.quantity   \n"
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

    public List<OrderInfo> getOrderInfo() {
        List<OrderInfo> listOrder = new ArrayList<>();
        String query = "SELECT "
                + "Account.full_name AS customer_name, "
                + "Product.[name] AS product_name, "
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
                listOrder.add(new OrderInfo(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
        }
        return listOrder;
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
            String query = "SELECT Account.full_name AS customer_name, "
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
                    + "OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, (index - 1) * 3); // truyn vao dau  ? dau tien 
            // set truoc khi Excute
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new OrderInfo(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return listOrder;
    }

    public static void main(String[] args) throws Exception {

        DAO dao = new DAO();
        List<Account> list = dao.searchAccount("a");
        for (Account o : list) {
            System.out.println(o);
        }

        //---------//
//        int count = dao.getTotalOrderInfo();
//          System.out.println(count);
    }
}
