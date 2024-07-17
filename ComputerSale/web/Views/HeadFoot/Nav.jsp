<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta charset="UTF-8">
        <title>Nav</title>
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
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid"  style="background-color: #DC143C;">
            <div class="container-fluid text-white py-2">
                <div class="d-flex align-items-center justify-content-between">
                    <!-- Button to open sidebar -->
                    <div class="me-3 display-6">
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon">
                                <i class="bi bi-list text-white"></i>
                            </span>
                        </button>
                    </div>
                    <!-- Sidebar canvas -->
                    <div class="offcanvas offcanvas-start text-bg-dark h5" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title display-3" id="offcanvasDarkNavbarLabel">Dashboard</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/viewstatistic" 
                                       class="text-light text-decoration-none mb-2">View statistic</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/manageaccount" 
                                       class="text-light text-decoration-none ">Manage Account</a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <hr/>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/" class="text-light text-decoration-none mb-2">Create Staff Account</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/" class="text-light text-decoration-none mb-2">Views Staff Modify History</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/managefeedback" class="text-light text-decoration-none mb-2">Manage Feedback</a>
                                </li>
                                <hr/>
                                <li><hr class="dropdown-divider"></li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/managewarranty" class="text-light text-decoration-none mb-2">Manage Warranty</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/managediscount" class="text-light text-decoration-none mb-2">Manage Discount</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/managenews" class="text-light text-decoration-none mb-2">Manage News</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/managebrand" class="text-light text-decoration-none mb-2">Manage Brand</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/" class="text-light text-decoration-none mb-2">Manage Category</a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/manageproducts" class="text-light text-decoration-none mb-2">Manage Products</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Search bar -->
                    <div class="flex-grow-1 mx-3" style="max-width: 400px;">
                        <form class="d-flex" role="search">
                            <div class="input-group">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <!-- Navigation Menu -->
                    <div>
                        <ul class="nav display-6">
                            <li class="nav-item">
                                <a class="nav-link text-white text-decoration-none" href="<%=request.getContextPath()%>/home">Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-light text-decoration-none" href="#" id="productsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Products
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="productsDropdown">
                                    <li><a class="dropdown-item" href="#">Category 1</a></li>
                                    <li class="dropdown-submenu dropstart">
                                        <a class="dropdown-item dropdown-toggle" href="#">Insert another dropdown here</a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Subcategory 1</a></li>
                                            <li><a class="dropdown-item" href="#">Subcategory 2</a></li>
                                        </ul>
                                    </li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/productslist">All Products</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white text-decoration-none" href="<%=request.getContextPath()%>/carts">
                                    Cart
                                    <span id="cartLength">${(sessionScope.cartLength!=0)?(sessionScope.cartLength):''}</span>
                                </a>
                            </li>
                            <li class="nav-item">  
                                <a class="nav-link text-white text-decoration-none" href="<%=request.getContextPath()%>/login">
                                    <i class="bi bi-box-arrow-in-right"></i>
                                </a>

                            </li>
                        </ul>
                    </div>
                </div>
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
