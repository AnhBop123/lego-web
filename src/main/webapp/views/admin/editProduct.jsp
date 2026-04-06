<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Product" %>

<%
    Product p = (Product) request.getAttribute("product");
%>

<h2>Edit Product</h2>

<form action="${pageContext.request.contextPath}/admin/edit-product" method="post">

    <input type="hidden" name="id" value="<%= p.getId() %>">

    Name:
    <input type="text" name="name" value="<%= p.getName() %>"><br><br>

    Price:
    <input type="number" name="price" value="<%= p.getPrice() %>"><br><br>

    Quantity:
    <input type="number" name="quantity" value="<%= p.getQuantity() %>"><br><br>

    Image:
    <input type="text" name="image" value="<%= p.getImage() %>"><br><br>

    <button type="submit">Update</button>

</form>