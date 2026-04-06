package dao;

import model.Product;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getActiveProducts() {

        List<Product> list = new ArrayList<>();

        String sql = "SELECT id, name, price, image " +
                "FROM products WHERE is_active = true";;;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image")
                );

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Product getProductById(int id) {

        String sql = "SELECT * FROM products WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Product> getAllProducts(){

        List<Product> list = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try{

            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Product p = new Product();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));

                list.add(p);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public void deleteProduct(int id){

        String sql = "DELETE FROM products WHERE id=?";

        try{

            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1,id);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void updateProduct(Product p){

        try{
            Connection conn = DBConnection.getConnection();

            String sql = "UPDATE products SET name=?, price=?, quantity=?, image=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1,p.getName());
            ps.setDouble(2,p.getPrice());
            ps.setInt(3,p.getQuantity());
            ps.setString(4, p.getImage());
            ps.setInt(5,p.getId());


            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void addProduct(Product p){

        try{
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO products(name, price, quantity, image) VALUES(?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1,p.getName());
            ps.setDouble(2,p.getPrice());
            ps.setInt(3,p.getQuantity());
            ps.setString(4, p.getImage());

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

    }

}