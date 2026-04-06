package controller;

import dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/update-status")
public class UpdateOrderStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        OrderDAO orderDAO = new OrderDAO();
        orderDAO.updateStatus(orderId, status);

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}