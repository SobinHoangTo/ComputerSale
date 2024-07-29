<%-- 
    Document   : HomeTopSale
    Created on : May 19, 2024, 9:04:03 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top Discount</title>
    </head>
    <body>
        <div class="site-section block-3 site-blocks-2 bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 site-section-heading text-center pt-4">
                        <h2>Featured Products</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-dark">
                        <div class="nonloop-block-3 owl-carousel">
                            <c:forEach items="${topProducts}" var="i">
                                <div class="item">
                                    <div class="block-4 text-center">
                                        <figure class="block-4-image">
                                            <img src="<%=request.getContextPath()%>/Image/Products/${i.representImage}" 
                                                 alt="${i.name}" class="img-fluid">
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="productdetails?id=${i.id}">${i.name}</a></h3>
                                            <p class="mb-0">Finding perfect t-shirt</p>
                                            <p class="text-primary font-weight-bold">
                                                <c:set var="discountFound" value="false" />
                                                <c:forEach var="d" items="${requestScope.discount}">
                                                    <c:if test="${i.id == d.key}">
                                                        <span class="text-primary" style="text-decoration: line-through;"><fmt:formatNumber value="${i.price}" type='number' groupingUsed='true'/> VND</span>
                                                        <br/>
                                                        <c:set var="discountedPrice" value="${(i.price * (1 - d.value / 100)).intValue()}" />
                                                        <span class="text-danger"><fmt:formatNumber value="${discountedPrice}" type='number' groupingUsed='true'/> VND </span>
                                                        <span class="badge badge-danger">${d.value}%</span>
                                                        <c:set var="discountFound" value="true" />
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${not discountFound}">
                                                    <fmt:formatNumber value="${i.price}" type='number' groupingUsed='true'/> VND
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
