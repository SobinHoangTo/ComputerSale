<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Home</title>
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
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <!--            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>-->
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <%@include file="HeadFoot/EmployeeSidebar.jsp" %>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="HeadFoot/EmployeeNav.jsp" %>
                <!-- Navbar End -->


                <!-- Content Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <c:if test="${sessionScope.currentEmployee.getRole_id()==1}">
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light rounded h-100">
                                    <div class="card bg-light h-100">
                                        <div class="card-body">
                                            <h5 class="card-title">View Statistic</h5>
                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                            <a href="<%=request.getContextPath()%>/viewstatistic" class="btn btn-primary">View Statistics</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.currentEmployee.getRole_id()==2||sessionScope.currentEmployee.getRole_id()==1}">
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light rounded h-100">
                                    <div class="card bg-light h-100">
                                        <div class="card-body">
                                            <h5 class="card-title">Manage Account</h5>
                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                            <a href="<%=request.getContextPath()%>/manageaccount" class="btn btn-primary">Go to Account Management</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light rounded h-100">
                                    <div class="card bg-light h-100">
                                        <div class="card-body">
                                            <h5 class="card-title">Create New Account</h5>
                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                            <a href="<%=request.getContextPath()%>/addemployee" class="btn btn-primary">Go to Create New Account</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Staff History</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/staffhistory" class="btn btn-primary">Go to Staff History</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage Feedback</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/managefeedback" class="btn btn-primary">Go to Feedback Management</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage Orders</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/manageorders" class="btn btn-primary">Go to Orders Management</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage Products</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/manageproducts" class="btn btn-primary">Go to Product Management</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage News</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/managenews" class="btn btn-primary">Go to News Management</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage Discount</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/managediscount" class="btn btn-primary">Go to Discount Management</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage Brand</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/managebrand" class="btn btn-primary">Go to Brand Management</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100">
                                <div class="card bg-light h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Manage Warranty</h5>
                                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                        <a href="<%=request.getContextPath()%>/managewarranty" class="btn btn-primary">Go to Warranty Management</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content End -->


                <!-- Footer Start -->
                <%@include file="HeadFoot/EmployeeFooter.jsp" %>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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
