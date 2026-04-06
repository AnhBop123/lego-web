package controller;

import dao.ProductDAO;
import model.User;
import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        HttpSession session=request.getSession();

        session.invalidate();

        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
}