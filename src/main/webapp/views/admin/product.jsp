<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.Product" %>

<h2>Admin - Products</h2>

<a href="${pageContext.request.contextPath}/admin/add-product">
    Add Product
</a>

<table border="1">

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

            <a href="${pageContext.request.contextPath}/admin/edit-product?id=<%= p.getId() %>">
                Edit
            </a>

            <a href="${pageContext.request.contextPath}/admin/delete-product?id=<%= p.getId() %>">
                Delete
            </a>




        </td>

    </tr>

    <%
            }
        }
    %>

</table>