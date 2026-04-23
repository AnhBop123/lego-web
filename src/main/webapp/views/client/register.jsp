<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <% if(request.getAttribute("error") != null){ %>
        <div class="alert alert-danger text-center">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background: linear-gradient(135deg,#667eea,#764ba2);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .register-box{
            background:white;
            padding:40px;
            border-radius:15px;
            width:350px;
            box-shadow:0 10px 30px rgba(0,0,0,0.2);
        }

        .btn-custom{
            background:#667eea;
            color:white;
            width:100%;
        }

        .btn-custom:hover{
            background:#4c5bd4;
        }
    </style>
</head>

<body>

<div class="register-box">

    <h3 class="text-center mb-4">📝 Register</h3>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-custom">Register</button>

    </form>

    <div class="text-center mt-3">
        Already have account?
        <a href="${pageContext.request.contextPath}/login">Login</a>
    </div>

</div>

</body>
</html>