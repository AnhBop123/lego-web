<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
        }

        .navbar {
            background: #2c3e50;
            padding: 15px;
            color: white;
            display: flex;
            justify-content: space-between;
        }

        .navbar a {
            color: white;
            margin-right: 15px;
            text-decoration: none;
            font-weight: bold;
        }

        .container {
            padding: 20px;
        }

        h2 {
            margin-bottom: 20px;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            cursor: pointer;
        }

        .btn-add { background: #27ae60; }
        .btn-edit { background: #2980b9; }
        .btn-delete { background: #e74c3c; }
        .btn-orders { background: #8e44ad; }

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

        .top-actions {
            margin-bottom: 15px;
        }
    </style>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this product?");
        }
    </script>
</head>

<body>

<div class="navbar">
    <div>
        <a href="#">Admin Panel</a>
    </div>

</div>

<div class="container">

    <h2>Product Management</h2>

    <div class="top-actions">
        <a class="btn btn-add" href="${pageContext.request.contextPath}/admin/add-product">Add Product</a>
        <a class="btn btn-orders" href="${pageContext.request.contextPath}/admin/orders">Manage Orders</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>

        <%
            List<Product> products = (List<Product>) request.getAttribute("products");

            if(products != null){
                for(Product p : products){
        %>

        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getQuantity() %></td>
            <td>
                <a class="btn btn-edit" href="${pageContext.request.contextPath}/admin/edit-product?id=<%= p.getId() %>">Edit</a>

                <a class="btn btn-delete" onclick="return confirmDelete()"
                   href="${pageContext.request.contextPath}/admin/delete-product?id=<%= p.getId() %>">
                   Delete
                </a>
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