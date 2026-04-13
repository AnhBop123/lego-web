<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.OrderItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Detail</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
        }

        .container {
            width: 800px;
            margin: 50px auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .card {
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
            background: #ff4757;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        tr:hover {
            background: #f9f9f9;
        }

        .no-data {
            text-align: center;
            color: #888;
            padding: 15px;
        }

        .back-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 14px;
            background: #2f3542;
            color: white;
            border-radius: 6px;
            text-decoration: none;
        }

        .back-btn:hover {
            background: #1e272e;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>📦 Order Detail</h2>

    <div class="card">

        <table>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>

            <%
                List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");

                if(items != null && !items.isEmpty()){
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
                } else {
            %>

            <tr>
                <td colspan="4" class="no-data">No data available</td>
            </tr>

            <%
                }
            %>

        </table>

        <a href="${pageContext.request.contextPath}/admin/orders" class="back-btn">
            ← Back to Orders
        </a>

    </div>

</div>

</body>
</html>