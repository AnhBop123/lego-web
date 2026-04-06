<h2>Login</h2>

<form action="${pageContext.request.contextPath}/login" method="post">

    Username
    <input type="text" name="username">

    <br><br>

    Password
    <input type="password" name="password">

    <br><br>

    <button type="submit">Login</button>

</form>

<p style="color:red">
    ${error}
</p>