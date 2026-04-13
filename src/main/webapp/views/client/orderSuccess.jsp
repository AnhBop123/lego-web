<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        background: linear-gradient(135deg, #ff5722, #ff8a50);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .success-card {
        background: #fff;
        padding: 40px;
        border-radius: 16px;
        text-align: center;
        width: 400px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }

    .check-icon {
        font-size: 60px;
        color: #4CAF50;
        margin-bottom: 15px;
    }

    .title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #333;
    }

    .desc {
        color: #777;
        margin-bottom: 25px;
    }

    .btn {
        display: inline-block;
        padding: 12px 20px;
        background: #ff5722;
        color: #fff;
        text-decoration: none;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.3s;
    }

    .btn:hover {
        background: #e64a19;
    }

</style>
</head>

<body>

<div class="success-card">

    <div class="check-icon">✔</div>

    <div class="title">Order Placed Successfully!</div>

    <div class="desc">
        Thank you for your purchase. Your order is being processed.
    </div>

    <a href="${pageContext.request.contextPath}/home" class="btn">
        Continue Shopping
    </a>

</div>

</body>
</html>