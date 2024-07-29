
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta charset="UTF-8">
        <title>Manage Serial Numbers</title>
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

        <script src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-webcomponent@2/dist/tinymce-webcomponent.min.js"></script>
        <script src="tinymce/tinymce.min.js"></script> 

        <style>
            .product-info img {
                max-width: 100%;
                height: auto;
                margin-top: 10px;
            }
            .vertical-line {
                border-left: 1px solid #dee2e6; /* Bootstrap's default border color */
                height: 100%;
                position: absolute;
                left: 50%;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Sidebar Start -->
            <%@include file="../HeadFoot/EmployeeSidebar.jsp" %>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="../HeadFoot/EmployeeNav.jsp" %>
                <!-- Navbar End -->

                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded justify-content-center mx-0">
                        <div class="container p-2">
                            <div class="row">
                                <div class="container col-md-12">
                                    <div class="container row">
                                        <div class="col-md-8">
                                            <h1 class="display-3 p-4">Manage Serial Numbers</h1>
                                        </div>
                                        <div class="col-md-4 d-flex justify-content-end align-items-center">
                                            <a href="manageproducts" class="btn btn-outline-primary">Come back Manage Products</a>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <c:if test="${not empty requestScope.alertMessage}">
                                            <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                                ${requestScope.alertMessage}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if>
                                        <div class="container mb-5">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h2 class="text-dark">${product.name}</h2>
                                                            <img src="<%=request.getContextPath()%>/Image/Products/${product.representImage}" class="img-fluid rounded mx-auto d-block mb-3" alt="${product.name} Image">
                                                            <ul class="list-group list-group-flush">
                                                                <li class="list-group-item"><strong>Name:</strong> ${product.name}</li>
                                                                <li class="list-group-item"><strong>CPU:</strong> ${product.CPU}</li>
                                                                <li class="list-group-item"><strong>GPU:</strong> ${product.GPU}</li>
                                                                <li class="list-group-item"><strong>RAM:</strong> ${product.RAM}</li>
                                                                <li class="list-group-item"><strong>ROM:</strong> ${product.ROM}</li>
                                                                <li class="list-group-item"><strong>Monitor:</strong> ${product.monitor}</li>
                                                                <li class="list-group-item"><strong>Operating System:</strong> ${product.OS}</li>
                                                                <li class="list-group-item"><strong>Description:</strong> ${product.description}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="vr"></div>
                                                    <div class="card mt-3 mt-md-0">
                                                        <div class="card-body">
                                                            <h3 class="card-title">Serial Numbers</h3>
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Serial Number</th>
                                                                        <th>Status</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${snList}" var="i">
                                                                        <tr>
                                                                            <td>${i.getSn()}</td>
                                                                            <td>${i.getSn_status()==1?"In stock":"Out Stock"}</td>
                                                                        </tr>
                                                                    </c:forEach>

                                                                    <!-- More rows as needed -->
                                                                </tbody>
                                                            </table>

                                                            <form class="input-group mt-3" action="manageserialnumber" method="post">
                                                                <input type="hidden" name="productID" value="${param.productID}">
                                                                <input type="number" name="quantity" class="form-control" placeholder="Enter quantity to add" required min="1" max="10">
                                                                <button class="btn btn-primary" type="submit">Submit</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Start -->
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
                <!-- Footer End -->
            </div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script> 

    </body>
</html>
