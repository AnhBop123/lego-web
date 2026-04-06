package controller;

import dao.OrderDAO;
import model.Order;
import model.CartItem;
import model.OrderItem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/admin/order-detail")
public class AdminOrderDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("id"));

        OrderDAO orderDAO = new OrderDAO();

        List<OrderItem> items = orderDAO.getOrderItems(orderId);

        request.setAttribute("items", items);

        request.getRequestDispatcher("/views/admin/orderDetail.jsp")
                .forward(request, response);
    }
}