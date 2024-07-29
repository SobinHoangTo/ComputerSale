<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--logo icon-->
        <link rel="icon" href="<%=request.getContextPath()%>/Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${product.name}</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/cssC/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/cssC/magnific-popup.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/cssC/jquery-ui.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/cssC/owl.carousel.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/cssC/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/cssC/aos.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/cssC/style.css">
    </head>
    <body>

        <div class="site-wrap">
            <!--Header-->
            <%@ include file="../HeadFoot/Header.jsp" %>
            <!--end Header-->

            <!--breadcrum-->
            <div class="bg-light py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-0"><a href="home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">${product.name}</strong></div>
                    </div>
                </div>
            </div>  
            <!--product details-->
            <%@include file="ProductDetails/ProductsInfo.jsp" %>

            <%@include file="ProductDetails/ProductsSimilars.jsp" %>

            <!--Footer-->
            <%@ include file="../HeadFoot/Footer.jsp" %>
        </div>


        <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
        <script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/aos.js"></script>

        <script src="<%=request.getContextPath()%>/js/main.js"></script>

    </body>
</html>
