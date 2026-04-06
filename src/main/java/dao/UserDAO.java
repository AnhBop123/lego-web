package dao;

import model.CartItem;
import model.Order;
import model.OrderItem;
import model.User;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    Connection conn;

    public UserDAO() throws Exception {
        conn = DBConnection.getConnection();
    }

    public User login(String username, String password){

        try{

            String sql="SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement ps=conn.prepareStatement(sql);

            ps.setString(1,username);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                User u=new User();

                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setRole(rs.getString("role"));

                return u;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return null;
    }

    public void register(User u){

        try{

            String sql="INSERT INTO users(username,password,role) VALUES(?,?,?)";

            PreparedStatement ps=conn.prepareStatement(sql);

            ps.setString(1,u.getUsername());
            ps.setString(2,u.getPassword());
            ps.setString(3,"user");

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}