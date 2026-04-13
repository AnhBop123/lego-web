

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../components/header.jsp" %>
<%@ include file="../../components/navbar.jsp" %>

<div class="container mt-5">

    <div class="row">

        <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/assets/images/${product.image}"
                 class="img-fluid">
        </div>

        <div class="col-md-6">
            <h2>${product.name}</h2>
            <h4 class="text-danger">
                    <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${product.price}" pattern="#,###" /> VNĐ
            </h4>

            <p>Remaining: <strong>${product.quantity}</strong> units</p>

            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="productId" value="${product.id}">
                <button type="submit" class="btn btn-success mt-3">
                    Add to Cart
                </button>
            </form>
        </div>

    </div>

</div>

<%@ include file="../../components/footer.jsp" %>