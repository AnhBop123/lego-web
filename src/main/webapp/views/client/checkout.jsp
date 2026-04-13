<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;

        background: url('https://d2ati23fc66y9j.cloudfront.net/brand-pages/category-175749583629.png') no-repeat center center fixed;
        background-size: cover;
    }

    .checkout-container {
        width: 400px;
        margin: 60px auto;
        background: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    .checkout-title {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 25px;
        color: #333;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: 500;
        color: #555;
    }

    .form-group input {
        width: 100%;
        padding: 10px 12px;
        border-radius: 8px;
        border: 1px solid #ddd;
        outline: none;
        transition: 0.2s;
    }

    .form-group input:focus {
        border-color: #ff5722;
        box-shadow: 0 0 5px rgba(255,87,34,0.3);
    }

    .checkout-btn {
        width: 100%;
        padding: 12px;
        background: #ff5722;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .checkout-btn:hover {
        background: #e64a19;
    }

</style>
</head>

<body>

<div class="checkout-container">
    <div class="checkout-title">Checkout</div>

    <form action="${pageContext.request.contextPath}/checkout" method="post">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="customerName" placeholder="Enter your name" required>
        </div>

        <div class="form-group">
            <label>Phone number</label>
            <input type="text" name="phone" placeholder="Enter your phone" required>
        </div>

        <div class="form-group">
            <label>Address</label>
            <input type="text" name="address" placeholder="Enter your address" required>
        </div>

        <button type="submit" class="checkout-btn">Place Order</button>
        <p style="color: black; font-style: italic; margin-top: 15px;">
            * Currently, the store has COD (cash on delivery) as payment method. After placing your order, please keep your phone handy for the next 1-3 days. We hope you have a pleasant shopping experience. Thank you.
        </p>

        <p style="color: black; font-style: italic; margin-top: 15px;">
            * To CANCEL your order please contact this following phone number 0866.765.906 for zalo messages and 0985.701.052 for phonecall. Thanks you.
        </p>

    </form>
</div>

</body>


</html>