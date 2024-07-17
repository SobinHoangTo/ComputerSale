<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--logo icon-->
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="cssC/bootstrap.min.css">
        <link rel="stylesheet" href="cssC/magnific-popup.css">
        <link rel="stylesheet" href="cssC/jquery-ui.css">
        <link rel="stylesheet" href="cssC/owl.carousel.min.css">
        <link rel="stylesheet" href="cssC/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

        <link rel="stylesheet" href="cssC/aos.css">

        <link rel="stylesheet" href="cssC/style.css">
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
                        <div class="col-md-12 mb-0"><a href="home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">${news.title}</strong></div>
                    </div>
                </div>
            </div>  
            <div class="site-section border-bottom" data-aos="fade">
                <div class="container">
                    <div class=" mb-5">
                        <div class="site-section-heading pt-3">
                            <h2 class="text-black">${news.title}</h2>
                        </div>
                        <p class="text-right">${news.create_date}</p>
                        <p>${news.news_detail}</p>
                        <h5 class="text-right">${author}</h5>
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
    </body>
</html>
