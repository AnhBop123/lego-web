<form action="${pageContext.request.contextPath}/checkout" method="post">

    Name<br>
    <input type="text" name="customerName" required><br><br>

    Phone number<br>
    <input type="text" name="phone" required><br><br>

    Address<br>
    <input type="text" name="address" required><br><br>

    <button type="submit">Place Order</button>

</form>