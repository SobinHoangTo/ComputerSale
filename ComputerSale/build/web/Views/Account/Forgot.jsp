<%-- 
    Document   : Login
    Created on : May 14, 2024, 8:22:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="<%=request.getContextPath()%>/Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
        <!--bootstrap link-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!--bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="<%=request.getContextPath()%>/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="<%=request.getContextPath()%>/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="cssE/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="cssE/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-fluid bg-light">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="<%=request.getContextPath()%>/home" >
                                <img title="Back to Home" src="<%=request.getContextPath()%>/Image/laptop-icon.png" alt="Logo" class="img-fluid rounded" style="max-height: 100px;">
                            </a>
                            <h3>Forgot Password</h3>
                        </div>
                        <form action="<%=request.getContextPath()%>/forgetpassword" method="post">
                            <c:if test="${requestScope.error!=null}">
                                <div class="form-group">
                                    <div class="alert alert-warning" role="alert">
                                        ${requestScope.error}
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-floating mb-3">
                                <input type="text" name="email" class="form-control" id="email" placeholder="Email" required>
                                <label for="email">Email</label>
                            </div>
                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Send New Password</button>
                        </form>

                        <p class="text-center mb-0"><a href="<%=request.getContextPath()%>/login">Back to Login</a></p>

                    </div>
                </div>
            </div>
        </div>        

    </body>
</html>
