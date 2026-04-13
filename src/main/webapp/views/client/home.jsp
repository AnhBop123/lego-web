<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../components/header.jsp" %>
<%@ include file="../../components/navbar.jsp" %>


<form action="${pageContext.request.contextPath}/search" method="get" class="mb-4">

    <div class="input-group">

        <input type="text" name="keyword" class="form-control"
               placeholder="Find Products..." value="${keyword}">

        <button class="btn btn-danger">Search</button>

    </div>

</form>

<div class="container mt-4">

    <h2 class="mb-4">Product List</h2>

    <div class="row">

        <c:forEach var="p" items="${products}">

            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm">

                    <img src="${pageContext.request.contextPath}/assets/images/${p.image}"
                         class="card-img-top"
                         style="height:200px; object-fit:cover;">

                    <div class="card-body d-flex flex-column">

                        <h5 class="card-title">${p.name}</h5>

                        <fmt:setLocale value="vi_VN"/>

                        <p class="text-danger fw-bold">
                            <fmt:formatNumber value="${p.price}" pattern="#,###" /> VNĐ
                        </p>

                        <!--  FIX Ở ĐÂY -->
                        <c:choose>

                            <c:when test="${p.quantity > 0}">
                                <a href="${pageContext.request.contextPath}/product?id=${p.id}"
                                   class="btn btn-danger mt-auto">
                                    More Details
                                </a>
                            </c:when>

                            <c:otherwise>
                                <button class="btn btn-secondary mt-auto" disabled>
                                    Out of Stock
                                </button>
                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>
            </div>

        </c:forEach>

    </div>

</div>

<c:if test="${empty products}">
    <p>Không tìm thấy sản phẩm nào 😢</p>
</c:if>

<%@ include file="../../components/footer.jsp" %>