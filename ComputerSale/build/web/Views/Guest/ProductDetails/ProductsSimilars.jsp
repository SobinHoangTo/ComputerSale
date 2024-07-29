<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="<%=request.getContextPath()%>/Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Similar</title>
    </head>
    <body>
        <div class="site-section block-3 site-blocks-2 bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 site-section-heading text-center pt-4">
                        <h2>Similar Product</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-dark">
                        <div class="nonloop-block-3 owl-carousel">
                            <c:forEach items="${relatedProducts}" var="i">
                                <div class="item">
                                    <div class="block-4 text-center">
                                        <figure class="block-4-image">
                                            <img src="<%=request.getContextPath()%>/Image/Products/${i.representImage}" 
                                                 alt="${i.name}" class="img-fluid">
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="<%=request.getContextPath()%>/productdetails?id=${i.id}">${i.name}</a></h3>
                                            <p class="mb-0">Finding perfect t-shirt</p>
                                            <p class="text-primary font-weight-bold"><fmt:formatNumber value="${i.price}" type='number' groupingUsed='true'/> VND</p>
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
