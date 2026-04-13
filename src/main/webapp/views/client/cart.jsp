<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.CartItem" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: url('https://www.lego.com/cdn/cs/set/assets/bltb041953bc9793f26/pab_title_banner_test_1800.png?format=webply&fit=crop&quality=70&width=800&height=120&dpr=1.5') no-repeat center center fixed;
        background-size: cover;
    }

    .container {
        width: 900px;
        margin: 40px auto;
    }

    .title {
        font-size: 26px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #333;
    }

    .cart-card {
        background: #fff;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        text-align: left;
        padding: 12px;
        background: #fafafa;
        border-bottom: 2px solid #eee;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #eee;
    }

    tr:hover {
        background: #fafafa;
    }

    .price {
        color: #ff5722;
        font-weight: 500;
    }

    .total-section {
        text-align: right;
        margin-top: 20px;
    }

    .total-text {
        font-size: 20px;
        font-weight: bold;
    }

    .checkout-btn {
        margin-top: 15px;
        padding: 12px 20px;
        background: #ff5722;
        color: #fff;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s;
    }

    .checkout-btn:hover {
        background: #e64a19;
    }

    .empty-cart {
        text-align: center;
        padding: 40px;
        color: #777;
    }

</style>
</head>

<body>

<div class="container">
    <div class="title">🛒 Your Cart</div>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double total = 0;

    if(cart != null && !cart.isEmpty()){
%>

    <div class="cart-card">
        <table>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>

            <%
                for(CartItem item : cart){
                    total += item.getSubtotal();
            %>

            <fmt:setLocale value="vi_VN"/>

            <tr>
                <td><%= item.getProduct().getName() %></td>
                <td class="price"><%= item.getProduct().getPrice() %> VNĐ</td>
                <td><%= item.getQuantity() %></td>
                <td class="price"><%= item.getSubtotal() %> VNĐ</td>
                <td>
                    <a href="${pageContext.request.contextPath}/remove-from-cart?id=<%= item.getProduct().getId() %>"
                       onclick="return confirm('Wanna clear this?')"
                       style="color:white; background:#e74c3c; padding:6px 10px; border-radius:5px; text-decoration:none;">
                        Remove
                    </a>
                </td>
            </tr>

            <%
                }
            %>
        </table>

        <div class="total-section" style="display:flex; justify-content: space-between; align-items:center; margin-top:20px;">

            <!-- Nút Back -->
            <a href="${pageContext.request.contextPath}/home"
               style="
                   padding:10px 16px;
                   background:#2c3e50;
                   color:white;
                   border-radius:8px;
                   text-decoration:none;
               ">
               ← Back to Home
            </a>

            <!-- Total + Checkout -->
            <div style="text-align:right;">
                <div class="total-text">Total: VNĐ<%= total %></div>

                <a href="${pageContext.request.contextPath}/views/client/checkout.jsp">
                    <button class="checkout-btn">Proceed to Checkout</button>
                </a>
            </div>

        </div>
    </div>

<%
    } else {
%>

    <div class="cart-card empty-cart">
        <h3>🛒 Your cart is empty</h3>
        <p>Looks like you haven't added anything yet</p>

        <a href="${pageContext.request.contextPath}/home"
           style="
               display:inline-block;
               margin-top:15px;
               padding:10px 16px;
               background:#2c3e50;
               color:white;
               border-radius:8px;
               text-decoration:none;
           ">
           ← Back to Home
        </a>
    </div>

<%
    }
%>

</div>

</body>
</html>