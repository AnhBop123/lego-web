<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.Order" %>

<h2>Admin - Orders</h2>

<table border="1">

    <tr>
        <th>ID</th>
        <th>Customer</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Total Price</th>
        <th>Action</th>
        <th>Status</th>
    </tr>

    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");

        if(orders != null){
            for(Order o : orders){
    %>

    <tr>
        <td><%= o.getId() %></td>
        <td><%= o.getCustomerName() %></td>
        <td><%= o.getPhone() %></td>
        <td><%= o.getAddress() %></td>
        <td><%= o.getTotalPrice() %></td>
        <td><%= o.getTotalPrice() %></td>

        <td>
            <a href="${pageContext.request.contextPath}/admin/order-detail?id=<%= o.getId() %>">
                Detail
            </a>

            <a href="${pageContext.request.contextPath}/admin/update-status?id=<%= o.getId() %>&status=CONFIRMED">
                Confirm
            </a>

            <a href="${pageContext.request.contextPath}/admin/update-status?id=<%= o.getId() %>&status=SHIPPED">
                Ship
            </a>
        </td>

        <td style = "color : green"><%= o.getStatus() %></td>
    </tr>

    <%
            }
        }
    %>

</table>