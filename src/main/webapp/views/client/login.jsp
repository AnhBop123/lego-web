<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background: linear-gradient(135deg,#ff416c,#ff4b2b);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .login-box{
            background:white;
            padding:40px;
            border-radius:15px;
            width:350px;
            box-shadow:0 10px 30px rgba(0,0,0,0.2);
        }

        .btn-custom{
            background:#ff4b2b;
            color:white;
            width:100%;
        }

        .btn-custom:hover{
            background:#ff2e00;
        }
    </style>
</head>

<body>

<div class="login-box">

    <h3 class="text-center mb-4">🔐 Login</h3>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-custom">Login</button>

    </form>

    <p class="text-danger mt-3 text-center">
        ${error}
    </p>

    <div class="text-center mt-3">
        Don't have account?
        <a href="${pageContext.request.contextPath}/register">Register</a>
    </div>

</div>

</body>
</html>