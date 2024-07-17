<%-- 
    Document   : HomeTopSale
    Created on : May 19, 2024, 9:04:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <jsp:useBean id="c" class="dal.DiscountDAO" scope="request"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top Discount</title>
    </head>
    <body>
        <!--Start Title-->
        <div class="container rounded-pill bg-light text-center p-1">
            <h3>Top Discount</h3>
        </div>
        <!--End title-->
        <!--Start Products-->
        <div class="container p-2">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <!--Bắt đầu của thẻ đầu tiên-->
                
                <c:forEach items="${c.top3ProductsByDiscount}" var="i">
                
                <div class="col">
                    <div class="card h-100 position-relative">
                        <span class="badge bg-danger position-absolute top-0 end-0" 
                              style="font-size: 1.25rem;"><!-- Adjust font size inline -->
                            Hot</span> <!-- Điền thông tin vào thẻ badges-->
                        <img src="<%=request.getContextPath()%>/Image/Products/latop_sample.png" class="card-img-top" alt="...">
                        <div class="card-body row">
                            <div class="container row">
                                <div class="col-7"><!-- Tên sản phẩm -->
                                    <a href="<%=request.getContextPath ()%>/Views/AllUsers/ProductDetails.jsp" class="btn-light">
                                        ${i.name}
                                    </a>
                                </div>
                                <div class="col-5">
                                    <p class="card-text"><!-- Giá -->
                                        <s>${i.price}</s><br>
                                        <strong class="text-danger">${i.price}</strong>
                                    </p>
                                </div>
                            </div>
                            <a href="Views/AllUsers/ProductDetails.jsp" class="btn btn-light btn-sm"> <!-- Added btn-sm class -->
                                Chi tiết 
                            </a><!-- Nút chuyển hướng -->
                        </div>

                    </div>
                </div>
            </c:forEach>
                <!--Kết thúc thẻ đầu tiên-->
                <!--Chỉ cần tạo danh sách thẻ trong này-->
                <!--Các thẻ sẽ chạy theo 3 sản phẩm 1 hàng-->
            </div>
        </div>
    </body>
</html>
