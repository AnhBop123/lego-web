package dao;

import model.CartItem;
import model.Order;
import model.OrderItem;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public int createOrder(int userId, String name, String phone, String address, List<CartItem> cart) {

        int orderId = 0;

        try {

            Connection conn = DBConnection.getConnection();
            conn.setAutoCommit(true);

            double total = 0;

            for(CartItem item : cart){
                total += item.getSubtotal();
            }

            String sql = "INSERT INTO orders(user_id, customer_name, phone, address, total_price) VALUES (?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, userId);
            ps.setString(2,name);
            ps.setString(3,phone);
            ps.setString(4,address);
            ps.setDouble(5,total);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            String updateStockSql = "UPDATE products SET quantity = quantity - ? WHERE id = ?";
            PreparedStatement stockPs = conn.prepareStatement(updateStockSql);

            for(CartItem item : cart){
                stockPs.setInt(1, item.getQuantity());
                stockPs.setInt(2, item.getProduct().getId());
                stockPs.executeUpdate();
            }



            if(rs.next()){
                orderId = rs.getInt(1);
            }

            for(CartItem item : cart){

                String itemSql = "INSERT INTO order_items(order_id, product_id, price, quantity) VALUES (?,?,?,?)";

                PreparedStatement itemPs = conn.prepareStatement(itemSql);

                itemPs.setInt(1,orderId);
                itemPs.setInt(2,item.getProduct().getId());
                itemPs.setDouble(3,item.getProduct().getPrice());
                itemPs.setInt(4,item.getQuantity());

                itemPs.executeUpdate();

            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return orderId;



    }
    public List<Order> getAllOrders() {

        List<Order> list = new ArrayList<>();

        String sql = "SELECT * FROM orders ORDER BY created_at DESC";

        try {

            Connection conn = DBConnection.getConnection();
            conn.setAutoCommit(true);
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order o = new Order();

                o.setId(rs.getInt("id"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setTotalPrice(rs.getDouble("total_price"));
                o.setStatus(rs.getString("status"));

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<OrderItem> getOrderItems(int orderId){

        List<OrderItem> list = new ArrayList<>();

        String sql = """
        SELECT oi.product_id, p.name, oi.price, oi.quantity, (oi.price * oi.quantity) AS subtotal
        FROM order_items oi
        JOIN products p ON oi.product_id = p.id
        WHERE oi.order_id = ?
    """;

        try{

            Connection conn = DBConnection.getConnection();
            conn.setAutoCommit(true);
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,orderId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                OrderItem item = new OrderItem();

                item.setProductId(rs.getInt("product_id"));
                item.setProductName(rs.getString("name"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                item.setSubtotal(rs.getDouble("subtotal"));

                list.add(item);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
    public void updateStatus(int orderId, String status){

        try{
            Connection conn = DBConnection.getConnection();

            // 1. Lấy status cũ
            String checkSql = "SELECT status FROM orders WHERE id=?";
            PreparedStatement checkPs = conn.prepareStatement(checkSql);
            checkPs.setInt(1, orderId);

            ResultSet rs = checkPs.executeQuery();

            String oldStatus = "";
            if(rs.next()){
                oldStatus = rs.getString("status");
            }

            // 2. Nếu chuyển sang CANCELLED và trước đó chưa cancel
            if(!oldStatus.equals("CANCELLED") && status.equals("CANCELLED")){

                String sql = "SELECT product_id, quantity FROM order_items WHERE order_id=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, orderId);

                ResultSet rsItems = ps.executeQuery();

                while(rsItems.next()){

                    int productId = rsItems.getInt("product_id");
                    int quantity = rsItems.getInt("quantity");

                    String updateStock = "UPDATE products SET quantity = quantity + ? WHERE id=?";
                    PreparedStatement updatePs = conn.prepareStatement(updateStock);

                    updatePs.setInt(1, quantity);
                    updatePs.setInt(2, productId);

                    updatePs.executeUpdate();
                }
            }

            // 3. Update status
            String updateSql = "UPDATE orders SET status=? WHERE id=?";
            PreparedStatement updateOrder = conn.prepareStatement(updateSql);

            updateOrder.setString(1, status);
            updateOrder.setInt(2, orderId);

            updateOrder.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public List<Order> getOrdersByUser(int userId){

        List<Order> list = new ArrayList<>();

        String sql = "SELECT * FROM orders WHERE user_id=? ORDER BY created_at DESC";

        try{
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Order o = new Order();

                o.setId(rs.getInt("id"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setTotalPrice(rs.getDouble("total_price"));
                o.setStatus(rs.getString("status"));

                list.add(o);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public double getTotalRevenue(){

        String sql = "SELECT SUM(total_price) FROM orders WHERE status != 'CANCELLED'";

        try{
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                return rs.getDouble(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }


    public int getTotalOrders(){

        String sql = "SELECT COUNT(*) FROM orders";

        try{
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                return rs.getInt(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }
}