<nav class="navbar navbar-expand-lg navbar-dark bg-danger py-3"> <div class="container">
        <a class="navbar-brand fw-bold" href="home">LEGO SHOP</a>

        <div class="d-flex align-items-center">

            <%
                model.User u = (model.User) session.getAttribute("user");
                if(u != null) {
            %>
                <span class="text-white me-3">Hello, <strong><%=u.getUsername()%></strong></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-warning btn-sm me-3">
                    Logout
                </a>
            <% } %>

            <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/cart">
                Cart
            </a>
        </div>
    </div>
</nav>