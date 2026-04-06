<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.CartItem" %>

<h2>Your Cart</h2>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

    double total = 0;

    if(cart != null){
%>

<table border="1">

    <tr>
        <th>Product</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
    </tr>

    <%
        for(CartItem item : cart){
            total += item.getSubtotal();
    %>

    <tr>
        <td><%= item.getProduct().getName() %></td>
        <td><%= item.getProduct().getPrice() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getSubtotal() %></td>
    </tr>

    <%
        }
    %>

</table>

<h3>Total: <%= total %></h3>

<%
}else{
%>

<p>Cart is empty</p>

<%
    }
%>
<a href="${pageContext.request.contextPath}/views/client/checkout.jsp">
    <button>Checkout</button>
</a>