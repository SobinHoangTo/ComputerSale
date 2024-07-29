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
        <title>Login</title>


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
        <link href="<%=request.getContextPath()%>/cssE/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="cssE/style.css" rel="stylesheet">
        <style>
            .btn-google {
                background-color: #db4437;
                color: white;
            }
            .btn-google:hover {
                background-color: #c23321;
                color: white;
            }
        </style>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;width: 100vw;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-center mb-3">
                            <a href="<%=request.getContextPath()%>/home" >
                                <img title="Back to Home" src="<%=request.getContextPath()%>/Image/laptop-icon.png" alt="Logo" class="img-fluid rounded" style="max-height: 100px;">
                            </a>
                            <h3>Login</h3>
                        </div>

                        <form action="<%=request.getContextPath()%>/login" method="post">
                            <c:if test="${param.message!=null}">
                                <div class="form-group">
                                    <div class="alert alert-warning" role="alert">
                                        ${param.message}
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.error!=null}">
                                <div class="form-group">
                                    <div class="alert alert-warning" role="alert">
                                        ${requestScope.error}
                                    </div>
                                </div>
                            </c:if>

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
                                <label for="username">Username</label>
                            </div>

                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
                                <label for="password">Password</label>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" onclick="showPassword()">
                                    <label class="form-check-label" for="exampleCheck1">Show Password</label>
                                </div>
                                <a href="<%=request.getContextPath ()%>/Views/Account/Forgot.jsp">Forgot Password</a>
                            </div>

                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Login</button>
                        </form>

                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/ComputerSale/LoginGoogleHandler&response_type=code&client_id=713098932367-stfph64pqcvd0hk2aer3kt7u8crlff48.apps.googleusercontent.com&approval_prompt=force">
                            <button class="btn btn-google container-fluid">
                                <i class="fab fa-google"></i> Login with Google
                            </button>
                        </a>

                        <p class="text-center mb-0">Don't have an Account? <a href="<%=request.getContextPath()%>/register">Sign Up</a></p>

                    </div>
                </div>
            </div>
        </div>                                        

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/lib/chart/chart.min.js"></script>
        <script src="<%=request.getContextPath()%>/lib/easing/easing.min.js"></script>
        <script src="<%=request.getContextPath()%>/lib/waypoints/waypoints.min.js"></script>
        <script src="<%=request.getContextPath()%>/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/lib/tempusdominus/js/moment.min.js"></script>
        <script src="<%=request.getContextPath()%>/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="<%=request.getContextPath()%>/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Template Javascript -->
        <script src="<%=request.getContextPath()%>/js/main.js"></script>
        <script>
                                        function showPassword() {
                                            var x = document.getElementById("password");
                                            if (x.type === "password") {
                                                x.type = "text";
                                            } else {
                                                x.type = "password";
                                            }
                                        }
        </script>
    </body>
</html>
