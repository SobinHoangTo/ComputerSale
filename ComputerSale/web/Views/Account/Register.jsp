<%-- 
    Document   : Signup
    Created on : May 14, 2024, 8:22:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="cssE/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="cssE/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid bg-light">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-8 col-xl-5">
                    <div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-center mb-3">
                            <a href="<%=request.getContextPath()%>/home" >
                                <img title="Back to Home" src="Image/laptop-icon.png" alt="Logo" class="img-fluid rounded" style="max-height: 100px;">
                            </a>
                            <h3>Sign Up</h3>
                        </div>


                        <form action="<%=request.getContextPath()%>/register" method="post">
                            <c:if test="${requestScope.error != null}">
                                <div class="form-group p-1">
                                    <div class="alert alert-warning" role="alert">
                                        ${requestScope.error}
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="email" placeholder="Email" name="email" value="${param.email}" required>
                                <label for="floatingText">Email</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="username" placeholder="Username" name="username" value="${param.username}" required>
                                <label for="floatingInput">Username</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                                <label for="floatingPassword">Password</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" id="checkPass" placeholder="Confirm your password" name="checkPass" required>
                                <label for="floatingPassword">Confirm Password</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="number" class="form-control" id="phone" placeholder="Phone number" name="phone" value="${param.phone}" required minlength="5" maxlength="10">
                                <label for="floatingPassword">Phone number</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="text" class="form-control" id="address" placeholder="Address" name="address" value="${param.address}" required>
                                <label for="floatingPassword">Address</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="text" class="form-control" id="firstname" placeholder="Firstname" name="firstname" value="${param.firstname}" required>
                                <label for="floatingPassword">First Name</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="text" class="form-control" id="lastname" placeholder="Lastname" name="lastname" value="${param.lastname}" required>
                                <label for="floatingPassword">Last Name</label>
                            </div>

                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Sign Up</button>
                        </form>
                        <p class="text-center mb-0">Already have an Account? <a href="<%=request.getContextPath()%>/login">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign Up End -->
    </div>

</body>
</html>
