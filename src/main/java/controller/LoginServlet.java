package controller;

import dao.ProductDAO;
import model.User;
import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        request.getRequestDispatcher("/views/client/login.jsp")
                .forward(request,response);
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        String username=request.getParameter("username");
        String password=request.getParameter("password");

        UserDAO dao= null;
        try {
            dao = new UserDAO();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        User user=dao.login(username,password);

        if(user!=null){

            HttpSession session=request.getSession();

            session.setAttribute("user",user);

            if(user.getRole().equals("admin")){
                response.sendRedirect(request.getContextPath()+"/admin/product");
            }else{
                response.sendRedirect(request.getContextPath()+"/home");
            }

        }else{

            request.setAttribute("error","Wrong username or password");

            request.getRequestDispatcher("/views/client/login.jsp")
                    .forward(request,response);
        }
    }
}