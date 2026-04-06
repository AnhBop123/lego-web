package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getActiveProducts();

        request.setAttribute("products", list);
        request.getRequestDispatcher("views/client/home.jsp")
                .forward(request, response);

        System.out.println("Size = " + list.size());
    }
}