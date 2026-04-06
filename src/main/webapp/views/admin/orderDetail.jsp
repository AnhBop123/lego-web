<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.OrderItem" %>

<h2>Order Detail</h2>

<table border="1">

<tr>
<th>Product</th>
<th>Price</th>
<th>Quantity</th>
<th>Subtotal</th>
</tr>

    <%
        List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");

        if(items != null){
            for(OrderItem item : items){
    %>

    <tr>
        <td><%= item.getProductName() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getSubtotal() %></td>
    </tr>

    <%
            }
        }
    %>

</table>