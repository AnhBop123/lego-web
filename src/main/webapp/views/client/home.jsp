<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../components/header.jsp" %>
<%@ include file="../../components/navbar.jsp" %>

<div class="container mt-4">

    <h2 class="mb-4">Danh sách sản phẩm</h2>

    <div class="row">

        <c:forEach var="p" items="${products}">

            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm">

                    <img src="${pageContext.request.contextPath}/assets/images/${p.image}"
                         class="card-img-top"
                         style="height:200px; object-fit:cover;">

                    <div class="card-body d-flex flex-column">

                        <h5 class="card-title">${p.name}</h5>

                        <p class="text-danger fw-bold">
                                ${p.price} VNĐ
                        </p>

                        <a href="${pageContext.request.contextPath}/product?id=${p.id}"
                           class="btn btn-danger mt-auto">
                            Xem chi tiết
                        </a>

                    </div>

                </div>
            </div>

        </c:forEach>

    </div>

</div>

<%@ include file="../../components/footer.jsp" %>