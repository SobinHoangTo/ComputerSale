<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--logo icon-->
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="<%=request.getContextPath()%>fonts/icomoon/style.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>cssC/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>cssC/magnific-popup.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>cssC/jquery-ui.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>cssC/owl.carousel.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>cssC/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>cssC/aos.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>cssC/style.css">
    </head>
    <body>

        <div class="site-wrap">
            <!--Header-->
            <%@ include file="../HeadFoot/Header.jsp" %>
            <!--end Header-->

            <div class="bg-light py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-0"><a href="home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">

                    <div class="row mb-5">
                        <div class="col-md-9 order-2">
                            <%@include file="ProductsPage/ProductsLists.jsp" %>
                        </div>
                        <form action="productslist" method="post" class="col-md-3 order-1 mb-5 mb-md-0">
                            <input type="hidden" name="filter" value="filter">
                            <div class="border p-4 rounded mb-4">
                                <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
                                <select name="category" class="form-select" aria-label="Categories">
                                    <option value="0" ${sessionScope.categoryFilter==0?"selected":""}>All Categories</option>
                                    <c:forEach var="i" items="${categoryList}">
                                        <option value="${i.getId()}" ${sessionScope.categoryFilter==i.getId()?"selected":""}>${i.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="border p-4 rounded mb-4">
                                <div class="mb-4">
                                    <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                                    <label for="priceRange" class="form-label">Price range</label>
                                    <input type="range" onchange="onChangePrice()" class="border-primary ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" min="0" max="150000000" step="10000000" name="price" id="priceRange" value="${sessionScope.priceFilter!=null?sessionScope.priceFilter:0}">
                                    <input type="text" class="form-control border-0 pl-0 bg-white" value="<fmt:formatNumber value='${sessionScope.priceFilter!=null?sessionScope.priceFilter:0}' type='number' groupingUsed='true'/> VND" id="price" disabled>
                                </div>

                                <div class="mb-4">
                                    <h3 class="mb-3 h6 text-uppercase text-black d-block">Brand</h3>
                                    <c:forEach var="i" items="${sessionScope.listBrand!=null?sessionScope.listBrand:bList}">
                                        <label for="${i.getId()}" class="d-flex">
                                            <input type="checkbox" name="brand" value="${i.getId()}" id="${i.getId()}" class="mr-2 mt-1" 
                                                   <c:forEach var="j" items="${sessionScope.brandFilter}">
                                                       ${(j==i.getId())?"checked":''}
                                                   </c:forEach>
                                                   > <span class="text-black">${i.getName()}</span>
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Filter</button>
                        </form>

                    </div>


                </div>
            </div>

            <!--Footer-->
            <%@ include file="../HeadFoot/Footer.jsp" %>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
        <script>
            function onChangePrice() {
                var value = document.getElementById('priceRange').value;
                var formattedValue = new Intl.NumberFormat('en-US').format(value); // Format number with commas
                document.getElementById('price').value =  formattedValue + ' VND';
            }
        </script>
    </body>
</html>
