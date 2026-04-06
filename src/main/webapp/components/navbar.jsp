<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container">
        <a class="navbar-brand fw-bold" href="home">LEGO SHOP</a>

        <div>
            <a class="btn btn-warning btn-sm" href="#">Cart</a>
        </div>
    </div>
</nav>

<%
    model.User u=(model.User)session.getAttribute("user");
%>

<% if(u!=null){ %>

Hello <%=u.getUsername()%>

<a href="${pageContext.request.contextPath}/logout">
    Logout
</a>

<% } %>