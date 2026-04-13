package controller;

import dao.OrderDAO;
import model.CartItem;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("customerName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if(cart == null || cart.isEmpty()){
            response.sendRedirect("cart");
            return;
        }

        User user = (User) session.getAttribute("user");

        int userId = user.getId();

        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.createOrder(userId, name, phone, address, cart);

        session.removeAttribute("cart");

        response.sendRedirect(request.getContextPath() + "/views/client/orderSuccess.jsp");
    }
}