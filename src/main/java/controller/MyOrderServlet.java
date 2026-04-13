//package controller;
//
//import dao.OrderDAO;
//import model.Order;
//import model.User;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/my-orders")
//public class MyOrderServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession();
//
//        User user = (User) session.getAttribute("user");
//
//        if(user == null){
//            response.sendRedirect("login");
//            return;
//        }
//
//        OrderDAO dao = new OrderDAO();
//
//        List<Order> orders = dao.getOrdersByUser(user.getId());
//
//        request.setAttribute("orders", orders);
//
//        request.getRequestDispatcher("/views/client/myOrders.jsp")
//                .forward(request,response);
//    }
//}