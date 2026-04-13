<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
        }

        .container {
            width: 500px;
            margin: 60px auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .card {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input:focus {
            border-color: #ff4757;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #ff4757;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #e84118;
        }

        .back-btn {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #2f3542;
        }

        .back-btn:hover {
            text-decoration: underline;
        }

    </style>
</head>

<body>

<div class="container">

    <h2>➕ Add Product</h2>

    <div class="card">

        <form action="${pageContext.request.contextPath}/admin/add-product" method="post">

            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label>Price</label>
                <input type="number" name="price" required>
            </div>

            <div class="form-group">
                <label>Quantity</label>
                <input type="number" name="quantity" required>
            </div>

            <div class="form-group">
                <label>Image</label>
                <input type="text" name="image">
            </div>

            <button type="submit" class="btn">Add Product</button>

        </form>

        <a href="${pageContext.request.contextPath}/admin/product" class="back-btn">
            ← Back to Products
        </a>

    </div>

</div>

</body>
</html>