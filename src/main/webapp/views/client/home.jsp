<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../components/header.jsp" %>
<%@ include file="../../components/navbar.jsp" %>

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

                        <%-- Đặt Locale là tiếng Việt để hiển thị dấu chấm ngăn cách hàng nghìn --%>
                        <fmt:setLocale value="vi_VN"/>

                        <p class="text-danger fw-bold">
                            <fmt:formatNumber value="${p.price}" pattern="#,###" /> VNĐ
                        </p>

                        <a href="${pageContext.request.contextPath}/product?id=${p.id}"
                           class="btn btn-danger mt-auto">
                            More Details
                        </a>

                    </div>

                </div>
            </div>

        </c:forEach>

    </div>

</div>

<%@ include file="../../components/footer.jsp" %>