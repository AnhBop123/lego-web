package dao;

import model.CartItem;
import model.Order;
import model.OrderItem;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public int createOrder(String name, String phone, String address, List<CartItem> cart) {

        int orderId = 0;

        try {

            Connection conn = DBConnection.getConnection();
            conn.setAutoCommit(true);

            double total = 0;

            for(CartItem item : cart){
                total += item.getSubtotal();
            }

            String sql = "INSERT INTO orders(customer_name, phone, address, total_price) VALUES (?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1,name);
            ps.setString(2,phone);
            ps.setString(3,address);
            ps.setDouble(4,total);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();



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

                String updateProduct = "UPDATE products SET quantity = quantity - ? WHERE id = ?";

                PreparedStatement updatePs = conn.prepareStatement(updateProduct);
                updatePs.setInt(1, item.getQuantity());
                updatePs.setInt(2, item.getProduct().getId());

                updatePs.executeUpdate();


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
        SELECT p.name, oi.price, oi.quantity, (oi.price * oi.quantity) AS subtotal
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

            String sql = "UPDATE orders SET status=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, orderId);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}