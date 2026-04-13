//package controller;
//
//import dao.OrderDAO;
//import dao.ProductDAO;
//import model.Product;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/cancel-order")
//public class CancelOrderServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        int orderId = Integer.parseInt(request.getParameter("id"));
//
//        OrderDAO dao = new OrderDAO();
//
//        dao.cancelOrder(orderId);
//
//        response.sendRedirect(request.getContextPath() + "/admin/orders");
//    }
//}