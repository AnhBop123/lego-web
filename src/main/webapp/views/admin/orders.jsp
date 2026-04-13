<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.Order" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
        }

        .container {
            padding: 20px;
        }

        h2 {
            margin-bottom: 20px;
        }

        .btn {
            padding: 6px 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-size: 13px;
            margin: 2px;
            display: inline-block;
        }

        .btn-detail { background: #7f8c8d; }
        .btn-confirm { background: #27ae60; }
        .btn-ship { background: #2980b9; }
        .btn-cancel { background: #e74c3c; }
        .btn-done { background: #8e44ad; }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #34495e;
            color: white;
        }

        tr:hover {
            background: #f1f1f1;
        }

        .status {
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
        }

        .NEW { background: orange; }
        .CONFIRMED { background: #27ae60; }
        .SHIPPED { background: #2980b9; }
        .DONE { background: gray; }
        .CANCELLED { background: #e74c3c; }

        .top-actions {
            margin-bottom: 15px;
        }

        .btn-back {
            background: #2c3e50;
        }
    </style>

    <script>
        function confirmCancel() {
            return confirm("Are you sure you want to cancel this order?");
        }
    </script>
</head>

<body>

<div class="container">

    <h2>Order Management</h2>

    <div class="top-actions">
        <a class="btn btn-back" href="${pageContext.request.contextPath}/admin/product">← Back to Products</a>
    </div>

    <table>

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

            <td>
                <a class="btn btn-detail" href="${pageContext.request.contextPath}/admin/order-detail?id=<%= o.getId() %>">Detail</a>

                <a class="btn btn-confirm" href="${pageContext.request.contextPath}/admin/update-status?id=<%= o.getId() %>&status=CONFIRMED">Confirm</a>

                <a class="btn btn-ship" href="${pageContext.request.contextPath}/admin/update-status?id=<%= o.getId() %>&status=SHIPPED">Ship</a>

                <a class="btn btn-cancel" onclick="return confirmCancel()" href="${pageContext.request.contextPath}/admin/update-status?id=<%= o.getId() %>&status=CANCELLED">Cancel</a>

                <a class="btn btn-done" href="${pageContext.request.contextPath}/admin/update-status?id=<%= o.getId() %>&status=DONE">Done</a>
            </td>

            <td>
                <span class="status <%= o.getStatus() %>">
                    <%= o.getStatus() %>
                </span>
            </td>
        </tr>

        <%
                }
            }
        %>

    </table>

</div>

</body>
</html>