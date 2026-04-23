
package controller;

import dao.ProductDAO;
import model.User;
import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;




@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        request.getRequestDispatcher("/views/client/register.jsp")
                .forward(request,response);
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = null;
        try {
            dao = new UserDAO();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        // 🔴 CHECK USERNAME TRÙNG
        if(dao.isUsernameExists(username)){
            request.setAttribute("error", "Username đã tồn tại!");
            request.getRequestDispatcher("/views/client/register.jsp")
                    .forward(request, response);
            return;
        }

        // nếu không trùng thì tạo user
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);

        dao.register(u);

        response.sendRedirect(request.getContextPath()+"/login");
    }
}