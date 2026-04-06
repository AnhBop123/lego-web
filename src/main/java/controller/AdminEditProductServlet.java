package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/edit-product")
public class AdminEditProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductById(id);

        request.setAttribute("product", p);

        request.getRequestDispatcher("/views/admin/editProduct.jsp")
                .forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setPrice(price);
        p.setQuantity(quantity);
        p.setImage(image);

        ProductDAO dao = new ProductDAO();
        dao.updateProduct(p);

        response.sendRedirect(request.getContextPath() + "/admin/product");
    }
}