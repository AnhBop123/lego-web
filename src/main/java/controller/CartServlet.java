package controller;

import dao.ProductDAO;
import model.CartItem;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/views/client/cart.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        HttpSession session = request.getSession();

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if(cart == null){
            cart = new ArrayList<>();
        }

        boolean found = false;

        for(CartItem item : cart){
            if(item.getProduct().getId() == productId){
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
            if(product.getQuantity() <= 0){
                response.getWriter().println(" Sản Phẩm Hiện Đang Hết hàng!");
                return;
            }
        }

        if(!found){
            cart.add(new CartItem(product,1));
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart");

    }
}