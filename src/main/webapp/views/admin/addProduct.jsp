<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Add Product</h2>

<form action="${pageContext.request.contextPath}/admin/add-product" method="post">

    Name:
    <input type="text" name="name"><br><br>

    Price:
    <input type="number" name="price"><br><br>

    Quantity:
    <input type="number" name="quantity"><br><br>

    Image:
    <input type="text" name="image"><br><br>

    <button type="submit">Add</button>

</form>