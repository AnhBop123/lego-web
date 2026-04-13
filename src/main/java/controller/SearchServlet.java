package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        ProductDAO dao = new ProductDAO();

        List<Product> list = dao.searchProducts(keyword);

        request.setAttribute("products", list);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("/views/client/home.jsp")
                .forward(request, response);
    }
}